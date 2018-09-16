public with sharing class OppLineItemRegisterController {

    private static OppLineItemRegisterHelper helper = new OppLineItemRegisterHelper();
    private static OppLineItemRegisterDao dao = new OppLineItemRegisterDao();

    /**
     * コンストラクタ
     */
    public OppLineItemRegisterController(ApexPages.StandardController stdController) {
        
    }

    /**
     * 初期処理
     */
    @RemoteAction
    public static OppLineItemRegisterWrapper init(String recordId) {
        OppLineItemRegisterWrapper wrapper = new OppLineItemRegisterWrapper();
        try {
            // 商談商品の作成権限判定
            wrapper = helper.checkIsCreateableOpportunityLineItem(wrapper, false);
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;

            // 商談情報取得
            wrapper.opportunity = dao.getOpportunity(recordId);
            // 商談情報取得判定
            wrapper = helper.checkOpportunityId(wrapper, wrapper.opportunity.Id);
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;

        } catch(Exception e) {
            wrapper.errorMessage = CommonUtil.getExceptionMsg(e, CommonConst.EXCEPTION_MSG);
            return wrapper;
        }
        return wrapper;
    }

    /**
     * 商品検索
     */
    @RemoteAction
    public static OppLineItemRegisterWrapper doSearch(String recordId, String productName, String productCode, String productFamily) {
        OppLineItemRegisterWrapper wrapper = new OppLineItemRegisterWrapper();
        try {
            // 商談商品の作成権限判定
            wrapper = helper.checkIsCreateableOpportunityLineItem(wrapper, false);
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;

            // 商談情報取得判定
            wrapper = helper.checkOpportunityId(wrapper, recordId);
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;

            // 商品情報取得
            List<Product2> product2List = dao.getProduct2List(productName, productCode, productFamily);
            // 商品情報取得判定
            wrapper = helper.checkProduct2ListSize(wrapper, product2List.size());
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;

            // 標準価格表情報取得
            Pricebook2 pricebook2 = dao.getPricebook2();
            // 標準価格表ID取得
            Id pricebook2Id = Test.isRunningTest() ? Test.getStandardPricebookId() : pricebook2.Id;
            // 標準価格表情報取得判定
            wrapper = helper.checkPricebook2Id(wrapper, pricebook2Id);
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;

            // 価格表エントリ取得
            List<PricebookEntry> pricebookEntryList = dao.getPricebookEntryList(pricebook2Id, product2List);
            // 価格表エントリ取得判定
            wrapper = helper.checkPricebookEntryListSize(wrapper, pricebookEntryList.size());
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;

            // 価格表エントリマップ取得
            Map<Id, PricebookEntry> pricebookEntryMap = helper.getPricebookEntryMap(pricebookEntryList);
            // 商品フィールドリスト取得
            wrapper.productFields = helper.getProductFieldList(product2List, pricebookEntryMap);

        } catch(Exception e) {
            wrapper.errorMessage = CommonUtil.getExceptionMsg(e, CommonConst.EXCEPTION_MSG);
            return wrapper;
        }
        return wrapper;
    }

    /**
     * 商品選択
     */
    @RemoteAction
    public static OppLineItemRegisterWrapper doSelectProduct(String recordId, List<String> productIds) {
        OppLineItemRegisterWrapper wrapper = new OppLineItemRegisterWrapper();
        try {
            // 商談商品の作成権限判定
            wrapper = helper.checkIsCreateableOpportunityLineItem(wrapper, false);
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;

            // 商談情報取得
            Opportunity opportunity = dao.getOpportunity(recordId);
            // 商談情報取得判定
            wrapper = helper.checkOpportunityId(wrapper, opportunity.Id);
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;

            // 商品情報取得
            List<Product2> product2List = dao.getProduct2ListByIds(productIds);
            // 商品情報取得判定
            wrapper = helper.checkProduct2ListSize(wrapper, product2List.size());
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;

            // 標準価格表情報取得
            Pricebook2 pricebook2 = dao.getPricebook2();
            // 標準価格表ID取得
            Id pricebook2Id = Test.isRunningTest() ? Test.getStandardPricebookId() : pricebook2.Id;
            // 標準価格表情報取得判定
            wrapper = helper.checkPricebook2Id(wrapper, pricebook2Id);
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;

            // 価格表エントリ取得
            List<PricebookEntry> pricebookEntryList = dao.getPricebookEntryList(pricebook2Id, product2List);
            // 価格表エントリ取得判定
            wrapper = helper.checkPricebookEntryListSize(wrapper, pricebookEntryList.size());
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;

            // 価格表エントリマップ取得
            Map<Id, PricebookEntry> pricebookEntryMap = helper.getPricebookEntryMap(pricebookEntryList);
            // 商談商品フィールドリスト取得
            wrapper.opportunityLineItemFields = helper.getOpportunityLineItemFields(product2List, opportunity ,pricebookEntryMap);

        } catch(Exception e) {
            wrapper.errorMessage = CommonUtil.getExceptionMsg(e, CommonConst.EXCEPTION_MSG);
            return wrapper;
        }
        return wrapper;
    }

    /**
     * 保存処理
     */
    @RemoteAction
    public static OppLineItemRegisterWrapper doSave(String recordId, List<OpportunityLineItem> opportunityLineItemList) {
        OppLineItemRegisterWrapper wrapper = new OppLineItemRegisterWrapper();
        try {
            // 商談商品の作成権限判定
            wrapper = helper.checkIsCreateableOpportunityLineItem(wrapper, false);
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;

            // 商談情報取得
            Opportunity opportunity = dao.getOpportunity(recordId);
            // 商談情報取得判定
            wrapper = helper.checkOpportunityId(wrapper, opportunity.Id);
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;
            
            // 商談商品の保存
            insert opportunityLineItemList;

        } catch(DmlException e) {
            wrapper.errorMessage = e.getDmlMessage(0);
            return wrapper;
        } catch(Exception e) {
            wrapper.errorMessage = CommonUtil.getExceptionMsg(e, CommonConst.EXCEPTION_MSG);
            return wrapper;
        }

        return wrapper;
    }
}