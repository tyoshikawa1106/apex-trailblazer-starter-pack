public with sharing class OppLineItemListWrapper {

    // エラーメッセージ
    public String errorMessage {get; set;}
    // 商談
    public Opportunity opportunity {get; set;}
    // 商談商品フィールドリスト
    public List<OpportunityLineItemField> opportunityLineItemFields {get; set;}
    // 編集用商談商品リスト
    public List<OpportunityLineItem> editOpportunityLineItemList {get; set;}
    // 削除用商談商品リスト
    public List<OpportunityLineItem> deleteOpportunityLineItemList {get; set;}

    /**
     * コンストラクタ
     */
    public OppLineItemListWrapper() {
        // エラーメッセージ
        this.errorMessage = '';
        // 商談
        this.opportunity = new Opportunity();
        // 商談商品
        this.opportunityLineItemFields = new List<OpportunityLineItemField>();
        // 編集用商談商品リスト
        this.editOpportunityLineItemList = new List<OpportunityLineItem>();
        // 削除用商談商品リスト
        this.deleteOpportunityLineItemList = new List<OpportunityLineItem>();
    }

    /**
     * 商談商品フィールド
     */
    public class OpportunityLineItemField {
        // 選択チェック
        public Boolean isChecked {get; set;}
        // 商談商品
        public OpportunityLineItem opportunityLineItem {get; set;}

        /**
         * コンストラクタ
         */
        public OpportunityLineItemField() {
            this.isChecked = false;
            this.opportunityLineItem = new OpportunityLineItem();
        }

        /**
         * コンストラクタ
         */
        public OpportunityLineItemField(OpportunityLineItem opportunityLineItem) {
            this.isChecked = false;
            this.opportunityLineItem = opportunityLineItem;
        }
    }
}