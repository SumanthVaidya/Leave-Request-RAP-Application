@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.resultSet.sizeCategory: #XS
define root view entity ZProj_leave
  provider contract transactional_query as projection on ZC_CDS_Leave
{
    key RequestId,
    EmployeeId,
    @Consumption.valueHelpDefinition: [{ entity: {
        name: 'ZI_Leavetype',
        element: 'LeaveType'
    } }]
    LeaveType,
    StartDate,
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
