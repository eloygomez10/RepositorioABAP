CLASS zc_eloy_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zc_eloy_01 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    " Declaración de tipo
*    TYPES: BEGIN OF ty_alumnos,
*             nombre TYPE string,
*             edad   TYPE i,
*             ciudad TYPE string,
*           END OF ty_ALUMNOS.
*
*    " Estructuras
*    DATA ls_alumnos TYPE ty_alumnos.
*
*    " Tablas
*    DATA: lt_alumnos TYPE TABLE OF ty_alumnos,
*          lt_alumnos_aux TYPE TABLE OF ty_alumnos.
*
*    ls_alumnos-nombre = 'Juan'.
*    ls_alumnos-edad = 23.
*    ls_alumnos-ciudad = 'Madrid'.
*    APPEND ls_alumnos TO lt_alumnos.
*
*    ls_alumnos-nombre = 'Maria'.
*    ls_alumnos-edad = 25.
*    ls_alumnos-ciudad = 'Barcelona'.
*    APPEND ls_alumnos TO lt_alumnos.
*
*    ls_alumnos-nombre = 'Jorge'.
*    ls_alumnos-edad = 27.
*    ls_alumnos-ciudad = 'Valencia'.
*    APPEND ls_alumnos TO lt_alumnos.
*
*    LOOP AT lt_alumnos INTO ls_alumnos.
*      IF ls_alumnos-edad > 25.
*        APPEND ls_alumnos TO lt_alumnos_aux.
*      ENDIF.
*    ENDLOOP.
*
*    out->write( lt_alumnos_aux ).

*    DATA lt_numeros TYPE TABLE OF i. " Declaración de una tabla INTERNA de tipo entero
*
*    APPEND 1 TO lt_numeros.
*    APPEND 2 TO lt_numeros.
*    APPEND 3 TO lt_numeros.
*    APPEND '4' TO lt_numeros.
*    APPEND 5 TO lt_numeros.
*    APPEND 6 TO lt_numeros.
*    APPEND 7 TO lt_numeros.
*    APPEND 8 TO lt_numeros.
*    APPEND 9 TO lt_numeros.
*    APPEND 10 TO lt_numeros.
*
*    out->write( lt_numeros ).

*    DATA lt_vuelos TYPE TABLE OF /dmo/flight.              ( declaracion de la tabla)
*    SELECT * FROM /dmo/flight INTO TABLE @lt_vuelos.       (seleccion de los registros)
*    out->write( lt_vuelos ).
*
*
*     DATA lv_total TYPE p DECIMALS 2.                         (declaracion de variable)
*
*
*   LOOP AT lt_vuelos INTO DATA(ls_vuelo).                          (recorre la tabla)
*
*
*    lv_total = ls_vuelo-price + lv_total.                        (suma de los precios)
*
*    ENDLOOP.
*    out->write( lv_total ).
*
*    ENDLOOP.
*
*    out->write( lv_total ).
*
*     out->write( 'Suma Total: ' && lv_total ).

       TYPES: BEGIN OF cliente,
         nombre TYPE string,
         edad   TYPE i,
         ciudad TYPE string,
         id     TYPE i,
         email  TYPE string,
       END OF cliente.

       DATA: clientes TYPE TABLE OF cliente.
       DATA: ls_cliente TYPE cliente.

            ls_cliente-nombre = 'Juan'.
            ls_cliente-edad = 25.
            ls_cliente-ciudad = 'Sevilla'.
            ls_cliente-id = 1.
            ls_cliente-email = 'juan@email.com'.

            APPEND ls_cliente TO clientes.
            CLEAR ls_cliente.

            ls_cliente-nombre = 'Maria'.
            ls_cliente-edad = 23.
            ls_cliente-ciudad = 'Barcelona'.
            ls_cliente-id = 2.
            ls_cliente-email = 'maria@email.com'.

            APPEND ls_cliente TO clientes.
            CLEAR ls_cliente.

            ls_cliente-nombre = 'Pedro'.
            ls_cliente-edad = 27.
            ls_cliente-ciudad = 'Madrid'.
            ls_cliente-id = 3.
            ls_cliente-email = 'pedro@email.com'.

            APPEND ls_cliente TO clientes.
            CLEAR ls_cliente.

            ls_cliente-nombre = 'Jose'.
            ls_cliente-edad = 25.
            ls_cliente-ciudad = 'Sevilla'.
            ls_cliente-id = 4.
            ls_cliente-email = 'jose@email.com'.

            APPEND ls_cliente TO clientes.
            CLEAR ls_cliente.

            ls_cliente-nombre = 'Marta'.
            ls_cliente-edad = 23.
            ls_cliente-ciudad = 'Cuenca'.
            ls_cliente-id = 5.
            ls_cliente-email = 'marta@email.com'.

            APPEND ls_cliente TO clientes.
            CLEAR ls_cliente.

            ls_cliente-nombre = 'Esteban'.
            ls_cliente-edad = 27.
            ls_cliente-ciudad = 'Vigo'.
            ls_cliente-id = 6.
            ls_cliente-email = 'esteban@email.com'.

            APPEND ls_cliente TO clientes.
            CLEAR ls_cliente.

            ls_cliente-nombre = 'Marcos'.
            ls_cliente-edad = 25.
            ls_cliente-ciudad = 'Granada'.
            ls_cliente-id = 7.
            ls_cliente-email = 'marcos@email.com'.

            APPEND ls_cliente TO clientes.
            CLEAR ls_cliente.

            ls_cliente-nombre = 'Pablo'.
            ls_cliente-edad = 23.
            ls_cliente-ciudad = 'Valencia'.
            ls_cliente-id = 8.
            ls_cliente-email = 'pablo@email.com'.

            APPEND ls_cliente TO clientes.
            CLEAR ls_cliente.

            ls_cliente-nombre = 'Virginia'.
            ls_cliente-edad = 27.
            ls_cliente-ciudad = 'Madrid'.
            ls_cliente-id = 9.
            ls_cliente-email = 'virginia@email.com'.

            APPEND ls_cliente TO clientes.
            CLEAR ls_cliente.

            ls_cliente-nombre = 'Vicente'.
            ls_cliente-edad = 25.
            ls_cliente-ciudad = 'Barcelona'.
            ls_cliente-id = 10.
            ls_cliente-email = 'vicente@email.com'.

            APPEND ls_cliente TO clientes.
            CLEAR ls_cliente.

           LOOP AT clientes INTO ls_cliente.




            out->write( |Nombre: { ls_cliente-nombre }| ).
            out->write( |Edad: { ls_cliente-edad }| ).
            out->write( |Ciudad: { ls_cliente-ciudad }| ).
            out->write( |ID: { ls_cliente-id }| ).
            out->write( |Email: { ls_cliente-email }| ).
            out->write( '---------------------------------------' ).
            ENDLOOP.


               DATA: lt_flights TYPE TABLE OF /dmo/flight.

                SELECT * FROM /dmo/flight
                INTO TABLE @lt_flights.

                LOOP AT lt_flights INTO DATA(ls_flight).

                     out->write( |{ ls_flight-carrier_id } - { ls_flight-connection_id } - { ls_flight-flight_date }| ).
                     out->write( |Precio: { ls_flight-price } { ls_flight-currency_code } - Avión: { ls_flight-plane_type_id }| ).
                     out->write( '-------------------------------------' ).




            DATA: lv_total TYPE p DECIMALS 2 VALUE 0.

            lv_total = lv_total + ls_flight-price.

            out->write( |Total precios: { lv_total }| ).


            DATA: lv_vuelostotales TYPE i VALUE 0.
             lv_vuelostotales = lv_vuelostotales + 1.
             out->write( |Total vuelos: { lv_vuelostotales }| ).
ENDLOOP.




  ENDMETHOD.

ENDCLASS.

