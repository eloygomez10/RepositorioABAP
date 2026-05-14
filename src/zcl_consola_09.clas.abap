CLASS zcl_consola_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_consola_09 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

DATA lv_hoy TYPE d.
    lv_hoy = '20260514'.
    SELECT SINGLE FROM /dmo/carrier
            FIELDS
                is_valid( @lv_hoy ) AS valido,
                weekday( @lv_hoy ) AS dia_semana

            INTO @DATA(ls_carrier).
    IF sy-subrc = 0.
    ENDIF.

     DATA: BEGIN OF ls_output,
        es_valido     TYPE string,
        dia_semana TYPE string,
      END OF ls_output.

         DATA lv_valido TYPE string.
      DATA lv_dia TYPE string.




        IF ls_carrier-valido = 1.
          lv_valido = 'SI'.
        ELSE.
          lv_valido = 'NO'.
        ENDIF.

        CASE ls_carrier-dia_semana.
          WHEN 0.
            lv_dia = 'Lunes'.
          WHEN 1.
            lv_dia = 'Martes'.
          WHEN 2.
            lv_dia = 'Miercoles'.
          WHEN 3.
            lv_dia = 'Jueves'.
            WHEN 4.
            lv_dia = 'Viernes'.
          WHEN 5.
            lv_dia = 'Sabado'.
          WHEN 6.
            lv_dia = 'Domingo'.
        ENDCASE.

        ls_output-es_valido = lv_valido.
      ls_output-dia_semana = lv_dia.

        out->write( ls_output ).

        ENDMETHOD.
ENDCLASS.





