trigger CaseTrigger on Case (after insert, after delete, after undelete, after update) {

    CaseTriggerHandler handler = new CaseTriggerHandler();

    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            // 取引先のケース件数を更新
            handler.doUpdateCaseCnt(Trigger.new, Trigger.newMap);
        } else if (Trigger.isDelete){
            // 取引先のケース件数を更新
            handler.doUpdateCaseCnt(Trigger.old, Trigger.oldMap);
        } else if (Trigger.isUndelete) {
            // 取引先のケース件数を更新
            handler.doUpdateCaseCnt(Trigger.new, Trigger.newMap);
        } else if (Trigger.isUpdate) {
            // 取引先のケース件数を更新
            handler.doUpdateCaseCnt(Trigger.new, Trigger.newMap, Trigger.oldMap);
        }
    }
}