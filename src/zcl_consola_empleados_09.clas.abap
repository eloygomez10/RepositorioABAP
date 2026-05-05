CLASS zcl_consola_empleados_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_consola_empleados_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA(lo_empleado) = NEW zcl_empleado_04(
                            i_nombre = 'Jose'
                            i_dni = '88888888'
                            i_salario_base = 2000 ).

    DATA(lo_empleado1) = NEW zcl_empleado_fijo_04(
                            i_nombre = 'Maria'
                            i_dni = '88888877'
                            i_salario_base = 2000
                            i_antg = 3 ).

    DATA(lo_empleado2) = NEW zcl_empleado_temporal_04(
                                  i_nombre = 'Roberto'
                                  i_dni = '86688877'
                                  i_salario_base = 1550
                                  i_horas = 8
                                  i_precio = 10 ).



    out->write( lo_empleado->get_ficha_empleado( ) ).
    out->write(  '--------------------------' ).
    out->write( lo_empleado1->get_ficha_empleado( ) ).
    out->write(  '--------------------------' ).
    out->write( lo_empleado2->get_ficha_empleado( ) ).















  ENDMETHOD.
ENDCLASS.
