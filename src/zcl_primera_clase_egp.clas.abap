CLASS zcl_primera_clase_egp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
 INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_primera_clase_egp IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


        Data lv_edad type i value 1.
        Data lv_nombre type string value 'eloy'.

case lv_edad.

    when 10.
        out->write( 'eres un niño' ).
     when 20.
        out->write( 'eres un adolescente' ).
    when 30.
        out->write( 'eres un adulto' ).
    when others.
        out->write( 'eres cualquier cosa' ).
endcase.
        out->write( 'termina el programa' ).

  ENDMETHOD.



ENDCLASS.


