public with sharing class CaseTriggerDao {

    /**
     * コンストラクタ
     */
    public CaseTriggerDao() {
        
    }

    /**
     * 取引先に紐付くケースの件数を取得
     */
    public List<Account> getCaseCntWithAccount(Set<Id> accountIds) {
        return CaseTriggerDaoAll.getCaseCntWithAccount(accountIds);
    }
}