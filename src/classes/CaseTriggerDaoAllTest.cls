@isTest
private class CaseTriggerDaoAllTest {

    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * 取引先に紐付くケースの件数を取得
     * テストデータなし
     */
    static testMethod void getCaseCntWithAccountTest1() {
        
        System.runAs(testAdminUser) {

            Set<Id> accountIds = new Set<Id>();

            Test.startTest();
            
            List<Account> accounts = CaseTriggerDaoAll.getCaseCntWithAccount(accountIds);
            
            Test.stopTest();

            System.assertEquals(accounts.size(), 0);
        }
    }

    /**
     * 取引先に紐付くケースの件数を取得
     * テストデータあり
     */
    static testMethod void getCaseCntWithAccountTest2() {
        
        System.runAs(testAdminUser) {

            // テストデータ作成
            Account account = CommonTester.createAccount(true);
            Case cs1 = CommonTester.createCase(account, true);
            Case cs2 = CommonTester.createCase(account, true);

            // パラメータ
            Set<Id> accountIds = new Set<Id>();
            accountIds.add(account.Id);

            Test.startTest();
            
            List<Account> accounts = CaseTriggerDaoAll.getCaseCntWithAccount(accountIds);
            
            Test.stopTest();

            System.assertEquals(accounts.size(), 1);
            System.assertEquals(accounts[0].Cases.size(), 2);
        }
    }
}