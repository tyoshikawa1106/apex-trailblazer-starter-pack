@isTest
private class CaseTriggerHandlerTest {

    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * 取引先のケース件数を更新
     * INSERT
     */
    static testMethod void doUpdateCaseCntByInsertTest1() {
        
        System.runAs(testAdminUser) {

            // テストデータ作成
            Account account = CommonTester.createAccount(true);

            Test.startTest();
            
            // INSERT
            Case cs = CommonTester.createCase(account, true);
            
            Test.stopTest();

            Account resultAccount = [SELECT CaseCnt__c FROM Account WHERE Id =: account.Id LIMIT 1];
            System.assertEquals(resultAccount.CaseCnt__c, 1);
        }
    }

    /**
     * 取引先のケース件数を更新
     * INSERT
     */
    static testMethod void doUpdateCaseCntByInsertTest2() {
        
        System.runAs(testAdminUser) {

            // テストデータ作成
            Account account = CommonTester.createAccount(true);

            Test.startTest();
            
            // INSERT
            Case cs1 = CommonTester.createCase(account, true);
            Case cs2 = CommonTester.createCase(account, true);
            
            Test.stopTest();

            Account resultAccount = [SELECT CaseCnt__c FROM Account WHERE Id =: account.Id LIMIT 1];
            System.assertEquals(resultAccount.CaseCnt__c, 2);
        }
    }

    /**
     * 取引先のケース件数を更新
     * INSERT
     */
    static testMethod void doUpdateCaseCntByInsertTest3() {
        
        System.runAs(testAdminUser) {

            // テストデータ作成
            Account account = CommonTester.createAccount(true);

            Test.startTest();
            
            // INSERT
            List<Case> cases = new List<Case>();
            for (Integer i = 0; i < 200; i++) {
                cases.add(CommonTester.createCase(account, false));
            }
            insert cases;
            
            Test.stopTest();

            Account resultAccount = [SELECT CaseCnt__c FROM Account WHERE Id =: account.Id LIMIT 1];
            System.assertEquals(resultAccount.CaseCnt__c, 200);
        }
    }

    /**
     * 取引先のケース件数を更新
     * DELETE
     */
    static testMethod void doUpdateCaseCntByDeleteTest1() {
        
        System.runAs(testAdminUser) {

            // テストデータ作成
            Account account = CommonTester.createAccount(true);
            Case cs = CommonTester.createCase(account, true);

            Test.startTest();
            
            // DELETE
            delete cs;
            
            Test.stopTest();

            Account resultAccount = [SELECT CaseCnt__c FROM Account WHERE Id =: account.Id LIMIT 1];
            System.assertEquals(resultAccount.CaseCnt__c, 0);
        }
    }

    /**
     * 取引先のケース件数を更新
     * DELETE
     */
    static testMethod void doUpdateCaseCntByDeleteTest2() {
        
        System.runAs(testAdminUser) {

            // テストデータ作成
            Account account = CommonTester.createAccount(true);
            Case cs = CommonTester.createCase(account, true);
            Case caseOther = CommonTester.createCase(account, true);

            Test.startTest();
            
            // DELETE
            delete cs;
            
            Test.stopTest();

            Account resultAccount = [SELECT CaseCnt__c FROM Account WHERE Id =: account.Id LIMIT 1];
            System.assertEquals(resultAccount.CaseCnt__c, 1);
        }
    }

    /**
     * 取引先のケース件数を更新
     * UNDELETE
     */
    static testMethod void doUpdateCaseCntByUnDeleteTest1() {
        
        System.runAs(testAdminUser) {

            // テストデータ作成
            Account account = CommonTester.createAccount(true);
            Case cs = CommonTester.createCase(account, true);

            Test.startTest();
            
            // DELETE
            delete cs;
            // UNDELETE
            undelete cs;
            
            Test.stopTest();

            Account resultAccount = [SELECT CaseCnt__c FROM Account WHERE Id =: account.Id LIMIT 1];
            System.assertEquals(resultAccount.CaseCnt__c, 1);
        }
    }

    /**
     * 取引先のケース件数を更新
     * UPDATE
     */
    static testMethod void doUpdateCaseCntByUpdateTest1() {
        
        System.runAs(testAdminUser) {

            // テストデータ作成
            Account account = CommonTester.createAccount(true);
            Account accountOther = CommonTester.createAccount(true);

            Test.startTest();
            
            // INSERT
            Case cs = CommonTester.createCase(account, true);
            // UPDATE
            cs.AccountId = accountOther.Id;
            update cs;
            
            Test.stopTest();

            Account resultAccount = [SELECT CaseCnt__c FROM Account WHERE Id =: account.Id LIMIT 1];
            System.assertEquals(resultAccount.CaseCnt__c, 0);

            Account resultAccountOther = [SELECT CaseCnt__c FROM Account WHERE Id =: accountOther.Id LIMIT 1];
            System.assertEquals(resultAccountOther.CaseCnt__c, 1);
        }
    }
}