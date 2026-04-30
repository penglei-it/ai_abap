* 按 asid 二分查找售后单对应产品信息
      READ TABLE lt_asid_product INTO ls_asid_product WITH KEY asid = ls_zticec_af_infuser-asid BINARY SEARCH.
* 将产品名称写入列表行结构
      ls_aftersalelistset-productnamecone = ls_asid_product-productname.
* 序号递增
      l_index = l_index + 1.
* 写入当前行序号
      ls_aftersalelistset-sno = l_index."1
