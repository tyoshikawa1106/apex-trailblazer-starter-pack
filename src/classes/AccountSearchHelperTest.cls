@isTest
private class AccountSearchHelperTest {

    private static AccountSearchHelper helper = new AccountSearchHelper();
    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * 取引先リスト取得判定
     */
    @isTest static void checkAccountListSizeTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // エラーあり
            AccountSearchWrapper wrapper = new AccountSearchWrapper();
            Integer accountListSize = null;
            wrapper = helper.checkAccountListSize(wrapper, accountListSize);
            System.assertEquals(String.isNotEmpty(wrapper.errorMessage), true);

            // エラーあり
            wrapper = new AccountSearchWrapper();
            accountListSize = 0;
            wrapper = helper.checkAccountListSize(wrapper, accountListSize);
            System.assertEquals(String.isNotEmpty(wrapper.errorMessage), true);

            // エラーなし
            wrapper = new AccountSearchWrapper();
            accountListSize = 1;
            wrapper = helper.checkAccountListSize(wrapper, accountListSize);
            System.assertEquals(String.isEmpty(wrapper.errorMessage), true);
            
            Test.stopTest();
        }
    }
}