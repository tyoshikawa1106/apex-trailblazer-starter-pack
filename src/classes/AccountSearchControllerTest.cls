@isTest
private class AccountSearchControllerTest {

    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * コンストラクタ
     */
    @isTest static void AccountSearchControllerTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            AccountSearchController cls = new AccountSearchController();
            
            Test.stopTest();
        }
    }

    /**
     * 初期処理
     */
    @isTest static void initTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            AccountSearchWrapper wrapper = AccountSearchController.init();
            
            Test.stopTest();
        }
    }

    /**
     * 取引先検索
     */
    @isTest static void getAccountsTest1() {
        
        System.runAs(testAdminUser) {

            String accountName = '';
            String accountBillingState = '';

            Test.startTest();
            
            AccountSearchWrapper wrapper = AccountSearchController.getAccounts(accountName, accountBillingState);
            
            Test.stopTest();

            System.assertEquals(wrapper.accounts.isEmpty(), true);
        }
    }

    /**
     * 取引先検索
     */
    @isTest static void getAccountsTest2() {
        
        System.runAs(testAdminUser) {

            // 取引先テストデータ作成
            Account account = CommonTester.createAccount(true);

            String accountName = account.Name;
            String accountBillingState = account.BillingState;

            Test.startTest();
            
            AccountSearchWrapper wrapper = AccountSearchController.getAccounts(accountName, accountBillingState);
            
            Test.stopTest();

            System.assertEquals(wrapper.accounts.isEmpty(), false);
        }
    }
}