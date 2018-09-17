public with sharing class OpportunityTriggerHelper {

    /**
     * コンストラクタ
     */
    public OpportunityTriggerHelper() {
        
    }

    /**
     * 価格表項目に値をセット
     */
    public List<Opportunity> setPriceBook2Id(List<Opportunity> opportunities, Id priceBook2Id) {
        for (Opportunity opportunity : opportunities) {
            // 標準価格表ID取得判定
            if (String.isEmpty(priceBook2Id)) {
                opportunity.addError('標準価格表情報の取得に失敗しました。お手数ですがシステム管理者までご連絡下さい。');
                continue;
            }
            // 価格表が未指定の場合に標準価格表と紐付け
            if (String.isEmpty(opportunity.Pricebook2Id)) {
                opportunity.Pricebook2Id = priceBook2Id;
            }
        }

        return opportunities;
    }
}