public with sharing class OpportunityTriggerHandler {

    private OpportunityTriggerHelper helper = new OpportunityTriggerHelper();

    /**
     * コンストラクタ
     */
    public OpportunityTriggerHandler() {
        
    }

    /**
     * 商談作成または更新時に価格表未指定の場合は標準価格表と紐付け
     */
    public void setPricebookField(List<Opportunity> opportunities) {
        // 標準価格表情報取得
        PriceBook2 priceBook2 = CommonDao.getStandardPriceBook2();
        // 標準価格表ID取得
        Id pricebook2Id = Test.isRunningTest() ? Test.getStandardPricebookId() : pricebook2.Id;
        // 標準価格表と紐付け
        opportunities = this.helper.setPriceBook2Id(opportunities, pricebook2Id);
    }
}