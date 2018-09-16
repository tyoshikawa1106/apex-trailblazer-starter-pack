public with sharing class AccountSearchHelper {

    /**
     * コンストラクタ
     */
    public AccountSearchHelper() {
        
    }

    /**
     * 取引先リスト取得判定
     */
    public AccountSearchWrapper checkAccountListSize(AccountSearchWrapper wrapper, Integer accountListSize) {
        if (accountListSize == 0 || accountListSize == null) {
            wrapper.errorMessage = 'Not Found...';
        }
        
        return wrapper;
    }
}