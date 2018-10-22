public with sharing class OppLineItemListController {

    private static OppLineItemListHelper helper = new OppLineItemListHelper();
    private static OppLineItemListDao dao = new OppLineItemListDao();

    /**
     * コンストラクタ
     */
    public OppLineItemListController(ApexPages.StandardController stdController) {
        
    }

    /**
     * 初期処理
     */
    @RemoteAction
    public static OppLineItemListWrapper init(String recordId) {
        OppLineItemListWrapper wrapper = new OppLineItemListWrapper();
        try {
            // 商談取得
            wrapper.opportunity = dao.getOpportunity(recordId);
            // 商談取得判定
            wrapper = helper.checkOpportunityId(wrapper, wrapper.opportunity.Id);
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;

            // 商談商品リスト取得
            List<OpportunityLineItem> opportunityLineItemList = dao.getOpportunityLineItemList(wrapper.opportunity.Id, '');
            // 商談商品リスト取得判定
            wrapper = helper.checkOpportunityLineItemListSize(wrapper, opportunityLineItemList.size());
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;

            // 商談商品フィールドリスト取得
            wrapper.opportunityLineItemFields = helper.getOpportunityLineItemFieldList(opportunityLineItemList);

        } catch(Exception e) {
            wrapper.errorMessage = CommonUtil.getExceptionMsg(e, CommonConst.EXCEPTION_MSG);
            return wrapper;
        }
        return wrapper;
    }

    /**
     * 商談商品検索
     */
    @RemoteAction
    public static OppLineItemListWrapper doSearchOpportunityLineItem(String recordId, String productName) {
        OppLineItemListWrapper wrapper = new OppLineItemListWrapper();
        try {
            // 商談取得
            wrapper.opportunity = dao.getOpportunity(recordId);
            // 商談取得判定
            wrapper = helper.checkOpportunityId(wrapper, wrapper.opportunity.Id);
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;

            // 商談商品リスト取得
            List<OpportunityLineItem> opportunityLineItemList = dao.getOpportunityLineItemList(wrapper.opportunity.Id, productName);
            // 商談商品リスト取得判定
            wrapper = helper.checkOpportunityLineItemListSize(wrapper, opportunityLineItemList.size());
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;

            // 商談商品フィールドリスト取得
            wrapper.opportunityLineItemFields = helper.getOpportunityLineItemFieldList(opportunityLineItemList);

        } catch(Exception e) {
            wrapper.errorMessage = CommonUtil.getExceptionMsg(e, CommonConst.EXCEPTION_MSG);
            return wrapper;
        }
        return wrapper;
    }

    /**
     * 編集対象の商談商品取得
     */
    @RemoteAction
    public static OppLineItemListWrapper doSelectEditOpportunityLineItem(String recordId, List<String> opportunityLineItemIds) {
        OppLineItemListWrapper wrapper = new OppLineItemListWrapper();
        try {
            // 商談取得
            wrapper.opportunity = dao.getOpportunity(recordId);
            // 商談取得判定
            wrapper = helper.checkOpportunityId(wrapper, wrapper.opportunity.Id);
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;
            // 商談商品取得
            wrapper.editOpportunityLineItemList = dao.getEditOpportunityLineItemList(recordId, opportunityLineItemIds);

        } catch(Exception e) {
            wrapper.errorMessage = CommonUtil.getExceptionMsg(e, CommonConst.EXCEPTION_MSG);
            return wrapper;
        }
        return wrapper;
    }

    /**
     * 商談商品の更新
     */
    @RemoteAction
    public static OppLineItemListWrapper doUpdateOpportunityLineItem(List<OpportunityLineItem> opportunityLineItemList) {
        OppLineItemListWrapper wrapper = new OppLineItemListWrapper();
        try {
            // 商談商品の編集権限判定
            wrapper = helper.checkIsUpdateableOpportunityLineItem(wrapper, false);
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;

            // 商談商品保存処理の必須チェック
            wrapper = helper.checkOpportunityLineItemRequiredFields(wrapper, opportunityLineItemList);
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;
            
            // 日付型変数の存在判定
            opportunityLineItemList = helper.checkOpportunityLineItemDateFields(opportunityLineItemList);
            // 商談商品更新
            update opportunityLineItemList;

        } catch(DmlException e) {
            wrapper.errorMessage = e.getDmlMessage(0);
            return wrapper;
        } catch(Exception e) {
            wrapper.errorMessage = CommonUtil.getExceptionMsg(e, CommonConst.EXCEPTION_MSG);
            return wrapper;
        }
        return wrapper;
    }

    /**
     * 削除対象の商談商品取得
     */
    @RemoteAction
    public static OppLineItemListWrapper doSelectDeleteOpportunityLineItem(String recordId, List<String> opportunityLineItemIds) {
        OppLineItemListWrapper wrapper = new OppLineItemListWrapper();
        try {
            // 商談取得
            wrapper.opportunity = dao.getOpportunity(recordId);
            // 商談取得判定
            wrapper = helper.checkOpportunityId(wrapper, wrapper.opportunity.Id);
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;

            // 商談商品取得
            wrapper.deleteOpportunityLineItemList = dao.getDeleteOpportunityLineItemList(recordId, opportunityLineItemIds);

        } catch(Exception e) {
            wrapper.errorMessage = CommonUtil.getExceptionMsg(e, CommonConst.EXCEPTION_MSG);
            return wrapper;
        }
        return wrapper;
    }

    /**
     * 商談商品の削除
     */
    @RemoteAction
    public static OppLineItemListWrapper doDeleteOpportunityLineItem(String recordId, List<String> opportunityLineItemIds) {
        OppLineItemListWrapper wrapper = new OppLineItemListWrapper();
        try {
            // 商談商品の削除権限判定
            wrapper = helper.checkIsDeletableOpportunityLineItem(wrapper, false);
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;
            
            // 商談商品削除対象取得
            List<OpportunityLineItem> deleteOpportunityLineItemList = dao.getDeleteOpportunityLineItemList(recordId, opportunityLineItemIds);
            // 商談商品リスト取得判定
            wrapper = helper.checkOpportunityLineItemListSize(wrapper, deleteOpportunityLineItemList.size());
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;
            
            // 商談商品削除
            delete deleteOpportunityLineItemList;

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