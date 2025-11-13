@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZProj_leave as projection on ZC_CDS_Leave
{
    key RequestId,
    EmployeeId,
    LeaveType,
    Startdate,
    EndDate,
    Status,
    CreatedBy,
    CreatedOn,
    ApprovedBy,
    ApprovedOn,
    /* Associations */
    _Leavebalance,
    _Leavetype,
    _Leaveworkflow
}
