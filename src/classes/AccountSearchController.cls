public with sharing class AccountSearchController {

    private static AccountSearchHelper helper = new AccountSearchHelper();
    private static AccountSearchDao dao = new AccountSearchDao();

    /**
     * コンストラクタ
     */
    public AccountSearchController() {
        
    }

    /**
     * 初期処理
     */
    @RemoteAction
    public static AccountSearchWrapper init() {
        return new AccountSearchWrapper();
    }

    /**
     * 取引先検索
     */
    @RemoteAction
    public static AccountSearchWrapper getAccounts(String accountName, String accountBillingState) {
        AccountSearchWrapper wrapper = new AccountSearchWrapper();
        try {
            // 取引先検索
            wrapper.accounts = dao.getAccounts(accountName, accountBillingState);
            // 取引先リスト取得判定
            wrapper = helper.checkAccountListSize(wrapper, wrapper.accounts.size());
            // エラー判定
            if (String.isNotEmpty(wrapper.errorMessage)) return wrapper;
        } catch(Exception e) {
            wrapper.errorMessage = CommonUtil.getExceptionMsg(e, CommonConst.EXCEPTION_MSG);
            return wrapper;
        }

        return wrapper;
    }
}