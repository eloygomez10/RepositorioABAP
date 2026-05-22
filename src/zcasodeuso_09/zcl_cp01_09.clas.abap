CLASS zcl_cp01_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cp01_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_flight,
                airline TYPE c LENGTH   2,
                flight_number TYPE n LENGTH 4,
                origin TYPE c LENGTH    3,
                destination TYPE c LENGTH 3,
                price TYPE p LENGTH 8 DECIMALS 2,
                seats TYPE i,
            END OF ty_FLIGHT.

    DATA lt_flights TYPE STANDARD TABLE OF ty_flight.

            lt_flights = VALUE #(

                ( airline = 'LH'
                  flight_number = '0400'
                  origin = 'FRA'
                  destination = 'JFK'
                  price = '899.00'
                  seats = 15 )

                ( airline = 'AA'
                  flight_number = '0017'
                  origin = 'JFK'
                  destination = 'SFO'
                  price = '450.50'
                  seats = 0 )

                ( airline = 'IB'
                  flight_number = '3740'
                  origin = 'MAD'
                  destination = 'BCN'
                  price = '120.00'
                  seats = 42 )

                ( airline = 'LH'
                  flight_number = '0455'
                  origin = 'FRA'
                  destination = 'MAD'
                  price = '310.75'
                  seats = 8 )

                ( airline = 'AA'
                  flight_number = '0064'
                  origin = 'SFO'
                  destination = 'JFK'
                  price = '510.00'
                  seats = 3 )

                ( airline = 'IB'
                  flight_number = '3950'
                  origin = 'BCN'
                  destination = 'LHR'
                  price = '275.30'
                  seats = 0 )

                ( airline = 'LH'
                  flight_number = '2030'
                  origin = 'MUC'
                  destination = 'FRA'
                  price = '95.00'
                  seats = 60 )

                ( airline = 'SQ'
                  flight_number = '0026'
                  origin = 'SIN'
                  destination = 'FRA'
                  price = '1250.00'
                  seats = 5 )

).

      LOOP AT lt_flights INTO DATA(ls_flight).

          DATA(lv_category) = COND string(

            WHEN ls_flight-price < 150 THEN 'Económico'

            WHEN ls_flight-price >= 150
             AND ls_flight-price <= 500 THEN 'Estándar'

            WHEN ls_flight-price > 500
             AND ls_flight-price <= 1000 THEN 'Premium'

            ELSE 'First Class'

          ).

          out->write(
            |Vuelo: { ls_flight-airline }-{ ls_flight-flight_number } |
          ).

          out->write(
            |Precio: { ls_flight-price } € |
          ).

          out->write(
            |Categoría: { lv_category }|
          ).

        ENDLOOP.

        out->write( '===== VUELOS FILTRADOS =====' ).

        LOOP AT lt_flights INTO ls_flight.

             IF ls_flight-seats > 0
             AND ( ls_flight-origin = 'FRA'
             OR ls_flight-destination = 'FRA' )
             AND ls_flight-price <= 1000.

                    out->write(
                      |{ ls_flight-airline }-{ ls_flight-flight_number } |
                    ).

  ENDIF.

ENDLOOP.


        out->write( '===== TRANSFORMACIÓN DE CADENAS =====' ).

        LOOP AT lt_flights INTO ls_flight.

              IF ls_flight-seats > 0
                 AND ( ls_flight-origin = 'FRA'
                 OR ls_flight-destination = 'FRA' )
                 AND ls_flight-price <= 1000.

                DATA(lv_code) =
                  |{ ls_flight-airline }-{ ls_flight-flight_number }|.

                DATA(lv_destination_lower) =
                  to_lower( ls_flight-destination ).

                DATA(lv_length) =
                  strlen( lv_code ).

                out->write(
                  |{ lv_code } | &&
                  | { lv_destination_lower } | &&
                  | { lv_length }|
                ).

            ENDIF.

ENDLOOP.


        DATA(lv_max_price) = 0.
        DATA(lv_min_price) = 999999.
        DATA(lv_total_price) = 0.
        DATA(lv_total_seats) = 0.
        DATA(lv_count) = 0.


            LOOP AT lt_flights INTO ls_flight.

              IF ls_flight-price > lv_max_price.
                lv_max_price = ls_flight-price.
              ENDIF.

              IF ls_flight-price < lv_min_price.
                lv_min_price = ls_flight-price.
              ENDIF.

              lv_total_price = lv_total_price + ls_flight-price.

              lv_total_seats = lv_total_seats + ls_flight-seats.

              lv_count = lv_count + 1.

            ENDLOOP.

                DATA(lv_average) =
                  round(
                    val = lv_total_price / lv_count
                    dec = 2
  ).

            out->write( '===== RESUMEN =====' ).

            out->write( |Precio máximo: { lv_max_price } €| ).

            out->write( |Precio mínimo: { lv_min_price } €| ).

            out->write( |Precio medio: { lv_average } €| ).

            out->write( |Plazas totales: { lv_total_seats }| ).

  ENDMETHOD.
ENDCLASS.
