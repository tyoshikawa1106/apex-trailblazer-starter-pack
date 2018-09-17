@isTest
private class CaseTriggerHelperTest {

    private static CaseTriggerHelper helper = new CaseTriggerHelper();
    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * 取引先ID情報を取得
     * テストデータなし
     */
    static testMethod void getAccountIdMapTest1() {
        
        System.runAs(testAdminUser) {

            List<Case> cases = new List<Case>();

            Test.startTest();
            
            Map<Id, List<Case>> results = helper.getAccountIdMap(cases);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * 取引先ID情報を取得
     * テストデータあり
     */
    static testMethod void getAccountIdMapTest2() {
        
        System.runAs(testAdminUser) {

            // テストデータ作成
            Account account = CommonTester.createAccount(true);
            Case cs = CommonTester.createCase(account, true);

            List<Case> cases = new List<Case>();
            cases.add(cs);
            System.assertEquals(cases.size(), 1);

            Test.startTest();
            
            Map<Id, List<Case>> results = helper.getAccountIdMap(cases);
            
            Test.stopTest();

            System.assertEquals(results.size(), 1);
            System.assertEquals(results.get(account.Id).size(), 1);
        }
    }

    /**
     * 取引先ID情報を取得
     * テストデータあり (取引先IDなし)
     */
    static testMethod void getAccountIdMapTest3() {
        
        System.runAs(testAdminUser) {

            // テストデータ作成
            Case cs = CommonTester.createCase(new Account(), true);

            List<Case> cases = new List<Case>();
            cases.add(cs);
            System.assertEquals(cases.size(), 1);

            Test.startTest();
            
            Map<Id, List<Case>> results = helper.getAccountIdMap(cases);
            
            Test.stopTest();

            System.assertEquals(results.size(), 0);
        }
    }

    /**
     * 取引先ID情報を取得
     * テストデータなし
     */
    static testMethod void getAccountIdMapByUpdateTest1() {
        
        System.runAs(testAdminUser) {

            List<Case> cases = new List<Case>();
            Map<Id, Case> caseOldMap = new Map<Id, Case>();

            Test.startTest();
            
            Map<Id, List<Case>> results = helper.getAccountIdMap(cases, caseOldMap);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * 取引先ID情報を取得
     * テストデータあり (取引先ID変更なし)
     */
    static testMethod void getAccountIdMapByUpdateTest2() {
        
        System.runAs(testAdminUser) {

            // テストデータ作成
            Account account = CommonTester.createAccount(true);
            Case cs = CommonTester.createCase(account, true);

            // パラメータ
            List<Case> cases = new List<Case>();
            cases.add(cs);

            // OldMap
            Case oldCase = cs.clone(true, false, true, true);
            Map<Id, Case> caseOldMap = new Map<Id, Case>();
            caseOldMap.put(oldCase.Id, oldCase);

            // 取引先判定
            System.assertEquals(cs.AccountId, oldCase.AccountId);

            Test.startTest();
            
            Map<Id, List<Case>> results = helper.getAccountIdMap(cases, caseOldMap);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

     /**
     * 取引先ID情報を取得
     * テストデータあり (取引先ID変更あり)
     */
    static testMethod void getAccountIdMapByUpdateTest3() {
        
        System.runAs(testAdminUser) {

            // テストデータ作成
            Account account = CommonTester.createAccount(true);
            Case cs = CommonTester.createCase(account, true);

            // 変更後取引先
            Account accountOther = CommonTester.createAccount(true);

            // パラメータ
            List<Case> cases = new List<Case>();
            cases.add(cs);

            // OldMap
            Case oldCase = cs.clone(true, false, true, true);
            oldCase.AccountId = accountOther.Id;
            update oldCase;

            Map<Id, Case> caseOldMap = new Map<Id, Case>();
            caseOldMap.put(oldCase.Id, oldCase);

            // 取引先判定
            System.assertNotEquals(cs.AccountId, oldCase.AccountId);

            Test.startTest();
            
            Map<Id, List<Case>> results = helper.getAccountIdMap(cases, caseOldMap);
            
            Test.stopTest();

            System.assertEquals(results.size(), 2);
            System.assertEquals(results.get(account.Id).size(), 1);
            System.assertEquals(results.get(accountOther.Id).size(), 1);
        }
    }

    /**
     * accountIdKeyMapにセットするCaseListを取得
     * テストデータなし
     */
    static testMethod void getCaseListByAccountIdKeyMapTest1() {
        
        System.runAs(testAdminUser) {

            Case cs = new Case();
            Map<Id, List<Case>> accountIdKeyMap = new Map<Id, List<Case>>();

            Test.startTest();
            
            List<Case> results = helper.getCaseListByAccountIdKeyMap(cs, accountIdKeyMap);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * accountIdKeyMapにセットするCaseListを取得
     * テストデータあり
     */
    static testMethod void getCaseListByAccountIdKeyMapTest2() {
        
        System.runAs(testAdminUser) {

            // テストデータ作成
            Account account = CommonTester.createAccount(true);
            Case cs = CommonTester.createCase(account, true);

            List<Case> cases = new List<Case>();
            cases.add(cs);

            Map<Id, List<Case>> accountIdKeyMap = new Map<Id, List<Case>>();
            accountIdKeyMap.put(account.Id, cases);

            Test.startTest();
            
            List<Case> results = helper.getCaseListByAccountIdKeyMap(cs, accountIdKeyMap);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), false);
        }
    }

    /**
     * 取引先責任者件数をセット
     * テストデータなし
     */
    static testMethod void setCaseCntTest1() {
        
        System.runAs(testAdminUser) {

            List<Account> accounts = new List<Account>();

            Test.startTest();
            
            helper.setCaseCnt(accounts);
            
            Test.stopTest();

            System.assertEquals(accounts.isEmpty(), true);
        }
    }

    /**
     * 取引先責任者件数をセット
     * テストデータあり
     */
    static testMethod void setCaseCntTest2() {
        
        System.runAs(testAdminUser) {

            // テストデータ作成
            Account account = CommonTester.createAccount(true);
            Case cs = CommonTester.createCase(account, true);

            // パラメータ
            List<Account> accounts = [SELECT Id, (SELECT Id FROM Cases) FROM Account WHERE Id =: account.Id LIMIT 200];

            Test.startTest();
            
            helper.setCaseCnt(accounts);
            
            Test.stopTest();

            System.assertEquals(accounts.size(), 1);
            System.assertEquals(accounts[0].CaseCnt__c, 1);
        }
    }

    /**
     * DMLエラー判定
     * テストデータなし
     */
    static testMethod void isDmlErrorTest1() {
        
        System.runAs(testAdminUser) {

            List<Database.Saveresult> results = new List<Database.Saveresult>();
            List<Account> accounts = new List<Account>();
            Map<Id, Case> caseMap = new Map<Id, Case>();
            Map<Id, List<Case>> accountIdKeyMap = new Map<Id, List<Case>>();

            Test.startTest();
            
            helper.isDmlError(results, accounts, caseMap, accountIdKeyMap);
            
            Test.stopTest();
        }
    }

    /**
     * DMLエラー判定
     * テストデータあり
     */
    static testMethod void isDmlErrorTest2() {
        
        System.runAs(testAdminUser) {

            List<Account> testAccounts = new List<Account>();
            for (Integer i = 0; i < 5; i++) {
                Account a = CommonTester.createAccount(false);
                testAccounts.add(a);
            }
            insert testAccounts;

            List<Case> testCases = new List<Case>();
            for (Integer i = 0; i < 5; i++) {
                Case c = CommonTester.createCase(testAccounts[i], false);
                testCases.add(c);
            }
            insert testCases;

            List<Database.Saveresult> results = Database.Update(testAccounts, false);
            List<Account> accounts = new List<Account>();
            Map<Id, Case> caseMap = new Map<Id, Case>();
            Map<Id, List<Case>> accountIdKeyMap = new Map<Id, List<Case>>();

            Test.startTest();
            
            helper.isDmlError(results, accounts, caseMap, accountIdKeyMap);
            
            Test.stopTest();

            Integer i = 0;
            for (Database.SaveResult sr : results) {
                System.assertEquals(sr.isSuccess(), true);
                if (sr.isSuccess()) {
                    System.assertEquals(sr.getId(), testAccounts[i].Id);
                }
                i++;
            }
        }
    }
}