public with sharing class OppLineItemRegisterHelper {

    /**
     * コンストラクタ
     */
    public OppLineItemRegisterHelper() {
        
    }

    /**
     * 商談情報取得判定
     */
    public OppLineItemRegisterWrapper checkOpportunityId(OppLineItemRegisterWrapper wrapper, String opportunityId) {
        if (String.isEmpty(opportunityId)) {
            wrapper.errorMessage = Schema.sObjectType.Opportunity.Label + 'の取得に失敗しました。';
        }
        
        return wrapper;
    }

    /**
     * 商品情報取得判定
     */
    public OppLineItemRegisterWrapper checkProduct2ListSize(OppLineItemRegisterWrapper wrapper, Integer product2ListSize) {
        if (product2ListSize == 0 || product2ListSize == null) {
            wrapper.errorMessage = '検索結果は0件です。条件を変更してください。';
        }
        
        return wrapper;
    }

    /**
     * 標準価格表情報取得判定
     */
    public OppLineItemRegisterWrapper checkPricebook2Id(OppLineItemRegisterWrapper wrapper, String pricebook2Id) {
        if (String.isEmpty(pricebook2Id)) {
            wrapper.errorMessage = '標準価格表情報の取得に失敗しました。';
        }
        
        return wrapper;
    }

    /**
     * 価格表エントリ情報取得判定
     */
    public OppLineItemRegisterWrapper checkPricebookEntryListSize(OppLineItemRegisterWrapper wrapper, Integer pricebookEntryListSize) {
        if (pricebookEntryListSize == 0 || pricebookEntryListSize == null) {
            wrapper.errorMessage = '価格表エントリ情報の取得に失敗しました。';
        }
        
        return wrapper;
    }

    /**
     * 商談商品の作成権限判定
     */
    public OppLineItemRegisterWrapper checkIsCreateableOpportunityLineItem(OppLineItemRegisterWrapper wrapper, Boolean isTestable) {
        if (!Schema.sObjectType.OpportunityLineItem.isCreateable() || isTestable) {
            wrapper.errorMessage = Schema.sObjectType.OpportunityLineItem.Label + 'の作成権限がありません。';
        }
        
        return wrapper;
    }

    /**
     * 価格表エントリマップ取得
     */
    public Map<Id, PricebookEntry> getPricebookEntryMap(List<PricebookEntry> pricebookEntryList) {
        Map<Id, PricebookEntry> pricebookEntryMap = new Map<Id, PricebookEntry>();
        for (PricebookEntry pricebookEntry : pricebookEntryList) {
            pricebookEntryMap.put(pricebookEntry.Product2Id, pricebookEntry);
        }
        
        return pricebookEntryMap;
    }

    /**
     * 商品フィールドリスト取得
     */
    public List<OppLineItemRegisterWrapper.ProductField> getProductFieldList(List<Product2> product2List, Map<Id, PricebookEntry> pricebookEntryMap) {
        List<OppLineItemRegisterWrapper.ProductField> productFields = new List<OppLineItemRegisterWrapper.ProductField>();
        for (Product2 product2 : product2List) {
            // マップ存在判定
            if (pricebookEntryMap.containsKey(product2.Id)) {
                // 価格表エントリ取得
                PricebookEntry pricebookEntry = pricebookEntryMap.get(product2.Id);
                // リストに追加
                productFields.add(new OppLineItemRegisterWrapper.ProductField(product2, pricebookEntry));
            }
        }

        return productFields;
    }

    /**
     * 商談商品フィールドリスト取得
     */
    public List<OppLineItemRegisterWrapper.OpportunityLineItemField> getOpportunityLineItemFields(List<Product2> product2List, Opportunity opportunity, Map<Id, PricebookEntry> pricebookEntryMap) {
        List<OppLineItemRegisterWrapper.OpportunityLineItemField> results = new List<OppLineItemRegisterWrapper.OpportunityLineItemField>();
        for (Product2 product2 : product2List) {
            // マップ存在判定
            if (pricebookEntryMap.containsKey(product2.Id)) {
                // 価格表エントリ取得
                PricebookEntry pricebookEntry = pricebookEntryMap.get(product2.Id);
                // 商談商品値セット
                OpportunityLineItem opportunityLineItem = new OpportunityLineItem(
                     OpportunityId = opportunity.Id
                    ,Product2Id = product2.Id
                    ,UnitPrice = pricebookEntry.UnitPrice
                    ,Quantity = 1
                    ,ServiceDate = opportunity.CloseDate.addMonths(3)
                );
                // リストに追加
                results.add(new OppLineItemRegisterWrapper.OpportunityLineItemField(product2, pricebookEntry, opportunityLineItem));
            }
        }

        return results;
    }
}