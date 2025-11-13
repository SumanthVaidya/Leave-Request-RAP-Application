@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface cds view Leaverequest'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_Leaverequest as select from zleaverequest_db
{
key request_id as RequestId,
employee_id as EmployeeId,
leave_type as LeaveType,
start_date as StartDate,
end_date as EndDate,
status as Status,
created_by as CreatedBy,
created_on as CreatedOn,
approved_by as ApprovedBy,
approved_on as ApprovedOn
}
