public with sharing class OppLineItemListHelper {

    /**
     * コンストラクタ
     */
    public OppLineItemListHelper() {
        
    }

    /**
     * 商談情報取得判定
     */
    public OppLineItemListWrapper checkOpportunityId(OppLineItemListWrapper wrapper, String opportunityId) {
        if (String.isEmpty(opportunityId)) {
            wrapper.errorMessage = Schema.sObjectType.Opportunity.Label + '情報の取得に失敗しました。';
        }
        
        return wrapper;
    }

    /**
     * 商談商品情報取得判定
     */
    public OppLineItemListWrapper checkOpportunityLineItemListSize(OppLineItemListWrapper wrapper, Integer opportunityLineItemSize) {
        if (opportunityLineItemSize == 0 || opportunityLineItemSize == null) {
            wrapper.errorMessage = '検索結果は0件です。条件を変更してください。';
        }
        
        return wrapper;
    }

    /**
     * 商談商品の編集権限判定
     */
    public OppLineItemListWrapper checkIsUpdateableOpportunityLineItem(OppLineItemListWrapper wrapper, Boolean isTestable) {
        if (!Schema.sObjectType.OpportunityLineItem.isUpdateable() || isTestable) {
            wrapper.errorMessage = Schema.sObjectType.OpportunityLineItem.Label + 'の編集権限がありません。';
        }
        
        return wrapper;
    }

    /**
     * 商談商品保存処理の必須チェック
     */
    public OppLineItemListWrapper checkOpportunityLineItemRequiredFields(OppLineItemListWrapper wrapper, List<OpportunityLineItem> opportunityLineItems) {
        for (OpportunityLineItem opportunityLineItem : opportunityLineItems) {
            // 販売価格必須判定
            if (opportunityLineItem.UnitPrice == null) {
                wrapper.errorMessage = '「商品名: ' + opportunityLineItem.Product2.Name + '」の' + Schema.sObjectType.OpportunityLineItem.Fields.UnitPrice.Label + 'が未入力です。';
                return wrapper;
            }
            // 数量必須判定
            if (opportunityLineItem.Quantity == null) {
                wrapper.errorMessage = '「商品名: ' + opportunityLineItem.Product2.Name + '」の' + Schema.sObjectType.OpportunityLineItem.Fields.Quantity.Label + 'が未入力です。';
                return wrapper;
            }
        } 

        return wrapper;
    }

    /**
     * 商談商品保存処理の日付項目判定
     */
    public List<OpportunityLineItem> checkOpportunityLineItemDateFields(List<OpportunityLineItem> opportunityLineItems) {
        // 日付型変数の存在判定
        for (OpportunityLineItem o : opportunityLineItems) {
            // 提供日
            if (o.ServiceDate == null) {
                o.ServiceDate = null;
            }
        }

        return opportunityLineItems;
    }

    /**
     * 商談商品の削除権限判定
     */
    public OppLineItemListWrapper checkIsDeletableOpportunityLineItem(OppLineItemListWrapper wrapper, Boolean isTestable) {
        if (!Schema.sObjectType.OpportunityLineItem.isDeletable() || isTestable) {
            wrapper.errorMessage = Schema.sObjectType.OpportunityLineItem.Label + 'の削除権限がありません。';
        }
        
        return wrapper;
    }

    /**
     * 商談商品フィールドリスト取得
     */
    public List<OppLineItemListWrapper.OpportunityLineItemField> getOpportunityLineItemFieldList(List<OpportunityLineItem> opportunityLineItemList) {
        List<OppLineItemListWrapper.OpportunityLineItemField> opportunityLineItemFields = new List<OppLineItemListWrapper.OpportunityLineItemField>();
        for (OpportunityLineItem opportunityLineItem : opportunityLineItemList) {
            opportunityLineItemFields.add(new OppLineItemListWrapper.OpportunityLineItemField(opportunityLineItem));
        }

        return opportunityLineItemFields;
    }
}