@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface cds view Leave balance'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_LeaveBalance as select from zleave_balance
{
    employee_id as EmployeeId,
    leave_type as LeaveType,
    entitled_days as EntitledDays,
    used_days as UsedDays,
    balance_days as BalanceDays,
    last_updated as LastUpdated
}
