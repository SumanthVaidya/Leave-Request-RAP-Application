@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface cds view Leave workflow'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_Leaveworkflow as select from zleave_workflow
{
    request_id as RequestId,
    step_no as StepNo,
    approver_id as ApproverId,
    action as Action,
    comments as Comments
}
