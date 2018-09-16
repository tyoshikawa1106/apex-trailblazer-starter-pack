public with sharing class OppLineItemRegisterWrapper {

    // エラーメッセージ
    public String errorMessage {get; set;}
    // 商談
    public Opportunity opportunity {get; set;}
    // 検索: 商品名
    public String productName {get; set;}
    // 検索: 商品コード
    public String productCode {get; set;}
    // 検索: 商品ファミリ選択リスト
    public String productFamilySelect {get; set;}
    // 検索: 商品ファミリ選択リスト値
    public Map<String, String> productFamilySelectItem {get; set;}
    // 商品検索結果フィールド
    public List<ProductField> productFields {get; set;}
    // 商談商品フィールド
    public List<OpportunityLineItemField> opportunityLineItemFields {get; set;}

    /**
     * コンストラクタ
     */
    public OppLineItemRegisterWrapper() {
        // エラーメッセージ
        this.errorMessage = '';
        // 商談
        this.opportunity = new Opportunity();
        // 商品名
        this.productName = '';
        // 商品コード
        this.productCode = '';
        // 商品ファミリ選択リスト
        this.productFamilySelect = '';
        // 商品ファミリー選択リスト値
        this.productFamilySelectItem = this.getProductFamilySelectItem();
        // 商品検索結果フィールド
        this.productFields = new List<ProductField>();
        // 商談商品フィールド
        this.opportunityLineItemFields = new List<OpportunityLineItemField>();
    }

    /**
     * 商品ファミリ選択リスト値取得
     */
    private Map<String, String> getProductFamilySelectItem() {
        // 商品ファミリ選択リスト取得 
        Schema.DescribeFieldResult F = Product2.Family.getDescribe();
        List<Schema.PicklistEntry> P = F.getPicklistValues();
        
        // 商品ファミリ選択リストセット
        Map<String, String> options = new Map<String, String>();
        options.put('--なし--','');
        for (Schema.PicklistEntry pick : P) {
            options.put(pick.getLabel(),pick.getValue());
        }
        
        return options;
    }

    /**
     * 商品検索フィールド
     */
    public class ProductField {

        // 選択チェック
        public Boolean isChecked {get; set;}
        // 商品
        public Product2 product2 {get; set;}
        // 価格表エントリ
        public PricebookEntry pricebookEntry {get; set;}

        /**
         * コンストラクタ
         */
        public ProductField() {
            this.isChecked = false;
            this.product2 = new Product2();
            this.pricebookEntry = new PricebookEntry();
        }

        /**
         * コンストラクタ
         */
        public ProductField(Product2 product2, PricebookEntry pricebookEntry) {
            this.isChecked = false;
            this.product2 = product2;
            this.pricebookEntry = pricebookEntry;
        }
    }

    /**
     * 商談商品フィールド
     */
    public class OpportunityLineItemField {
        // 商品
        public Product2 product2 {get; set;}
        // 価格表エントリ
        public PricebookEntry pricebookEntry {get; set;}
        // 商談商品
        public OpportunityLineItem opportunityLineItem {get; set;}

        /**
         * コンストラクタ
         */
        public OpportunityLineItemField() {
            this.product2 = new Product2();
            this.pricebookEntry = new PricebookEntry();
            this.opportunityLineItem = new OpportunityLineItem();
        }

        /**
         * コンストラクタ
         */
        public OpportunityLineItemField(Product2 product2, PricebookEntry pricebookEntry, OpportunityLineItem opportunityLineItem) {
            this.product2 = product2;
            this.pricebookEntry = pricebookEntry;
            this.opportunityLineItem = opportunityLineItem;
        }
    }
}