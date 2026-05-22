CLASS zcx_flight_error_09 DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    DATA error_message TYPE string. "añadimos esta linea de codigo

    METHODS constructor "añadimos esta linea de codigo
        IMPORTING       "añadimos esta linea de codigo
                !message TYPE string OPTIONAL   "añadimos esta linea de codigo
                !previous LIKE previous OPTIONAL . "añadimos esta linea de codigo
  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS zcx_flight_error_09 IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.

  super->constructor(
    previous = previous
  ).
*CLEAR me->textid.
*IF textid IS INITIAL.
*  if_t100_message~t100key = if_t100_message=>default_textid.
*ELSE.
*  if_t100_message~t100key = textid.
*ENDIF.
*  ENDMETHOD. "Este código que venía por defecto lo borramos y añadimos el de abajo.

  error_message = message. "añadimos esta linea de codigo

  ENDMETHOD.
ENDCLASS.
