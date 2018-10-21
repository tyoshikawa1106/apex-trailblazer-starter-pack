public with sharing class CaseTriggerHandler {

    private CaseTriggerHelper helper = new CaseTriggerHelper();
    private CaseTriggerDao dao = new CaseTriggerDao();

    /**
     * コンストラクタ
     */
    public CaseTriggerHandler() {
        
    }

    /**
     * 取引先のケース件数を更新
     */
    public void doUpdateCaseCnt(List<Case> cases, Map<Id, Case> caseMap) {
        // 取引先IDをキーにマップ取得
        Map<Id, List<Case>> accountIdKeyMap = this.helper.getAccountIdMap(cases);
        // 取引先ID取得
        Set<Id> accountIds = accountIdKeyMap.KeySet();
        // 取引先IDを条件に取引先情報を取得
        List<Account> accounts = this.dao.getCaseCntWithAccount(accountIds);
        // ケース件数に値をセット
        accounts = this.helper.setCaseCnt(accounts);
        // 取引先更新
        List<Database.SaveResult> results = Database.Update(accounts, false);
        // Errorレコード判定
        this.helper.isDmlError(results, accounts, caseMap, accountIdKeyMap);
    }

    /**
     * 取引先のケース件数を更新
     */
    public void doUpdateCaseCnt(List<Case> cases, Map<Id, Case> caseNewMap, Map<Id, Case> caseOldMap) {
        // 取引先IDをキーにマップ取得
        Map<Id, List<Case>> accountIdKeyMap = this.helper.getAccountIdMap(cases, caseOldMap);
        // 取引先ID取得
        Set<Id> accountIds = accountIdKeyMap.KeySet();
        // 取引先IDを条件に取引先情報を取得
        List<Account> accounts = this.dao.getCaseCntWithAccount(accountIds);
        // ケース件数に値をセット
        accounts = this.helper.setCaseCnt(accounts);
        // 取引先更新
        List<Database.SaveResult> results = Database.Update(accounts, false);
        // Errorレコード判定
        this.helper.isDmlError(results, accounts, caseNewMap, accountIdKeyMap);
    }
}