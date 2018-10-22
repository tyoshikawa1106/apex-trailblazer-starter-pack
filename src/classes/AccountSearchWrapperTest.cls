@isTest
private class AccountSearchWrapperTest {

    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * コンストラクタ
     */
    @isTest static void AccountSearchWrapperTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            AccountSearchWrapper wrapper = new AccountSearchWrapper();
            System.assertEquals(String.isEmpty(wrapper.errorMessage), true, wrapper.errorMessage);
            System.assertEquals(wrapper.accounts.isEmpty(), true);
            
            Test.stopTest();
        }
    }
}