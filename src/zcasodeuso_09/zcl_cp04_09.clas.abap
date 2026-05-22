CLASS zcl_cp04_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cp04_09 IMPLEMENTATION.






  METHOD if_oo_adt_classrun~main.

        " Analisis del modelo anterior
        "
        " Campos genericos utilizados:
        " id_reserva TYPE i
        " airline TYPE c
        " flight_number TYPE n
        " passenger TYPE string
        " flight_date TYPE d
        " price TYPE p
        " status TYPE c
        "
        " Los campos ahora usan elementos DDIC
        " reutilizables y globales.



        DATA lt_bookings TYPE ztt_bookings_09.
        lt_bookings = VALUE #(

                    ( id_reserva = 1
                     airline = 'LH'
                     flight_number = '0400'
                     passenger = 'Ana García'
                     flight_date = '20260515'
                     price = '899.00'
                     status = 'A' )

                   ( id_reserva = 2
                     airline = 'IB'
                     flight_number = '3740'
                     passenger = 'Carlos López'
                     flight_date = '20260515'
                     price = '120.00'
                     status = 'A' )

                     ( id_reserva = 3
                     airline = 'AA'
                     flight_number = '0017'
                     passenger = 'John Smith'
                     flight_date = '20260520'
                     price = '450.50'
                     status = 'A' )

                     ( id_reserva = 4
                     airline = 'LH'
                     flight_number = '0455'
                     passenger = 'María Pérez'
                     flight_date = '20260520'
                     price = '310.75'
                     status = 'A' )

                     ( id_reserva = 5
                     airline = 'IB'
                     flight_number = '3740'
                     passenger = 'Pedro Ruiz'
                     flight_date = '20260515'
                     price = '120.00'
                     status = 'C' )

                     ( id_reserva = 6
                     airline = 'SQ'
                     flight_number = '0026'
                     passenger = 'Lisa Tan'
                     flight_date = '20260601'
                     price = '1250.00'
                     status = 'A' )

                     ( id_reserva = 7
                     airline = 'LH'
                     flight_number = '0400'
                     passenger = 'Hans Müller'
                     flight_date = '20260515'
                     price = '899.00'
                     status = 'A' )


                     ( id_reserva = 8
                     airline = 'AA'
                     flight_number = '0064'
                     passenger = 'Sarah Jones'
                     flight_date = '20260525'
                     price = '510.00'
                     status = 'A' )
 ).



            APPEND VALUE #(
                id_reserva = 9
                airline = 'IB'
                flight_number = '3950'
                passenger = 'Elena Martín'
                flight_date = '20260601'
                price = '275.30'
                status = 'A'
            ) TO lt_bookings.

             APPEND VALUE #(
                id_reserva = 10
                airline = 'LH'
                flight_number = '2030'
                passenger = 'Franz Weber'
                flight_date = '20260610'
                price = '95.00'
                status = 'A'
            ) TO lt_bookings.


            out->write( '===== RESERVAS =====' ).

            LOOP AT lt_bookings INTO DATA(ls_booking).

              out->write( ls_booking ).
            ENDLOOP.




            LOOP AT lt_bookings INTO ls_booking.

                 IF ls_booking-id_reserva = 3.

                 ls_booking-price = '480.00'.

                 MODIFY lt_bookings FROM ls_booking.

                 ENDIF.

            ENDLOOP.


            LOOP AT lt_bookings INTO ls_booking.

                  IF ls_booking-airline = 'LH'.

                    ls_booking-price =
                      ls_booking-price * '0.90'.

                    MODIFY lt_bookings FROM ls_booking.

                  ENDIF.

            ENDLOOP.


                out->write( '===== RESERVAS MODIFICADAS =====' ).

                LOOP AT lt_bookings INTO ls_booking.

                  out->write( ls_booking ).

                ENDLOOP.



            LOOP AT lt_bookings INTO ls_booking.

              IF ls_booking-id_reserva = 4.

                ls_booking-status = 'C'.

                MODIFY lt_bookings FROM ls_booking.

              ENDIF.

            ENDLOOP.


        DATA(lv_deleted) = 0.

            LOOP AT lt_bookings INTO ls_booking.

                IF ls_booking-status = 'C'.

                    lv_deleted = lv_deleted + 1.

                ENDIF.

            ENDLOOP.

                DELETE lt_bookings WHERE status = 'C'.



        out->write( '===== RESERVAS FINALES =====' ).

            LOOP AT lt_bookings INTO ls_booking.

        out->write( ls_booking ).

            ENDLOOP.

        out->write(
            |Registros eliminados: { lv_deleted }|
).


        READ TABLE lt_bookings
        TRANSPORTING NO FIELDS
        WITH KEY passenger = 'Lisa Tan'.
            IF sy-subrc = 0.

                out->write( 'Lisa Tan existe' ).

            ELSE.

                out->write( 'Lisa Tan NO existe' ).

            ENDIF.


        READ TABLE lt_bookings
        REFERENCE INTO DATA(lr_booking)
        WITH KEY id_reserva = 6.

        IF sy-subrc = 0.

            out->write( '===== REFERENCIA ID 6 =====' ).

            out->write( lr_booking->* ).

        ENDIF.


            DATA(lv_passenger) =
            VALUE #(
                    lt_bookings[ id_reserva = 1 ]-passenger
).

        out->write(
            |Pasajero ID 1: { lv_passenger }|
).




        out->write( '===== AGRUPACIÓN POR AEROLÍNEA =====' ).


       LOOP AT lt_bookings INTO ls_booking
       GROUP BY ls_booking-airline INTO DATA(lv_airline).

            DATA(lv_count) = 0.
            DATA(lv_total) = 0.

            LOOP AT GROUP lv_airline INTO DATA(ls_group).

                lv_count = lv_count + 1.

                lv_total = lv_total + ls_group-price.

            ENDLOOP.

            DATA(lv_average) =
                round(
                    val = lv_total / lv_count
                    dec = 2
                            ).

           out->write(
                  |Aerolínea: { lv_airline }|
                ).

                out->write(
                  |Reservas: { lv_count }|
                ).

                out->write(
                  |Total: { lv_total } €|
                ).

                out->write(
                  |Media: { lv_average } €|
                ).

                out->write( '-------------------' ).
            ENDLOOP.


" Reflexion
"
" Ventajas de usar tipos DDIC:
" reutilizacion global, consistencia
" y mejor documentacion.
"
" TYPES locales seguirian siendo utiles
" para estructuras temporales pequenas.
"
" En ABAP clasico los elementos de datos
" suelen usar dominios.
"
" En ABAP Cloud esta separacion es mas
" simple y moderna.
"
" Los tipos DDIC son mas fáciles de
" mantener y modificar.
"
" Los tipos DDIC son mas fáciles de
" mantener y modificar.
"
" Los tipos DDIC son mas fáciles de
" mantener y modificar.
"
" Los tipos DDIC son mas fáciles de
" mantener y modificar.
"
" Los tipos DDIC


ENDMETHOD.
ENDCLASS.
