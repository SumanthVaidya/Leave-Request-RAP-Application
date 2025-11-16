Class lcl_class deFINITION.
puBLIC SECTION.
 class-data: lcl_create type table of zleaverequest_db.
 class-data: lcl_update type table of zleaverequest_db.
 class-data: lcl_delete type table of zleaverequest_db.
endCLASS.

CLASS lhc_ZC_CDS_Leave DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZC_CDS_Leave RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR ZC_CDS_Leave RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE ZC_CDS_Leave.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE ZC_CDS_Leave.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE ZC_CDS_Leave.

    METHODS read FOR READ
      IMPORTING keys FOR READ ZC_CDS_Leave RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK ZC_CDS_Leave.

ENDCLASS.

CLASS lhc_ZC_CDS_Leave IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.

 lcl_class=>lcl_create = CORRESPONDING #( entities
 mapping
  request_id = RequestId
  employee_id = EmployeeId
  leave_type = LeaveType
  start_date = Startdate
  end_date = EndDate
  status = Status
  created_by = CreatedBy
  created_on = CreatedOn
  approved_by = ApprovedBy
  approved_on = ApprovedOn
  ).

  ENDMETHOD.

  METHOD update.

  data it_structure TYPE zleaverequest_db.

   data it_update type table of zleaverequest_db.



  seleCT * from zleaverequest_db
     for ALL ENTRIES IN @entities
       where request_id = @entities-RequestId into taBLE @data(it_table_data).


   if it_table_data is not inITIAL.

   loop at entities inTO data(it_entity).

   it_structure = Value #( it_table_data[ request_id = it_entity-RequestId ] optional ).

   if it_entity-%control-RequestId = if_abap_behv=>mk-on.
     it_structure-request_id = it_entity-RequestId.
    endif.
   if it_entity-%control-EmployeeId = if_abap_behv=>mk-on.
     it_structure-employee_id = it_entity-EmployeeId.
   endif.
   if it_entity-%control-LeaveType = if_abap_behv=>mk-on.
     it_structure-leave_type = it_entity-LeaveType.
   endif.
   if it_entity-%control-Startdate = if_abap_behv=>mk-on.
     it_structure-start_date = it_entity-Startdate.
   endif.
   if it_entity-%control-EndDate = if_abap_behv=>mk-on.
     it_structure-end_date = it_entity-EndDate.
   endif.
   if it_entity-%control-Status = if_abap_behv=>mk-on.
     it_structure-status = it_entity-Status.
   endif.
   if it_entity-%control-CreatedBy = if_abap_behv=>mk-on.
     it_structure-created_by = it_entity-CreatedBy.
   endif.
   if it_entity-%control-CreatedOn = if_abap_behv=>mk-on.
     it_structure-created_on = it_entity-CreatedOn.
   endif.
   if it_entity-%control-ApprovedBy = if_abap_behv=>mk-on.
     it_structure-approved_by = it_entity-ApprovedBy.
   endif.
   if it_entity-%control-ApprovedOn = if_abap_behv=>mk-on.
     it_structure-approved_on = it_entity-ApprovedOn.
   endif.

   inSERT it_structure into table lcl_class=>lcl_update.

   endLOOP.

endif.

  ENDMETHOD.

  METHOD delete.

  seleCT * from zleaverequest_db
     for ALL ENTRIES IN @keys
       where request_id = @keys-RequestId into taBLE @data(it_table_data).

 lcl_class=>lcl_delete = it_table_data.


  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZC_CDS_LEAVE DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZC_CDS_LEAVE IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.

  if lcl_class=>lcl_create is not inITIAL.
     data it_tab type table of zleaverequest_db.
     it_tab = lcl_class=>lcl_create.
     insert zleaverequest_db from table @it_tab.
   elseif lcl_class=>lcl_update is not inITIAL.
     ModiFY zleaverequest_db from table @lcl_class=>lcl_update.
   elseif lcl_class=>lcl_delete is not inITIAL.
     deleTE zleaverequest_db from table @lcl_class=>lcl_delete.
endif.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
