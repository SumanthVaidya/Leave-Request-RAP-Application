@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface cds view Leave type'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZI_Leavetype as select from zleavetype
{
    key leave_type as LeaveType,
    max_days as MaxDays,
    carry_over_limit as CarryOverLimit
}
