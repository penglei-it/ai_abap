/**
 * SAP ADT Fetch - Fetch ABAP objects via ADT API
 * - F12/Go to Definition: INCLUDE, REPORT, CLASS, INTERFACE 等（Language Server 不可用时的回退）
 * - 右键/命令: 获取不支持的对象（TTYP、TRAN 等）
 */

const vscode = require('vscode');
const path = require('path');
const fs = require('fs');
const { spawnSync } = require('child_process');

let _extensionContext = null; // 用于 getConnectionConfig 读取 workspaceState
/** @type {vscode.StatusBarItem | null} 状态栏：当前连接 集团 + 用户，点击可切换环境 */
let _statusBarItem = null;
/** @type {vscode.DiagnosticCollection | null} abaplint 诊断集合 */
let _abaplintDiagnostics = null;

// Folder name (Chinese/English) to SAP object type mapping
const FOLDER_TO_TYPE = {
  '表类型': 'TTYP',
  'Table Types': 'TTYP',
  '事务码': 'TRAN',
  '程序': 'PROG',
  '类': 'CLAS',
  '接口': 'INTF',
  '函数组': 'FUGR',
  '数据库表': 'TABL',
  '结构': 'STRU',
  'Structures': 'STRU',
  '数据元素': 'DTEL',
  '域': 'DOMA',
  '视图': 'VIEW',
  'CDS 视图': 'DDLS',
  'CDS Views': 'DDLS',
  'Programs': 'PROG',
  'Classes': 'CLAS',
  'Interfaces': 'INTF',
  'Dictionary': 'TABL',
  'GW Service Builder Projects': 'IWPR',
};

/**
 * 从当前行解析可跳转的 ABAP 对象（INCLUDE/REPORT/CLASS/INTERFACE 等）
 * @param {string} line - 当前行文本
 * @param {string} word - 光标下的单词
 * @returns {{ name: string, objectType: string } | null}
 */
function parseObjectFromLine(line, word) {
  const trimmed = line.trim();

  // INCLUDE xxx. 或 INCLUDE xxx（word 为空时也尝试解析整行）
  const includeMatch = trimmed.match(/INCLUDE\s+(\w+)/i);
  if (includeMatch) {
    const name = includeMatch[1].toUpperCase();
    const w = (word || '').toUpperCase();
    if (!word || w === name || w === 'INCLUDE' || name.includes(w)) {
      return { name, objectType: 'PROG' };
    }
  }
  if (!word) return null;

  // REPORT xxx. / PROGRAM xxx.
  const reportMatch = trimmed.match(/(?:REPORT|PROGRAM)\s+(\w+)/i);
  if (reportMatch && word.toUpperCase() === reportMatch[1].toUpperCase()) {
    return { name: reportMatch[1].toUpperCase(), objectType: 'PROG' };
  }

  // CLASS xxx DEFINITION / CLASS xxx IMPLEMENTATION
  const classMatch = trimmed.match(/CLASS\s+(\w+)\s+(?:DEFINITION|IMPLEMENTATION)/i);
  if (classMatch && word.toUpperCase() === classMatch[1].toUpperCase()) {
    return { name: classMatch[1].toUpperCase(), objectType: 'CLAS' };
  }

  // INTERFACE xxx.
  const intfMatch = trimmed.match(/INTERFACE\s+(\w+)/i);
  if (intfMatch && word.toUpperCase() === intfMatch[1].toUpperCase()) {
    return { name: intfMatch[1].toUpperCase(), objectType: 'INTF' };
  }

  return null;
}

function getScriptPath() {
  // 工作区可能只有 adt:// 虚拟根（无 fsPath），需找第一个包含 scripts 的本地路径
  const folders = vscode.workspace.workspaceFolders || [];
  for (const f of folders) {
    const fp = f.uri.fsPath;
    if (fp && typeof fp === 'string' && (fp.startsWith('/') || /^[A-Za-z]:/.test(fp))) {
      const scriptPath = path.join(fp, 'scripts', 'sap-adt-read-object.ps1');
      try {
        if (fs.existsSync(scriptPath)) return scriptPath;
      } catch (_) {}
    }
  }
  // 回退：扩展安装目录的上级（从 sap-adt-fetch 文件夹加载时，__dirname = .../sap-adt-fetch）
  const fallback = path.join(__dirname, '..', 'scripts', 'sap-adt-read-object.ps1');
  if (!fs.existsSync(fallback)) {
    const ws = (vscode.workspace.workspaceFolders || []).map(f => f.uri.toString());
    console.warn('[SAP ADT Fetch] 脚本未找到:', fallback, '工作区:', ws.join('; '));
  }
  return fallback;
}

/** 检索脚本路径：sap-adt-search-objects.ps1（与 getScriptPath 同目录） */
function getSearchScriptPath() {
  const readPath = getScriptPath();
  const dir = path.dirname(readPath);
  const searchScript = path.join(dir, 'sap-adt-search-objects.ps1');
  return fs.existsSync(searchScript) ? searchScript : '';
}

/** 写入脚本路径：sap-adt-write-object.ps1 */
function getWriteScriptPath() {
  const readPath = getScriptPath();
  const dir = path.dirname(readPath);
  return path.join(dir, 'sap-adt-write-object.ps1');
}

/** 传输请求脚本路径：sap-adt-transport.ps1 */
function getTransportScriptPath() {
  const readPath = getScriptPath();
  const dir = path.dirname(readPath);
  return path.join(dir, 'sap-adt-transport.ps1');
}

/** 查找引用脚本路径：sap-adt-references.ps1 */
function getReferencesScriptPath() {
  const readPath = getScriptPath();
  const dir = path.dirname(readPath);
  return path.join(dir, 'sap-adt-references.ps1');
}

/** 激活脚本路径：sap-adt-activate.ps1 */
function getActivateScriptPath() {
  const readPath = getScriptPath();
  const dir = path.dirname(readPath);
  return path.join(dir, 'sap-adt-activate.ps1');
}

/** 本地 abap 目录（ztmp 主程序与 include 所在目录） */
function getAbapDir() {
  const folders = vscode.workspace.workspaceFolders || [];
  for (const f of folders) {
    const fp = f.uri.fsPath;
    if (fp && typeof fp === 'string' && (fp.startsWith('/') || /^[A-Za-z]:/.test(fp))) {
      const abapDir = path.join(fp, 'abap');
      if (fs.existsSync(abapDir)) return abapDir;
    }
  }
  return path.join(path.dirname(getScriptPath()), '..', 'abap');
}

/**
 * 通过 ADT 检索对象列表。返回 { name, type }[]，失败或未支持时返回 []。
 * @param {string} query - 对象名或模式（如 Z*, ZTMP）
 * @param {string} objectType - PROG, CLAS, INTF, TABL 等
 * @returns {Promise<Array<{ name: string, type: string }>>}
 */
function searchObjectsViaAdt(query, objectType) {
  const scriptPath = getSearchScriptPath();
  if (!scriptPath) return Promise.resolve([]);
  const conn = getConnectionConfig();
  const args = [
    '-ExecutionPolicy', 'Bypass', '-File', scriptPath,
    '-Query', query, '-ObjectType', objectType,
    '-BaseUrl', conn.baseUrl
  ];
  if (conn.username) args.push('-Username', conn.username);
  if (conn.password) args.push('-Password', conn.password);
  if (conn.client) args.push('-Client', conn.client);

  return new Promise((resolve) => {
    try {
      const result = spawnSync('powershell', args, {
        encoding: 'utf8',
        timeout: 20000,
        windowsHide: true
      });
      const out = (result.stdout || '').trim();
      if (result.status !== 0 || !out) {
        resolve([]);
        return;
      }
      const parsed = JSON.parse(out);
      const arr = Array.isArray(parsed) ? parsed : (parsed ? [parsed] : []);
      resolve(arr.map(item => ({
        name: item.name || item.Name || '',
        type: (item.type || item.Type || objectType).toUpperCase()
      })).filter(x => x.name));
    } catch (_) {
      resolve([]);
    }
  });
}

/**
 * 通过 ADT/CTS API 列出传输请求。
 * @returns {Promise<Array<{ number: string, description: string, owner: string, status: string }>>}
 */
function listTransportsViaAdt() {
  const scriptPath = getTransportScriptPath();
  if (!scriptPath) return Promise.resolve([]);
  const conn = getConnectionConfig();
  const args = ['-ExecutionPolicy', 'Bypass', '-File', scriptPath, '-Action', 'list', '-BaseUrl', conn.baseUrl];
  if (conn.username) args.push('-Username', conn.username);
  if (conn.password) args.push('-Password', conn.password);
  if (conn.client) args.push('-Client', conn.client);

  return new Promise((resolve) => {
    try {
      const result = spawnSync('powershell', args, { encoding: 'utf8', timeout: 30000, windowsHide: true });
      const out = (result.stdout || '').trim();
      if (result.status !== 0 || !out) {
        resolve([]);
        return;
      }
      const parsed = JSON.parse(out);
      const arr = Array.isArray(parsed) ? parsed : (parsed ? [parsed] : []);
      resolve(arr.map(item => ({
        number: item.number || item.TransportRequest || item.trkorr || '',
        description: item.description || item.Description || item.as4text || '',
        owner: item.owner || item.Owner || item.as4user || '',
        status: item.status || item.Status || item.trfunction || 'M'
      })).filter(x => x.number));
    } catch (_) {
      resolve([]);
    }
  });
}

/**
 * 通过 ADT 查找对象引用（Where-Used）。
 * @param {string} objectName - 对象名
 * @param {string} objectType - 对象类型 PROG, CLAS, INTF 等
 * @returns {Promise<Array<{ name: string, type: string }>>}
 */
function findReferencesViaAdt(objectName, objectType) {
  const scriptPath = getReferencesScriptPath();
  if (!scriptPath) return Promise.resolve([]);
  const conn = getConnectionConfig();
  const args = [
    '-ExecutionPolicy', 'Bypass', '-File', scriptPath,
    '-ObjectName', objectName, '-ObjectType', objectType || 'PROG',
    '-BaseUrl', conn.baseUrl
  ];
  if (conn.username) args.push('-Username', conn.username);
  if (conn.password) args.push('-Password', conn.password);
  if (conn.client) args.push('-Client', conn.client);

  return new Promise((resolve) => {
    try {
      const result = spawnSync('powershell', args, { encoding: 'utf8', timeout: 30000, windowsHide: true });
      const out = (result.stdout || '').trim();
      if (result.status !== 0 || !out) {
        resolve([]);
        return;
      }
      const parsed = JSON.parse(out);
      const arr = Array.isArray(parsed) ? parsed : (parsed ? [parsed] : []);
      resolve(arr.map(item => ({
        name: item.name || '',
        type: (item.type || item.Type || 'PROG').toUpperCase()
      })).filter(x => x.name));
    } catch (_) {
      resolve([]);
    }
  });
}

/**
 * 通过 ADT 激活对象。尝试独立激活；失败时退化为保存并激活。
 * @param {string} objectName - 对象名
 * @param {string} objectType - 对象类型
 * @param {string} source - 源码内容（退化为 PUT 时必需）
 * @returns {Promise<{ success: boolean, message: string }>}
 */
function activateObjectViaAdt(objectName, objectType, source) {
  const scriptPath = getActivateScriptPath();
  if (!scriptPath) return Promise.resolve({ success: false, message: '脚本未找到' });
  const conn = getConnectionConfig();
  const args = [
    '-ExecutionPolicy', 'Bypass', '-File', scriptPath,
    '-ObjectName', objectName, '-ObjectType', objectType || 'PROG',
    '-BaseUrl', conn.baseUrl
  ];
  if (conn.username) args.push('-Username', conn.username);
  if (conn.password) args.push('-Password', conn.password);
  if (conn.client) args.push('-Client', conn.client);
  let sourceFile = '';
  if (source) {
    try {
      const tmpDir = require('os').tmpdir();
      sourceFile = path.join(tmpDir, `sap-adt-activate-${Date.now()}.abap`);
      fs.writeFileSync(sourceFile, source, 'utf8');
      args.push('-SourceFile', sourceFile);
    } catch (_) {
      args.push('-Source', source);
    }
  }

  return new Promise((resolve) => {
    try {
      const result = spawnSync('powershell', args, {
        encoding: 'utf8',
        timeout: 60000,
        windowsHide: true,
        maxBuffer: 10 * 1024 * 1024
      });
      const out = (result.stdout || '').trim();
      const err = (result.stderr || '').trim();
      if (result.status === 0) {
        resolve({ success: true, message: out || '已激活' });
      } else {
        resolve({ success: false, message: err || out || '激活失败' });
      }
    } catch (e) {
      resolve({ success: false, message: e.message || '执行失败' });
    } finally {
      if (sourceFile && fs.existsSync(sourceFile)) {
        try { fs.unlinkSync(sourceFile); } catch (_) {}
      }
    }
  });
}

/**
 * 获取连接配置。优先级：
 * 1. sapAdt.environments + activeEnvironment + workspaceState 中的账号（通过「连接环境」输入）
 * 2. sapAdt.baseUrl/username/password/client（单环境）
 * 3. abapfs.remote 第一个连接
 */
function getConnectionConfig() {
  const context = _extensionContext;
  const cfg = vscode.workspace.getConfiguration('sapAdt');
  const envs = cfg.get('environments');
  const activeEnv = cfg.get('activeEnvironment');
  const state = context ? context.globalState : null;

  // 多环境模式：有 environments 且 activeEnvironment 已设置
  if (envs && typeof envs === 'object' && activeEnv && envs[activeEnv]) {
    const env = envs[activeEnv];
    const baseUrl = (env.url || '').replace(/\/$/, '');
    const client = env.client || '200';
    // 从 workspaceState 读取登录时输入的账号（不存 settings 避免密码泄露）
    let username = state ? state.get(`sapAdt.credentials.${activeEnv}.username`) : null;
    let password = state ? state.get(`sapAdt.credentials.${activeEnv}.password`) : null;
    if (!username) {
      username = cfg.get('username') || env.username;
      password = password || cfg.get('password') || env.password;
    }
    if (baseUrl) {
      return { baseUrl, username, password, client, envName: activeEnv };
    }
  }

  // 单环境回退
  let baseUrl = cfg.get('baseUrl');
  let username = cfg.get('username');
  let password = cfg.get('password');
  let client = cfg.get('client') || '200';

  if (!baseUrl) {
    let remotes = vscode.workspace.getConfiguration('abapfs').get('remote');
    if (!remotes) remotes = vscode.workspace.getConfiguration().get('abapfs.remote');
    if (remotes && typeof remotes === 'object') {
      const first = Object.values(remotes).find(v => v && typeof v === 'object' && v.url);
      if (first) {
        baseUrl = (first.url || '').replace(/\/$/, '');
        username = username || first.username;
        password = password || first.password;
        client = client || first.client || '200';
      }
    }
  }

  return { baseUrl: baseUrl || '', username, password, client };
}

/**
 * 刷新状态栏：显示当前连接的集团（环境名）与用户，无连接时显示「未连接」。
 * 点击状态栏可切换环境（仍为单活动连接，多环境仅能快速切换、一次一个活动）。
 */
function refreshConnectionStatus() {
  if (!_statusBarItem) return;
  const cfg = vscode.workspace.getConfiguration('sapAdt');
  const envs = cfg.get('environments');
  const activeEnv = cfg.get('activeEnvironment');
  const state = _extensionContext ? _extensionContext.globalState : null;

  if (envs && activeEnv && envs[activeEnv]) {
    const username = state ? state.get(`sapAdt.credentials.${activeEnv}.username`) : null;
    const displayUser = (username && username.trim()) ? username.trim() : '(未保存用户)';
    _statusBarItem.text = `$(plug) SAP: ${activeEnv} (${displayUser})`;
    const savedEnvs = envs && state
      ? Object.keys(envs).filter(name => state.get(`sapAdt.credentials.${name}.username`))
      : [];
    _statusBarItem.tooltip = `当前连接: 集团/环境 ${activeEnv}，用户 ${displayUser}\n点击可切换环境。已保存账号: ${savedEnvs.length ? savedEnvs.join(', ') : '无'}`;
  } else {
    _statusBarItem.text = '$(plug) SAP: 未连接';
    _statusBarItem.tooltip = '点击选择环境并登录（一次一个活动连接，可保存多环境账号后快速切换）';
  }
  _statusBarItem.show();
}

function parseObjectFromPath(uriOrPath) {
  const str = typeof uriOrPath === 'string' ? uriOrPath : (uriOrPath.fsPath || uriOrPath.path || (typeof uriOrPath.toString === 'function' ? uriOrPath.toString() : ''));
  const parts = str.replace(/\\/g, '/').split('/');
  const fileName = parts[parts.length - 1] || '';
  const name = fileName.replace(/\.(txt|abap|prog|clas|intf)$/i, '');
  const folderName = parts[parts.length - 2] || '';
  let objectType = FOLDER_TO_TYPE[folderName];
  if (!objectType) {
    if (str.includes('表类型') || str.includes('Table Types')) objectType = 'TTYP';
    else if (str.includes('数据库表') || str.includes('Tables')) objectType = 'TABL';
    else if (str.includes('结构') || str.includes('Structures')) objectType = 'STRU';
    else if (str.includes('数据元素') || str.includes('Data Elements')) objectType = 'DTEL';
    else if (str.includes('域') || str.includes('Domains')) objectType = 'DOMA';
    else if (str.includes('CDS') || str.includes('ddl') || /\.ddls\./i.test(str)) objectType = 'DDLS';
    else if (str.includes('GW Service Builder Projects') || /ZGS_/i.test(name)) objectType = 'IWPR';
    else objectType = 'PROG';
  }
  return { name, objectType };
}

/**
 * GW Service (SEGW) 项目对应的 MPC/DPC 类名（标准命名，作为回退）
 * 约定：CL_<项目名>_MPC, CL_<项目名>_MPC_EXT, CL_<项目名>_DPC, CL_<项目名>_DPC_EXT
 */
function getGwServiceClassNamesFallback(projectName) {
  const base = (projectName || '').replace(/\.txt$/i, '').trim().toUpperCase();
  if (!base) return [];
  return [
    { label: 'DPC 扩展类', className: `CL_${base}_DPC_EXT`, desc: '数据提供扩展，业务逻辑主要在此' },
    { label: 'MPC 扩展类', className: `CL_${base}_MPC_EXT`, desc: '模型提供扩展' },
    { label: 'DPC 基类', className: `CL_${base}_DPC`, desc: '数据提供基类（系统生成）' },
    { label: 'MPC 基类', className: `CL_${base}_MPC`, desc: '模型提供基类（系统生成）' }
  ];
}

/**
 * 通过 ADT 搜索 GW Service 的 Runtime Artifacts（实际生成的类名，如 ZCL_xxx_58_DPC_EXT）
 * 项目名较长时 SAP 会截断并加数字后缀，需通过搜索获取真实名称
 * @param {string} projectName - SEGW 项目名，如 ZGS_ICERP_CASSINT_APP
 * @returns {Promise<Array<{ label: string, className: string, desc: string }>>}
 */
async function searchGwServiceRuntimeArtifacts(projectName) {
  const base = (projectName || '').replace(/\.txt$/i, '').trim().toUpperCase();
  if (!base) return [];

  // 搜索模式：SAP 生成类如 ZCL_ZGS_ICERP_CASSI_58_DPC（项目名截断+数字后缀）
  const baseWithoutSuffix = base.replace(/_APP$|_SRV$|_MDL$/i, '');
  const shortPrefix = baseWithoutSuffix.slice(0, 14);
  const searchPattern = `*${shortPrefix}*`;
  const results = await searchObjectsViaAdt(searchPattern, 'CLAS');
  if (!results || results.length === 0) return getGwServiceClassNamesFallback(projectName);

  const artifacts = [];
  const seen = new Set();
  const types = [
    { test: n => /_DPC_EXT$/i.test(n), label: 'DPC 扩展类', desc: '数据提供扩展，业务逻辑主要在此' },
    { test: n => /_MPC_EXT$/i.test(n), label: 'MPC 扩展类', desc: '模型提供扩展' },
    { test: n => /_DPC$/i.test(n) && !/_DPC_EXT$/i.test(n), label: 'DPC 基类', desc: '系统生成' },
    { test: n => /_MPC$/i.test(n) && !/_MPC_EXT$/i.test(n), label: 'MPC 基类', desc: '系统生成' }
  ];
  for (const t of types) {
    const match = results.find(r => t.test(r.name));
    if (match && !seen.has(match.name)) {
      seen.add(match.name);
      artifacts.push({ label: t.label, className: match.name, desc: t.desc });
    }
  }
  // 补充搜索未覆盖的（按标准命名）
  if (artifacts.length === 0) return getGwServiceClassNamesFallback(projectName);
  return artifacts;
}

/**
 * 从 GW Service 项目跳转到相关 MPC/DPC 类
 * @param {string} projectName - SEGW 项目名，如 ZGS_CASSINTAPP_BASESERVICE
 */
async function gotoGwServiceClasses(projectName) {
  const name = (projectName || '').trim();
  if (!name || !/^ZGS_/i.test(name)) {
    vscode.window.showWarningMessage('无法解析 GW Service 项目名，请确认格式为 ZGS_xxx');
    return;
  }
  const statusBar = vscode.window.setStatusBarMessage('正在搜索 Runtime Artifacts...');
  let classes = [];
  try {
    classes = await searchGwServiceRuntimeArtifacts(name);
  } finally {
    statusBar.dispose();
  }
  if (classes.length === 0) {
    vscode.window.showWarningMessage('未找到 Runtime Artifacts，请先在 SEGW 中生成项目');
    return;
  }
  const selected = await vscode.window.showQuickPick(
    classes.map(c => ({
      label: c.label,
      description: c.className,
      detail: c.desc,
      className: c.className
    })),
    { placeHolder: '选择要打开的 Runtime Artifact（DPC 扩展类含主要业务逻辑）', matchOnDescription: true }
  );
  if (!selected) return;
  try {
    await fetchAndShow(selected.className, 'CLAS');
  } catch (err) {
    vscode.window.showErrorMessage(`打开失败: ${err.message}。若类不存在，请先在 SEGW 中生成项目。`);
  }
}

function activate(context) {
  _extensionContext = context;

  // ========== 状态栏：当前连接 集团 + 用户，点击可切换环境 ==========
  _statusBarItem = vscode.window.createStatusBarItem(vscode.StatusBarAlignment.Right, 90);
  _statusBarItem.command = 'sapAdt.connectToEnvironment';
  context.subscriptions.push(_statusBarItem);
  refreshConnectionStatus();
  context.subscriptions.push(
    vscode.workspace.onDidChangeConfiguration(e => {
      if (e.affectsConfiguration('sapAdt')) refreshConnectionStatus();
    })
  );

  // ========== DefinitionProvider：F12 跳转（Language Server 不可用时的回退）==========
  const definitionProvider = vscode.languages.registerDefinitionProvider('abap', {
    async provideDefinition(document, position, token) {
      const line = document.lineAt(position).text;
      const wordRange = document.getWordRangeAtPosition(position, /\w+/);
      const word = wordRange ? document.getText(wordRange) : '';

      const parsed = parseObjectFromLine(line, word);
      if (!parsed) return null;

      try {
        const content = await fetchViaAdt(parsed.name, parsed.objectType);
        const doc = await vscode.workspace.openTextDocument({
          content,
          language: 'abap'
        });
        return new vscode.Location(doc.uri, new vscode.Position(0, 0));
      } catch (err) {
        return null; // 静默失败，让其他 provider 尝试
      }
    }
  });
  context.subscriptions.push(definitionProvider);

  // ========== DocumentSymbolProvider：类结构大纲（类似 SAP 方法列表，Ctrl+Shift+O 或左侧大纲，点击方法可跳转）==========
  const abapDocumentSymbolProvider = vscode.languages.registerDocumentSymbolProvider(
    { language: 'abap' },
    {
      provideDocumentSymbols(document) {
        const symbols = [];
        const text = document.getText();
        const lines = text.split(/\r?\n/);

        let classImpl = null;
        let inImpl = false;
        for (let i = 0; i < lines.length; i++) {
          const line = lines[i];
          const trimmed = line.trim();
          const lineNum = i;

          const classDefMatch = trimmed.match(/^CLASS\s+(\w+)\s+DEFINITION/i);
          if (classDefMatch) {
            inImpl = false;
            symbols.push(new vscode.DocumentSymbol(
              classDefMatch[1],
              '类定义',
              vscode.SymbolKind.Class,
              new vscode.Range(lineNum, 0, lineNum, line.length),
              new vscode.Range(lineNum, 0, lineNum, line.length)
            ));
            continue;
          }

          const classImplMatch = trimmed.match(/^CLASS\s+(\w+)\s+IMPLEMENTATION/i);
          if (classImplMatch) {
            inImpl = true;
            classImpl = new vscode.DocumentSymbol(
              classImplMatch[1],
              '类实现',
              vscode.SymbolKind.Class,
              new vscode.Range(lineNum, 0, lineNum, line.length),
              new vscode.Range(lineNum, 0, lineNum, line.length)
            );
            symbols.push(classImpl);
            continue;
          }

          const methodMatch = trimmed.match(/^\s*METHOD\s+([\w\/~]+)/i);
          if (methodMatch && inImpl && classImpl) {
            const methodName = methodMatch[1];
            let endLine = lineNum;
            for (let j = lineNum + 1; j < lines.length; j++) {
              if (/^\s*ENDMETHOD\s*\.?\s*$/i.test(lines[j].trim())) {
                endLine = j;
                break;
              }
            }
            const range = new vscode.Range(lineNum, 0, endLine, (lines[endLine] || '').length);
            const methodSymbol = new vscode.DocumentSymbol(
              methodName,
              '方法',
              vscode.SymbolKind.Method,
              range,
              range
            );
            classImpl.children.push(methodSymbol);
            continue;
          }

          if (/^\s*ENDCLASS\s*\.?\s*$/i.test(trimmed)) {
            inImpl = false;
            classImpl = null;
          }
        }

        if (symbols.length === 0) {
          const reportMatch = text.match(/(?:REPORT|PROGRAM)\s+(\w+)/i);
          if (reportMatch) {
            symbols.push(new vscode.DocumentSymbol(
              reportMatch[1],
              '程序',
              vscode.SymbolKind.Module,
              new vscode.Range(0, 0, 0, 0),
              new vscode.Range(0, 0, 0, 0)
            ));
          }
        }
        return symbols;
      }
    }
  );
  context.subscriptions.push(abapDocumentSymbolProvider);

  // ========== Tree View：ABAP 类结构（侧边栏，类似 SAP 资源库浏览器，点击方法可定位）==========
  class AbapClassStructureProvider {
    constructor() {
      this._onDidChangeTreeData = new vscode.EventEmitter();
      this.onDidChangeTreeData = this._onDidChangeTreeData.event;
    }
    refresh() {
      this._onDidChangeTreeData.fire();
    }
    getTreeItem(element) {
      return element;
    }
    async getChildren(element) {
      const editor = vscode.window.activeTextEditor;
      if (!editor || editor.document.languageId !== 'abap') return [];
      if (element) return element.children || [];

      const symbols = await vscode.commands.executeCommand(
        'vscode.executeDocumentSymbolProvider',
        editor.document.uri
      );
      if (!symbols || !Array.isArray(symbols)) return [];

      const items = [];
      for (const sym of symbols) {
        const item = new vscode.TreeItem(
          sym.name,
          sym.children?.length ? vscode.TreeItemCollapsibleState.Expanded : vscode.TreeItemCollapsibleState.None
        );
        item.command = {
          command: 'sapAdt.revealMethodInEditor',
          title: '定位',
          arguments: [editor.document.uri, sym.range]
        };
        item.contextValue = sym.kind === vscode.SymbolKind.Method ? 'method' : 'class';
        if (sym.children?.length) {
          item.children = sym.children.map(c => {
            const child = new vscode.TreeItem(c.name, vscode.TreeItemCollapsibleState.None);
            child.command = {
              command: 'sapAdt.revealMethodInEditor',
              title: '定位',
              arguments: [editor.document.uri, c.range]
            };
            child.contextValue = 'method';
            return child;
          });
        }
        items.push(item);
      }
      return items;
    }
  }
  const classStructureProvider = new AbapClassStructureProvider();
  vscode.window.registerTreeDataProvider('sapAdt.classStructure', classStructureProvider);
  context.subscriptions.push(
    vscode.window.onDidChangeActiveTextEditor(() => classStructureProvider.refresh())
  );
  context.subscriptions.push(
    vscode.workspace.onDidChangeTextDocument(() => classStructureProvider.refresh())
  );
  context.subscriptions.push(
    vscode.commands.registerCommand('sapAdt.revealMethodInEditor', (uri, range) => {
      vscode.window.showTextDocument(uri, { selection: range, preserveFocus: false });
    })
  );

  // ========== CodeLens：GW Service 占位文件中显示 Runtime Artifacts（可点击跳转，类似 SEGW 树）==========
  const gwServiceCodeLensProvider = {
    async provideCodeLenses(document, token) {
      const content = document.getText();
      const pathStr = (document.uri.fsPath || document.uri.path || document.uri.toString() || '').replace(/\\/g, '/');
      const isGwServicePath = pathStr.includes('GW Service') || pathStr.includes('GW Service Builder') || /ZGS_/i.test(pathStr);
      if (!content.includes('This object type is not supported') && !isGwServicePath) {
        return [];
      }
      const { name, objectType } = parseObjectFromPath(document.uri);
      if (objectType !== 'IWPR' && !/^ZGS_/i.test(name)) return [];
      const classes = await searchGwServiceRuntimeArtifacts(name);
      if (classes.length === 0) return [];
      const range = new vscode.Range(0, 0, 0, 100);
      return classes.map((c) => ({
        range,
        command: {
          title: `▶ ${c.label}: ${c.className}`,
          command: 'sapAdt.openClassFromCodeLens',
          arguments: [c.className]
        }
      }));
    }
  };
  // 覆盖 plaintext/abap，以及 ABAP FS 虚拟文件（scheme: abapfs）、任意 .txt
  context.subscriptions.push(
    vscode.languages.registerCodeLensProvider(
      [
        { language: 'plaintext' },
        { language: 'abap' },
        { scheme: 'abapfs' },
        { pattern: '**/*ZGS_*.txt' }
      ],
      gwServiceCodeLensProvider
    )
  );

  // ========== 右键/命令：获取对象 ==========
  const disposable = vscode.commands.registerCommand('sapAdt.fetchUnsupportedObject', async () => {
    const editor = vscode.window.activeTextEditor;
    if (!editor) {
      vscode.window.showWarningMessage('No active editor. Open an ABAP object first.');
      return;
    }

    const doc = editor.document;
    const content = doc.getText();
    const uri = doc.uri;
    const pathStr = uri.fsPath || uri.path || '';
    const pos = editor.selection.active;
    const line = doc.lineAt(pos).text;
    const wordRange = doc.getWordRangeAtPosition(pos, /\w+/);
    const word = wordRange ? doc.getText(wordRange) : '';

    // 优先：从当前行解析 INCLUDE/REPORT/CLASS/INTERFACE
    const parsed = parseObjectFromLine(line, word);
    if (parsed) {
      await fetchAndShow(parsed.name, parsed.objectType);
      return;
    }

    // Check if this is an unsupported object (has the placeholder text)
    const isUnsupported = content.includes('This object type is not supported') ||
      content.trim() === 'This object type is not supported in VS Code.';

    if (!isUnsupported && !pathStr.includes('System Library') && !pathStr.includes('Dictionary')) {
      const objName = await vscode.window.showInputBox({
        prompt: 'Enter ABAP object name (e.g. ZTMP, SAPMZICERP_0001_I01)',
        placeHolder: 'ZTMP'
      });
      if (!objName) return;

      const objType = await vscode.window.showQuickPick(
        ['PROG', 'CLAS', 'TTYP', 'TABL', 'STRU', 'INTF', 'DTEL', 'DOMA', 'FUGR', 'VIEW', 'DDLS'],
        { placeHolder: 'Select object type' }
      );
      if (!objType) return;

      await fetchAndShow(objName, objType);
      return;
    }

    const { name, objectType } = parseObjectFromPath(uri);
    if (objectType === 'IWPR') {
      await gotoGwServiceClasses(name);
    } else {
      await fetchAndShow(name, objectType);
    }
  });

  context.subscriptions.push(disposable);

  // ========== 显式「跳转」命令：F12 无效时可用 Ctrl+Shift+P 输入此命令 ==========
  // ========== 诊断命令：输出脚本路径、连接配置等 ==========
  const diagnoseCmd = vscode.commands.registerCommand('sapAdt.diagnose', async () => {
    const scriptPath = getScriptPath();
    const scriptExists = fs.existsSync(scriptPath);
    const conn = getConnectionConfig();
    const editor = vscode.window.activeTextEditor;
    let lineInfo = '(无活动编辑器)';
    if (editor) {
      const pos = editor.selection.active;
      const line = editor.document.lineAt(pos).text;
      const wordRange = editor.document.getWordRangeAtPosition(pos, /\w+/);
      const word = wordRange ? editor.document.getText(wordRange) : '';
      const parsed = parseObjectFromLine(line, word);
      lineInfo = `行: "${line.trim()}" | 光标词: "${word}" | 解析: ${parsed ? `${parsed.objectType} ${parsed.name}` : '无'}`;
    }
    const wsFolders = (vscode.workspace.workspaceFolders || []).map(f => `${f.uri.scheme}: ${f.uri.fsPath || f.uri.path || f.uri.toString()}`).join('; ');
    const msg = [
      '=== SAP ADT Fetch 诊断 ===',
      `脚本路径: ${scriptPath}`,
      `脚本存在: ${scriptExists}`,
      `连接: ${conn.baseUrl} (client ${conn.client})`,
      `工作区: ${wsFolders || '(空)'}`,
      `当前: ${lineInfo}`
    ].join('\n');
    const doc = await vscode.workspace.openTextDocument({ content: msg, language: 'plaintext' });
    await vscode.window.showTextDocument(doc, { preview: false });
  });
  context.subscriptions.push(diagnoseCmd);

  // ========== 连接环境：选择环境并输入账号 ==========
  const connectCmd = vscode.commands.registerCommand('sapAdt.connectToEnvironment', async () => {
    const cfg = vscode.workspace.getConfiguration('sapAdt');
    const envs = cfg.get('environments');
    if (!envs || typeof envs !== 'object' || Object.keys(envs).length === 0) {
      vscode.window.showWarningMessage('请先在设置中配置 sapAdt.environments，例如：{ "MY_ENV": { "url": "http://host:8001", "client": "200" } }');
      return;
    }
    const envNames = Object.keys(envs);
    const selected = await vscode.window.showQuickPick(envNames.map(name => ({
      label: name,
      description: `${envs[name].url || ''} (client ${envs[name].client || '200'})`
    })), { placeHolder: '选择要连接的环境' });
    if (!selected) return;

    const envName = selected.label;
    const username = await vscode.window.showInputBox({
      prompt: `输入 SAP 用户名 (${envName})`,
      placeHolder: 'SAP username',
      value: context.globalState.get(`sapAdt.credentials.${envName}.username`) || ''
    });
    if (username === undefined) return; // 用户取消

    const password = await vscode.window.showInputBox({
      prompt: `输入 SAP 密码 (${envName})`,
      placeHolder: '********',
      password: true
    });
    if (password === undefined) return;

    // 保存到 globalState（会话内有效，不写入 settings.json）
    context.globalState.update(`sapAdt.credentials.${envName}.username`, username);
    context.globalState.update(`sapAdt.credentials.${envName}.password`, password);

    // 设置当前激活环境
    await cfg.update('activeEnvironment', envName, vscode.ConfigurationTarget.Global);

    refreshConnectionStatus();
    vscode.window.showInformationMessage(`已连接环境: ${envName} (用户 ${username})`);
  });
  context.subscriptions.push(connectCmd);

  // ========== CodeLens 点击：直接打开指定类 ==========
  context.subscriptions.push(
    vscode.commands.registerCommand('sapAdt.openClassFromCodeLens', async (className) => {
      if (!className || typeof className !== 'string') return;
      try {
        await fetchAndShow(className, 'CLAS');
      } catch (err) {
        vscode.window.showErrorMessage(`打开失败: ${err.message}。若类不存在，请先在 SEGW 中生成项目。`);
      }
    })
  );

  // ========== GW Service：跳转到 MPC/DPC 相关类 ==========
  const gotoGwServiceCmd = vscode.commands.registerCommand('sapAdt.gotoGwServiceClasses', async () => {
    const editor = vscode.window.activeTextEditor;
    let projectName = '';
    if (editor) {
      const uri = editor.document.uri;
      const content = editor.document.getText();
      const isUnsupported = content.includes('This object type is not supported');
      if (isUnsupported) {
        const { name, objectType } = parseObjectFromPath(uri);
        if (objectType === 'IWPR' || /^ZGS_/i.test(name)) projectName = name;
      }
    }
    if (!projectName) {
      projectName = await vscode.window.showInputBox({
        prompt: '输入 GW Service 项目名（如 ZGS_CASSINTAPP_BASESERVICE）',
        placeHolder: 'ZGS_xxx',
        value: projectName
      });
    }
    if (projectName) await gotoGwServiceClasses(projectName);
  });
  context.subscriptions.push(gotoGwServiceCmd);

  // ========== 传输请求：选择/列出 ==========
  const selectTransportCmd = vscode.commands.registerCommand('sapAdt.selectTransportRequest', async () => {
    const conn = getConnectionConfig();
    if (!conn.baseUrl || !conn.username) {
      vscode.window.showWarningMessage('请先连接环境（SAP ADT: 连接环境）');
      return;
    }
    const statusBar = vscode.window.setStatusBarMessage('正在获取传输请求列表...');
    let transports = [];
    try {
      transports = await listTransportsViaAdt();
    } finally {
      statusBar.dispose();
    }
    if (transports.length === 0) {
      vscode.window.showWarningMessage('未获取到传输请求。请确认：1) 已连接 2) 系统支持 CTS API');
      return;
    }
    const selected = await vscode.window.showQuickPick(
      transports.map(t => ({
        label: t.number,
        description: t.description || '(无描述)',
        detail: `所有者: ${t.owner} | 状态: ${t.status}`,
        transport: t
      })),
      { placeHolder: '选择传输请求（将用于后续保存）', matchOnDescription: true }
    );
    if (!selected) return;
    await context.workspaceState.update('sapAdt.selectedTransport', selected.transport.number);
    vscode.window.showInformationMessage(`已选择传输: ${selected.transport.number}`);
  });

  const listTransportsCmd = vscode.commands.registerCommand('sapAdt.listTransports', async () => {
    const conn = getConnectionConfig();
    if (!conn.baseUrl || !conn.username) {
      vscode.window.showWarningMessage('请先连接环境（SAP ADT: 连接环境）');
      return;
    }
    const statusBar = vscode.window.setStatusBarMessage('正在获取传输请求列表...');
    let transports = [];
    try {
      transports = await listTransportsViaAdt();
    } finally {
      statusBar.dispose();
    }
    if (transports.length === 0) {
      vscode.window.showWarningMessage('未获取到传输请求。');
      return;
    }
    const lines = transports.map(t => `${t.number} | ${t.description || ''} | ${t.owner} | ${t.status}`);
    const doc = await vscode.workspace.openTextDocument({ content: lines.join('\n'), language: 'plaintext' });
    await vscode.window.showTextDocument(doc, { preview: false });
  });

  context.subscriptions.push(selectTransportCmd, listTransportsCmd);

  // ========== 查找引用（Where-Used）==========
  const findReferencesCmd = vscode.commands.registerCommand('sapAdt.findReferences', async () => {
    const editor = vscode.window.activeTextEditor;
    let objectName = '';
    let objectType = 'PROG';
    if (editor) {
      const uri = editor.document.uri;
      const content = editor.document.getText();
      const pos = editor.selection.active;
      const line = editor.document.lineAt(pos).text;
      const wordRange = editor.document.getWordRangeAtPosition(pos, /\w+/);
      const word = wordRange ? editor.document.getText(wordRange) : '';
      const parsed = parseObjectFromLine(line, word);
      if (parsed) {
        objectName = parsed.name;
        objectType = parsed.objectType;
      } else {
        const { name, objectType: ot } = parseObjectFromPath(uri);
        if (name) {
          objectName = name;
          objectType = ot || 'PROG';
        } else if (word) {
          objectName = word.toUpperCase();
        }
      }
    }
    if (!objectName) {
      const input = await vscode.window.showInputBox({
        prompt: '输入要查找引用的对象名',
        placeHolder: 'ZTMP, ZCL_XXX'
      });
      if (!input) return;
      objectName = input.trim().toUpperCase();
      objectType = await vscode.window.showQuickPick(
        ['PROG', 'CLAS', 'INTF', 'TABL', 'TTYP', 'STRU', 'DTEL', 'VIEW', 'DDLS'],
        { placeHolder: '选择对象类型' }
      ) || 'PROG';
    }
    const statusBar = vscode.window.setStatusBarMessage('正在查找引用...');
    let refs = [];
    try {
      refs = await findReferencesViaAdt(objectName, objectType);
    } finally {
      statusBar.dispose();
    }
    if (refs.length === 0) {
      vscode.window.showInformationMessage(`未找到 ${objectName} 的引用。若系统不支持 references 接口，可尝试按名称搜索。`);
      return;
    }
    const selected = await vscode.window.showQuickPick(
      refs.map(r => ({
        label: r.name,
        description: r.type,
        ...r
      })),
      { placeHolder: `选择要打开的引用（共 ${refs.length} 个）`, matchOnDescription: true }
    );
    if (!selected) return;
    try {
      await fetchAndShow(selected.name, selected.type);
    } catch (err) {
      vscode.window.showErrorMessage(`打开失败: ${err.message}`);
    }
  });
  context.subscriptions.push(findReferencesCmd);

  // ========== 仅激活命令 ==========
  const activateObjectCmd = vscode.commands.registerCommand('sapAdt.activateObject', async () => {
    const editor = vscode.window.activeTextEditor;
    if (!editor) {
      vscode.window.showWarningMessage('请先打开 ABAP 对象文件');
      return;
    }
    const doc = editor.document;
    const uri = doc.uri;
    const content = doc.getText();
    const { name, objectType } = parseObjectFromPath(uri);
    let objectName = name;
    let objType = objectType;
    if (!objectName) {
      const line = doc.lineAt(0).text;
      const classMatch = line.match(/CLASS\s+(\w+)/i);
      const reportMatch = line.match(/(?:REPORT|PROGRAM)\s+(\w+)/i);
      const intfMatch = line.match(/INTERFACE\s+(\w+)/i);
      if (classMatch) {
        objectName = classMatch[1].toUpperCase();
        objType = 'CLAS';
      } else if (reportMatch) {
        objectName = reportMatch[1].toUpperCase();
        objType = 'PROG';
      } else if (intfMatch) {
        objectName = intfMatch[1].toUpperCase();
        objType = 'INTF';
      }
    }
    if (!objectName) {
      objectName = await vscode.window.showInputBox({ prompt: '输入对象名', placeHolder: 'ZTMP' });
      if (!objectName) return;
      objectName = objectName.trim().toUpperCase();
      objType = await vscode.window.showQuickPick(
        ['PROG', 'CLAS', 'INTF', 'TABL', 'TTYP', 'STRU', 'DTEL', 'VIEW', 'DDLS'],
        { placeHolder: '选择对象类型' }
      ) || 'PROG';
    }
    const statusBar = vscode.window.setStatusBarMessage('正在激活...');
    let result;
    try {
      result = await activateObjectViaAdt(objectName, objType, content);
    } finally {
      statusBar.dispose();
    }
    if (result.success) {
      vscode.window.showInformationMessage(result.message || `已激活 ${objectName}`);
    } else {
      vscode.window.showErrorMessage(result.message || `激活失败: ${objectName}`);
    }
  });
  context.subscriptions.push(activateObjectCmd);

  // ========== ABAP 源码对比：当前版本 vs SAP 服务器版本 ==========
  const compareWithSapCmd = vscode.commands.registerCommand('sapAdt.compareWithSap', async () => {
    const editor = vscode.window.activeTextEditor;
    if (!editor) {
      vscode.window.showWarningMessage('请先打开要对比的 ABAP 对象文件');
      return;
    }
    const doc = editor.document;
    const uri = doc.uri;
    const { name, objectType } = parseObjectFromPath(uri);
    let objectName = name;
    let objType = objectType;
    if (!objectName) {
      const line = doc.lineAt(0).text;
      const classMatch = line.match(/CLASS\s+(\w+)/i);
      const reportMatch = line.match(/(?:REPORT|PROGRAM)\s+(\w+)/i);
      const intfMatch = line.match(/INTERFACE\s+(\w+)/i);
      if (classMatch) {
        objectName = classMatch[1].toUpperCase();
        objType = 'CLAS';
      } else if (reportMatch) {
        objectName = reportMatch[1].toUpperCase();
        objType = 'PROG';
      } else if (intfMatch) {
        objectName = intfMatch[1].toUpperCase();
        objType = 'INTF';
      }
    }
    if (!objectName) {
      objectName = await vscode.window.showInputBox({ prompt: '输入对象名', placeHolder: 'ZTMP' });
      if (!objectName) return;
      objectName = objectName.trim().toUpperCase();
      objType = await vscode.window.showQuickPick(
        ['PROG', 'CLAS', 'INTF', 'TABL', 'TTYP', 'STRU', 'DTEL', 'VIEW', 'DDLS'],
        { placeHolder: '选择对象类型' }
      ) || 'PROG';
    }
    try {
      await vscode.window.withProgress({
        location: vscode.ProgressLocation.Notification,
        title: `正在拉取 SAP 服务器版本: ${objectName}...`
      }, async () => {
        const remoteContent = await fetchViaAdt(objectName, objType);
        const rightDoc = await vscode.workspace.openTextDocument({
          content: remoteContent,
          language: 'abap'
        });
        const title = `${objectName} (当前 vs SAP 服务器)`;
        await vscode.commands.executeCommand('vscode.diff', uri, rightDoc.uri, title);
      });
    } catch (err) {
      vscode.window.showErrorMessage(`对比失败: ${err.message}。请确认已连接环境且对象存在。`);
    }
  });
  context.subscriptions.push(compareWithSapCmd);

  // ========== abaplint 集成 ==========
  _abaplintDiagnostics = vscode.languages.createDiagnosticCollection('abaplint');
  context.subscriptions.push(_abaplintDiagnostics);

  async function runAbaplintForDocument(document) {
    if (!document || document.languageId !== 'abap') return;
    const cfg = vscode.workspace.getConfiguration('sapAdt');
    if (!cfg.get('abaplint.enabled', true)) return;
    const wsFolders = vscode.workspace.workspaceFolders || [];
    const rootPath = wsFolders[0]?.uri?.fsPath || path.dirname(document.uri.fsPath || '');
    const docPath = document.uri.fsPath;
    if (!docPath) return;

    const cmd = process.platform === 'win32' ? 'npx.cmd' : 'npx';
    const args = ['abaplint', '--format', 'json'];
    try {
      const result = spawnSync(cmd, args, {
        encoding: 'utf8',
        timeout: 30000,
        cwd: rootPath,
        maxBuffer: 5 * 1024 * 1024
      });
      const out = (result.stdout || result.stderr || '').trim();
      const diagnostics = [];
      if (out && (out.startsWith('[') || out.startsWith('{'))) {
        try {
          const json = JSON.parse(out);
          const issues = Array.isArray(json) ? json : (json.issues || json.files ? Object.values(json.files || {}).flat() : []);
          for (const issue of issues) {
            const file = issue.filename || issue.file || docPath;
            if (file !== docPath && path.resolve(file) !== path.resolve(docPath)) continue;
            const line = Math.max(0, (issue.line || issue.start?.row || 1) - 1);
            const col = Math.max(0, (issue.column || issue.start?.col || 0) - 1);
            const msg = issue.message || issue.description || 'abaplint';
            const sev = (issue.severity || issue.type || 'info').toLowerCase();
            const severity = sev === 'error' ? vscode.DiagnosticSeverity.Error :
              sev === 'warning' ? vscode.DiagnosticSeverity.Warning :
                vscode.DiagnosticSeverity.Information;
            diagnostics.push(new vscode.Diagnostic(
              new vscode.Range(line, col, line, col + 100),
              msg,
              severity
            ));
          }
        } catch (_) {
          const lineMatch = out.match(/([^:]+):(\d+):(\d*):?\s*(.+)/);
          if (lineMatch) {
            const line = Math.max(0, parseInt(lineMatch[2], 10) - 1);
            const col = Math.max(0, parseInt(lineMatch[3] || '0', 10));
            diagnostics.push(new vscode.Diagnostic(
              new vscode.Range(line, col, line, col + 100),
              lineMatch[4] || 'abaplint',
              vscode.DiagnosticSeverity.Warning
            ));
          }
        }
      }
      _abaplintDiagnostics.set(document.uri, diagnostics);
    } catch (_) {
      _abaplintDiagnostics.set(document.uri, []);
    }
  }

  const runAbaplintCmd = vscode.commands.registerCommand('sapAdt.runAbaplint', async () => {
    const editor = vscode.window.activeTextEditor;
    const doc = editor?.document;
    if (!doc || doc.languageId !== 'abap') {
      vscode.window.showWarningMessage('请先打开 ABAP 文件。需安装 abaplint: npm i -g abaplint');
      return;
    }
    const statusBar = vscode.window.setStatusBarMessage('正在运行 abaplint...');
    try {
      await runAbaplintForDocument(doc);
      vscode.window.showInformationMessage('abaplint 检查完成，请查看 Problems 面板');
    } catch (err) {
      vscode.window.showErrorMessage(`abaplint 执行失败: ${err.message}。请安装: npm i -g abaplint`);
    } finally {
      statusBar.dispose();
    }
  });
  context.subscriptions.push(runAbaplintCmd);

  context.subscriptions.push(
    vscode.workspace.onDidSaveTextDocument(async (doc) => {
      const cfg = vscode.workspace.getConfiguration('sapAdt');
      if (cfg.get('abaplint.runOnSave', false) && doc.languageId === 'abap') {
        await runAbaplintForDocument(doc);
      }
    })
  );

  // ========== 平替：从工作区搜索并打开 Include（不依赖 ADT API，避免 500）==========
  const openFromWorkspaceCmd = vscode.commands.registerCommand('sapAdt.openIncludeFromWorkspace', async () => {
    const editor = vscode.window.activeTextEditor;
    if (!editor) {
      vscode.window.showWarningMessage('请先打开 ABAP 文件并将光标放在 INCLUDE 行上');
      return;
    }
    const doc = editor.document;
    const pos = editor.selection.active;
    const line = doc.lineAt(pos).text;
    const includeMatch = line.trim().match(/INCLUDE\s+(\w+)/i);
    if (!includeMatch) {
      vscode.window.showWarningMessage('当前行不是 INCLUDE 语句。请将光标放在 INCLUDE xxx. 行上');
      return;
    }
    const name = includeMatch[1].toUpperCase();
    const nameLower = name.toLowerCase();
    const patterns = [
      `**/${name}.prog.abap`,
      `**/${nameLower}.prog.abap`,
      `**/*${name}*.prog.abap`,
      `**/*${nameLower}*.prog.abap`,
      `**/*${name}*.abap`
    ];
    for (const pattern of patterns) {
      const files = await vscode.workspace.findFiles(pattern, null, 5);
      if (files.length > 0) {
        const uri = files[0];
        await vscode.window.showTextDocument(uri, { preview: false });
        vscode.window.showInformationMessage(`已打开 ${name}`);
        return;
      }
    }
    vscode.window.showWarningMessage(`未在工作区找到 ${name}。请尝试：1) 左侧「包含」下双击打开 2) Ctrl+Shift+P → ABAP FS: Search for object → 输入 ${name}`);
  });
  context.subscriptions.push(openFromWorkspaceCmd);

  const goToDefCmd = vscode.commands.registerCommand('sapAdt.goToDefinition', async () => {
    const editor = vscode.window.activeTextEditor;
    if (!editor) {
      vscode.window.showWarningMessage('请先打开 ABAP 文件并将光标放在 INCLUDE/REPORT/CLASS/INTERFACE 行上');
      return;
    }
    const doc = editor.document;
    const pos = editor.selection.active;
    const line = doc.lineAt(pos).text;
    const wordRange = doc.getWordRangeAtPosition(pos, /\w+/);
    const word = wordRange ? doc.getText(wordRange) : '';

    const parsed = parseObjectFromLine(line, word);
    if (!parsed) {
      vscode.window.showWarningMessage('当前行无法解析为可跳转对象。请将光标放在 INCLUDE/REPORT/CLASS/INTERFACE 的名称上');
      return;
    }
    try {
      await fetchAndShow(parsed.name, parsed.objectType);
    } catch (err) {
      vscode.window.showErrorMessage(`跳转失败: ${err.message}`);
    }
  });
  context.subscriptions.push(goToDefCmd);

  // ========== 检索对象：按名称/模式搜索程序或对象，选择后打开 ==========
  const searchCmd = vscode.commands.registerCommand('sapAdt.searchObjects', async () => {
    const query = await vscode.window.showInputBox({
      prompt: '对象名或模式（支持 * 通配，如 ZTMP、Z*）',
      placeHolder: 'ZTMP 或 Z*',
      value: ''
    });
    if (query === undefined || !query.trim()) return;

    const objectType = await vscode.window.showQuickPick(
      [
        { label: 'PROG', description: '程序' },
        { label: 'CLAS', description: '类' },
        { label: 'INTF', description: '接口' },
        { label: 'TABL', description: '表' },
        { label: 'FUGR', description: '函数组' }
      ],
      { placeHolder: '选择对象类型' }
    );
    if (!objectType) return;

    const q = query.trim().toUpperCase();
    const conn = getConnectionConfig();
    if (!conn.baseUrl) {
      vscode.window.showWarningMessage('未配置 SAP 连接，请先使用「SAP ADT: 连接环境」登录');
      return;
    }

    const hasWildcard = q.includes('*') || q.includes('?');
    let results = [];
    if (getSearchScriptPath()) {
      await vscode.window.withProgress(
        { location: vscode.ProgressLocation.Notification, title: '正在检索对象…' },
        async () => {
          results = await searchObjectsViaAdt(q, objectType.label);
        }
      );
    }

    if (results.length > 0) {
      const selected = await vscode.window.showQuickPick(
        results.map(r => ({ label: `${r.type} ${r.name}`, description: r.name, obj: r })),
        { placeHolder: '选择要打开的对象', matchOnDescription: true }
      );
      if (selected && selected.obj) {
        try {
          await fetchAndShow(selected.obj.name, selected.obj.type);
        } catch (err) {
          vscode.window.showErrorMessage(`打开失败: ${err.message}`);
        }
      }
      return;
    }

    if (!hasWildcard) {
      try {
        await fetchAndShow(q, objectType.label);
      } catch (err) {
        vscode.window.showErrorMessage(`获取对象失败: ${err.message}`);
      }
      return;
    }

    vscode.window.showInformationMessage(
      '未找到匹配对象，或当前系统未开放 ADT 对象检索接口。可输入完整对象名再试，或使用 ABAP FS: Search for object。'
    );
  });
  context.subscriptions.push(searchCmd);

  const scriptsDir = path.dirname(getScriptPath());
  const pushObjectsScript = path.join(scriptsDir, 'sap-adt-push-objects.ps1');

  const pushFromManifestCmd = vscode.commands.registerCommand('sapAdt.pushFromManifest', async () => {
    if (!fs.existsSync(pushObjectsScript)) {
      vscode.window.showErrorMessage('未找到 scripts/sap-adt-push-objects.ps1');
      return;
    }
    const conn = getConnectionConfig();
    if (!conn.baseUrl || !conn.username || !conn.password) {
      vscode.window.showWarningMessage('请先使用「SAP ADT: 连接环境」登录后再推送。');
      return;
    }
    const abapDir = getAbapDir();
    const manifestPath = await vscode.window.showInputBox({
      prompt: 'Manifest JSON 路径（相对 abap 目录或绝对路径）',
      placeHolder: '例如 myprog.manifest.json 或 subdir/ztmp.manifest.json'
    });
    if (!manifestPath || !manifestPath.trim()) return;
    const resolved = path.isAbsolute(manifestPath) ? manifestPath : path.join(abapDir, manifestPath.trim());
    if (!fs.existsSync(resolved)) {
      vscode.window.showErrorMessage('Manifest 文件不存在: ' + resolved);
      return;
    }
    const packageInput = await vscode.window.showInputBox({
      prompt: '包名（新建对象时使用，如 $TMP、ZMYPKG）',
      value: '$TMP',
      placeHolder: '$TMP'
    });
    const pkg = (packageInput && packageInput.trim()) ? packageInput.trim() : '$TMP';
    const args = ['-ExecutionPolicy', 'Bypass', '-File', pushObjectsScript, '-ManifestPath', resolved, '-AbapDir', abapDir, '-Package', pkg, '-BaseUrl', conn.baseUrl, '-Username', conn.username, '-Password', conn.password, '-Client', conn.client || '200'];
    await vscode.window.withProgress(
      { location: vscode.ProgressLocation.Notification, title: '正在按 manifest 推送…' },
      async () => {
        const result = spawnSync('powershell', args, { encoding: 'utf8', timeout: 90000, windowsHide: true });
        if (result.status === 0) {
          vscode.window.showInformationMessage('已按 manifest 推送完成。');
        } else {
          const err = (result.stderr || result.stdout || '').trim() || `Exit ${result.status}`;
          vscode.window.showWarningMessage('推送未完全成功: ' + err.slice(0, 200));
        }
      }
    );
  });
  context.subscriptions.push(pushFromManifestCmd);
}

/**
 * 通过 ADT API 获取对象内容（供 DefinitionProvider 和 fetchAndShow 使用）
 * @param {string} objectName
 * @param {string} objectType
 * @returns {Promise<string>}
 */
function fetchViaAdt(objectName, objectType) {
  const scriptPath = getScriptPath();
  const conn = getConnectionConfig();
  const args = [
    '-ExecutionPolicy', 'Bypass', '-File', scriptPath,
    '-ObjectName', objectName, '-ObjectType', objectType,
    '-BaseUrl', conn.baseUrl
  ];
  if (conn.username) args.push('-Username', conn.username);
  if (conn.password) args.push('-Password', conn.password);
  if (conn.client) args.push('-Client', conn.client);

  const result = spawnSync('powershell', args, {
    encoding: 'utf8',
    timeout: 20000,
    windowsHide: true
  });
  if (result.error) throw result.error;
  if (result.status !== 0) {
    const err = (result.stderr || result.stdout || '').trim() || `Exit code ${result.status}`;
    throw new Error(err);
  }
  return (result.stdout || '').trim();
}

async function fetchAndShow(objectName, objectType) {
  try {
    await vscode.window.withProgress({
      location: vscode.ProgressLocation.Notification,
      title: `Fetching ${objectType} ${objectName}...`
    }, async () => {
      const result = await fetchViaAdt(objectName, objectType);

      const doc = await vscode.workspace.openTextDocument({
        content: result,
        language: 'abap'
      });
      await vscode.window.showTextDocument(doc, { preview: false });
      vscode.window.showInformationMessage(`Fetched ${objectType} ${objectName}`);
    });
  } catch (err) {
    vscode.window.showErrorMessage(`Failed to fetch: ${err.message}`);
  }
}

function deactivate() {}

module.exports = { activate, deactivate };
