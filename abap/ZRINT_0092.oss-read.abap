REPORT zrint_0092.

PARAMETERS:p_gmv    RADIOBUTTON GROUP gp1 DEFAULT 'X',

           p_cus    RADIOBUTTON GROUP gp1,

           p_mid    RADIOBUTTON GROUP gp1,

           p_energy RADIOBUTTON GROUP gp1,

           p_s      RADIOBUTTON GROUP gp1,

           p_a      RADIOBUTTON GROUP gp1,

           p_b      RADIOBUTTON GROUP gp1.



START-OF-SELECTION.



  CASE 'X'.

    WHEN p_a.

      DATA(lo_borada) = NEW zcl_cassint_borad( 'A' ).

      lo_borada->get_partcitys_data(  ).

    WHEN p_s.

      DATA(lo_borads) = NEW zcl_cassint_borad( 'S' ).

      lo_borads->get_partcitys_data(  ).

    WHEN p_b.

      DATA(lo_boradb) = NEW zcl_cassint_borad( 'B' ).

      lo_boradb->get_blevelcitys_data(  ).

    WHEN p_gmv.

      DATA(lo_boradgmv) = NEW zcl_cassint_borad(  ).

      lo_boradgmv->get_allcitys_gmvdata( ).

    WHEN p_cus.

      DATA(lo_boradcus) = NEW zcl_cassint_borad(  ).

      lo_boradcus->get_allcitys_cusdata( ).

    WHEN p_mid.

      DATA(lo_boradmid) = NEW zcl_cassint_borad( ).

      lo_boradmid->get_allcitys_middata( ).

    WHEN p_energy.

      DATA(lo_boradenergy) = NEW zcl_cassint_borad( ).

      lo_boradenergy->get_allcitys_energydata( ).

  ENDCASE.
