@isTest
private class AccountSearchDaoTest {

    private static AccountSearchDao dao = new AccountSearchDao();
    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * 取引先検索
     * 値なし
     */
    @isTest static void AccountSearchWrapperTest1() {
        
        System.runAs(testAdminUser) {

            String accountName = '';
            String accountBillingState = '';

            Test.startTest();
            
            List<Account> results = dao.getAccounts(accountName, accountBillingState);
            System.assertEquals(results.isEmpty(), true);
            
            Test.stopTest();
        }
    }

    /**
     * 取引先検索
     * 値あり
     */
    @isTest static void AccountSearchWrapperTest2() {
        
        System.runAs(testAdminUser) {

            // 取引先テストデータ作成
            Account account = CommonTester.createAccount(true);

            String accountName = account.Name;
            String accountBillingState = account.BillingState;

            Test.startTest();
            
            List<Account> results = dao.getAccounts(accountName, accountBillingState);
            System.assertEquals(results.isEmpty(), false);
            
            Test.stopTest();
        }
    }
}