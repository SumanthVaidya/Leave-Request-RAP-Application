@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite CDS View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_CDS_Leave as select from ZI_Leaverequest as Leaverequest
association to ZI_Leavetype as _Leavetype on $projection.LeaveType = _Leavetype.LeaveType
association to ZI_LeaveBalance as _Leavebalance on $projection.EmployeeId = _Leavebalance.EmployeeId
association to ZI_Leaveworkflow as _Leaveworkflow on $projection.RequestId = _Leaveworkflow.RequestId
{
    key RequestId,
    EmployeeId,
    LeaveType,
    StartDate,
    EndDate,
    Status,
    CreatedBy,
    CreatedOn,
    ApprovedBy,
    ApprovedOn,
    _Leavetype,
    _Leavebalance,
    _Leaveworkflow
}
