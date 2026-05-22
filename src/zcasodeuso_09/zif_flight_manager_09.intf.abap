INTERFACE zif_flight_manager_09 PUBLIC.

  TYPES: BEGIN OF ty_flight,

           airline TYPE c LENGTH 2,
           flight_number TYPE n LENGTH 4,
           origin TYPE c LENGTH 3,
           destination TYPE c LENGTH 3,
           price TYPE p LENGTH 8 DECIMALS 2,

         END OF ty_flight.

  TYPES tt_flights TYPE STANDARD TABLE OF ty_flight
         WITH EMPTY KEY.


  METHODS add_flight
    IMPORTING
      is_flight TYPE ty_flight
    RAISING
      zcx_flight_error_09.


  METHODS get_flights_by_airline
    IMPORTING
      iv_airline TYPE string
    RETURNING
      VALUE(rt_flights) TYPE tt_flights.


  METHODS get_cheapest_flight
    RETURNING
      VALUE(rs_flight) TYPE ty_flight.


  METHODS get_total_revenue
    RETURNING
      VALUE(rv_total) TYPE decfloat34.

ENDINTERFACE.

