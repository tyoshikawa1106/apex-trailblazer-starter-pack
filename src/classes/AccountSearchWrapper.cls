public with sharing class AccountSearchWrapper {

    // エラーメッセージ
    public String errorMessage {get; set;}
    // 取引先リスト
    public List<Account> accounts {get; set;}

    /**
     * コンストラクタ
     */
    public AccountSearchWrapper() {
        // エラーメッセージ
        this.errorMessage = '';
        // 取引先リスト
        this.accounts = new List<Account>();
    }
}