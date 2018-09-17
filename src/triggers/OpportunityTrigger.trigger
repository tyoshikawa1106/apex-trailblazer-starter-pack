trigger OpportunityTrigger on Opportunity (before insert, before update) {

    private OpportunityTriggerHandler handler = new OpportunityTriggerHandler();

    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            // 商談作成時に価格表未指定の場合は標準価格表と紐付け
            handler.setPricebookField(Trigger.new);
        } else if (Trigger.isUpdate) {
            // 商談更新時に価格表未指定の場合は標準価格表と紐付け
            handler.setPricebookField(Trigger.new);
        }
    }
}