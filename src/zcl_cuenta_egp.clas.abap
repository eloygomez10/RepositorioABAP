CLASS zcl_cuenta_egp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   DATA:
        titular TYPE STRING,

        saldo TYPE i.

    INTERFACES if_oo_adt_classrun .

    METHODS:



                  get_titular EXPORTING o_titular TYPE string,
                  get_saldo EXPORTING o_saldo TYPE i,

                  set_titular IMPORTING i_titular TYPE string,

                  ingresar importing i_cantidad type i,
                  retirar importing i_cantidad type i.

  PROTECTED SECTION.
  PRIVATE SECTION.






ENDCLASS.



CLASS zcl_cuenta_egp IMPLEMENTATION.



  METHOD get_titular.
    o_titular = titular.
  ENDMETHOD.

  METHOD get_saldo.
    o_saldo = saldo.
  ENDMETHOD.

  METHOD set_titular.
    titular = i_titular.
  ENDMETHOD.

  METHOD ingresar.
    saldo = saldo + i_cantidad.
  ENDMETHOD.

  METHOD retirar.
    saldo = saldo - i_cantidad.
  ENDMETHOD.

METHOD if_oo_adt_classrun~main.
    " InicializaciÃ³n
    set_titular( i_titular = 'Carlos' ).
    saldo = 1000.
    out->write( '-----Estado inicial-----' ).
    out->write( EXPORTING data = titular name = 'Titular' ).
    out->write( EXPORTING data = saldo name = 'Saldo' ).

    " Ingreso
    ingresar( i_cantidad = 500 ).
    out->write( '-----INGRESO DE 500€-----' ).
    out->write( EXPORTING data = titular name = 'Titular' ).
    out->write( EXPORTING data = saldo name = 'Saldo' ).

    " Retirada 1
    retirar( i_cantidad = 200 ).
    out->write( '-----RETIRADA DE 200€-----' ).
    out->write( EXPORTING data = titular name = 'Titular' ).
    out->write( EXPORTING data = saldo name = 'Saldo' ).

    " Retirada 2
    retirar( i_cantidad = 2000 ).
    out->write( '-----RETIRADA DE 2000€-----' ).
    out->write( EXPORTING data = titular name = 'Titular' ).
    out->write( EXPORTING data = saldo name = 'Saldo' ).

    IF saldo < 0.
      out->write( 'Saldo negativo' ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.

