CLASS zcl_flight_manager_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_flight_manager_09 .

    METHODS constructor
      IMPORTING
        it_flights TYPE zif_flight_manager_09=>tt_flights OPTIONAL.

  PROTECTED SECTION.

  PRIVATE SECTION.

    DATA flights TYPE zif_flight_manager_09=>tt_flights.

ENDCLASS.



CLASS zcl_flight_manager_09 IMPLEMENTATION.

  METHOD constructor.

    flights = it_flights.

  ENDMETHOD.


  METHOD zif_flight_manager_09~add_flight.

    IF is_flight-price <= 0.

      RAISE EXCEPTION NEW zcx_flight_error_09(
        message = 'El precio debe ser positivo'
      ).

    ENDIF.


    READ TABLE flights
      WITH KEY airline = is_flight-airline
               flight_number = is_flight-flight_number
      TRANSPORTING NO FIELDS.


    IF sy-subrc = 0.

      RAISE EXCEPTION NEW zcx_flight_error_09(
        message = 'Vuelo duplicado'
      ).

    ENDIF.


    APPEND is_flight TO flights.

  ENDMETHOD.


  METHOD zif_flight_manager_09~get_flights_by_airline.

    LOOP AT flights INTO DATA(ls_flight).

      IF ls_flight-airline = iv_airline.

        APPEND ls_flight TO rt_flights.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.


  METHOD zif_flight_manager_09~get_cheapest_flight.

    READ TABLE flights INTO rs_flight INDEX 1.

    LOOP AT flights INTO DATA(ls_flight).

      IF ls_flight-price < rs_flight-price.

        rs_flight = ls_flight.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.


  METHOD zif_flight_manager_09~get_total_revenue.

    rv_total = 0.

    LOOP AT flights INTO DATA(ls_flight).

      rv_total = rv_total + ls_flight-price.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
