CLASS zcl_empleadotemporal_09 DEFINITION
  PUBLIC
  INHERITING FROM zcl_empleado_04

  CREATE PUBLIC .

  PUBLIC SECTION.

         Data : horas type i,
                precio type decfloat16.

        Methods:
           constructor IMPORTING

        i_nombre       TYPE string
        i_dni          TYPE string
        i_salario_base TYPE decfloat16
        i_horas type i
        i_precio type decfloat16,

        get_ficha_empleado
                redefinition,

            get_salario_final
                redefinition.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_empleadotemporal_09 IMPLEMENTATION.


         METHOD constructor.

    super->constructor(
      i_nombre       = i_nombre
      i_dni          = i_dni
      i_salario_base = i_salario_base
    ).
    me->horas = i_horas.
    me->precio = i_precio.

  ENDMETHOD.

  METHOD get_salario_final.

  DATA(lv_plus_horas) = horas * precio.
  r_salario_final = salario_base + lv_plus_horas.
ENDMETHOD.


    METHOD get_ficha_empleado.

    DATA(lv_total) = me->get_salario_final( ).

    r_ficha_empleado = |Nombre: { nombre } | &
                       |DNI: { dni } | &
                       |Horas: { horas } | &
                       |Precio: { precio } | &
                       |Salario Total: { lv_total }|.
  ENDMETHOD.





ENDCLASS.
