CLASS zcl_cp03_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cp03_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_manager) =
    NEW zcl_flight_manager_09( ).


  TRY.

      lo_manager->zif_flight_manager_09~add_flight(
        VALUE #(
          airline = 'LH'
          flight_number = '0400'
          origin = 'FRA'
          destination = 'JFK'
          price = '899'
        )
      ).

      lo_manager->zif_flight_manager_09~add_flight(
        VALUE #(
          airline = 'IB'
          flight_number = '3740'
          origin = 'MAD'
          destination = 'BCN'
          price = '120'
        )
      ).

      lo_manager->zif_flight_manager_09~add_flight(
        VALUE #(
          airline = 'AA'
          flight_number = '0017'
          origin = 'JFK'
          destination = 'SFO'
          price = '450'
        )
      ).

      lo_manager->zif_flight_manager_09~add_flight(
        VALUE #(
          airline = 'SQ'
          flight_number = '0026'
          origin = 'SIN'
          destination = 'FRA'
          price = '1250'
        )
      ).

      lo_manager->zif_flight_manager_09~add_flight(
        VALUE #(
          airline = 'LH'
          flight_number = '2030'
          origin = 'MUC'
          destination = 'FRA'
          price = '95'
        )
      ).

    CATCH zcx_flight_error_09 INTO DATA(lx_error).

      out->write( lx_error->error_message ).

  ENDTRY.



  TRY.

      lo_manager->zif_flight_manager_09~add_flight(
        VALUE #(
          airline = 'LH'
          flight_number = '9999'
          origin = 'MAD'
          destination = 'ROM'
          price = '-50'
        )
      ).

    CATCH zcx_flight_error_09 INTO lx_error.

      out->write(
        |Error capturado: { lx_error->error_message }|
      ).

  ENDTRY.



  TRY.

      lo_manager->zif_flight_manager_09~add_flight(
        VALUE #(
          airline = 'LH'
          flight_number = '0400'
          origin = 'FRA'
          destination = 'JFK'
          price = '899'
        )
      ).

    CATCH zcx_flight_error_09 INTO lx_error.

      out->write(
        |Error capturado: { lx_error->error_message }|
      ).

  ENDTRY.



  DATA(lt_lh) =
    lo_manager->zif_flight_manager_09~get_flights_by_airline( 'LH' ).

  out->write( '===== VUELOS LH =====' ).

  LOOP AT lt_lh INTO DATA(ls_flight).

    out->write( ls_flight ).

  ENDLOOP.



  DATA(ls_cheapest) =
    lo_manager->zif_flight_manager_09~get_cheapest_flight( ).

  out->write( '===== VUELO MÁS BARATO =====' ).

  out->write( ls_cheapest ).



  DATA(lv_total) =
    lo_manager->zif_flight_manager_09~get_total_revenue( ).

  out->write(
    |Facturación total: { lv_total } €|
  ).

  ENDMETHOD.
ENDCLASS.
