CLASS zcl_empleado_09 DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: nombre  TYPE string,
          dni     TYPE string,
          salario TYPE i.

    METHODS:
      constructor IMPORTING i_nombre  TYPE string
                            i_dni     TYPE string
                            i_salario TYPE i,
      mostrar_ficha EXPORTING o_ficha TYPE string,
      calcula_salario RETURNING VALUE(rv_salario) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_empleado_09 IMPLEMENTATION.

  METHOD constructor.
    me->nombre  = i_nombre.
    me->dni     = i_dni.
    me->salario = i_salario.
  ENDMETHOD.

  METHOD Mostrar_Ficha.
    o_ficha = | El empleado { me->nombre } | &&
              | con DNI { me->dni } | &&
              | cobra { me->salario } euros' |.
  ENDMETHOD.

  METHOD calcula_salario.
    rv_salario = me->salario.
  ENDMETHOD.

ENDCLASS.
