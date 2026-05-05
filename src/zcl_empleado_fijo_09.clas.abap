CLASS zcl_empleado_fijo_09 DEFINITION
  PUBLIC
  INHERITING FROM zcl_empleado_04

  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA : antg TYPE i.

    METHODS:
      constructor IMPORTING

                    i_nombre       TYPE string
                    i_dni          TYPE string
                    i_salario_base TYPE decfloat16
                    i_antg         TYPE i,



      get_ficha_empleado
        REDEFINITION,

      get_salario_final
        REDEFINITION.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_empleado_fijo_09 IMPLEMENTATION.


  METHOD constructor.
    .

    super->constructor(
      i_nombre       = i_nombre
      i_dni          = i_dni
      i_salario_base = i_salario_base
    ).
    me->antg = i_antg.
  ENDMETHOD.



  METHOD get_salario_final.
    DATA(lv_plus_anyos) = antg * 50.
    r_salario_final = salario_base + lv_plus_anyos.
  ENDMETHOD.

  METHOD get_ficha_empleado.
    " Calculamos el salario total llamando a nuestro propio método redefinido
    DATA(lv_total) = me->get_salario_final( ).

    r_ficha_empleado = |Nombre: { nombre } | &
                       |DNI: { dni } | &
                       |Antigüedad: { antg } años | &
                       |Salario Total: { lv_total }|.
  ENDMETHOD.


ENDCLASS.
