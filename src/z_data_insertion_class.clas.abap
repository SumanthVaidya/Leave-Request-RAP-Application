CLASS z_data_insertion_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

    meTHODS: insert_leavetype.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_data_insertion_class IMPLEMENTATION.


  METHOD insert_leavetype.
  data: data_leavetype type taBLE of zleavetype.
  data_leavetype = valUE #( ( leave_type = 'Sick'
  max_days = 2
  carry_over_limit = 0 )
  ( leave_type = 'Casual'
  max_days = 2
  carry_over_limit = 0 )
  ( leave_type = 'Emergency'
  max_days = 1
  carry_over_limit = 0 )
  ( leave_type = 'Planned'
  max_days = 5
  carry_over_limit = 0 )
  ( leave_type = 'Maternity'
  max_days = 180
  carry_over_limit = 0 )
  ( leave_type = 'Paternity'
  max_days = 30
  carry_over_limit = 0 ) ).

  insERT zleavetype frOM taBLE @data_leavetype.

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

    insert_leavetype(  ).

  ENDMETHOD.




ENDCLASS.
