public with sharing class CaseTriggerHelper {

    /**
     * コンストラクタ
     */
    public CaseTriggerHelper() {
        
    }

    /**
     * 取引先IDをキーにマップを取得
     */
    public Map<Id, List<Case>> getAccountIdMap(List<Case> cases) {
        Map<Id, List<Case>> accountIdKeyMap = new Map<Id, List<Case>>();
        for (Case cs : cases) {
            if (String.isNotEmpty(cs.AccountId)) {
                // accountIdKeyMapにセットするCaseListを取得
                List<Case> cList = this.getCaseListByAccountIdKeyMap(cs, accountIdKeyMap);
                // Add Map
                accountIdKeyMap.put(cs.AccountId, cList);
            }
        }

        return accountIdKeyMap;
    }

    /**
     * 取引先IDをキーにマップを取得
     */
    public Map<Id, List<Case>> getAccountIdMap(List<Case> cases, Map<Id, Case> caseOldMap) {
        Map<Id, List<Case>> accountIdKeyMap = new Map<Id, List<Case>>();
        for (Case cs : cases) {
            // 変更前の取引先ID
            if (caseOldMap.containsKey(cs.Id)) {
                Id oldAccountId = caseOldMap.get(cs.Id).AccountId;
                Case oldCase = caseOldMap.get(cs.Id);
                // 取引先IDが変更されたか
                if (cs.AccountId != oldAccountId) {
                    // [New Case] accountIdKeyMapにセットするCaseListを取得
                    List<Case> caseNewList = this.getCaseListByAccountIdKeyMap(cs, accountIdKeyMap);
                    // Add Map
                    accountIdKeyMap.put(cs.AccountId, caseNewList);
                    
                    // [Old Case] accountIdKeyMapにセットするCaseListを取得
                    List<Case> caseOldList = this.getCaseListByAccountIdKeyMap(oldCase, accountIdKeyMap);
                    // Add Map
                    accountIdKeyMap.put(oldAccountId, caseOldList);
                }
            }
        }

        return accountIdKeyMap;
    }

    /**
     * accountIdKeyMapにセットするCaseListを取得
     */
    @TestVisible
    private List<Case> getCaseListByAccountIdKeyMap(Case cs, Map<Id, List<Case>> accountIdKeyMap) {
        List<Case> cList = new List<Case>();
        if (accountIdKeyMap.containsKey(cs.AccountId)) {
            cList = accountIdKeyMap.get(cs.AccountId);
        }
        // Add List
        if (String.isNotEmpty(cs.Id)) {
            cList.add(cs);
        }

        return cList;
    }

    /**
     * ケース件数をセット
     */
    public List<Account> setCaseCnt(List<Account> accounts) {
        for (Account account : accounts) {
            account.CaseCnt__c = account.Cases.size();
        }

        return accounts;
    }

    /**
     * DMLエラー判定
     */
    public void isDmlError(List<Database.Saveresult> results, List<Account> accounts, Map<Id, Case> caseMap, Map<Id, List<Case>> accountIdKeyMap) {
        // Errorレコード判定
        Integer i = 0;
        for (Database.SaveResult sr : results) {
            if(!sr.isSuccess()) {
                Database.Error err = sr.getErrors()[0];
                if (accountIdKeyMap.containsKey(accounts[i].Id)) {
                    List<Case> errorCases = accountIdKeyMap.get(accounts[i].Id);
                    // Error Case Add Error
                    for (Case errorCase : errorCases) {
                        caseMap.get(errorCase.Id).addError(
                            err.getMessage()
                        );
                    }
                }
            }
            i++;
        }
    }
}