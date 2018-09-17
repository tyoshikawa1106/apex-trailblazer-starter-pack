@isTest
private class OpportunityTriggerHandlerTest {

    private static OpportunityTriggerHelper helper = new OpportunityTriggerHelper();
    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * 価格表項目に値をセット
     */
    @isTest static void setPricebookFieldTest1() {
        
        System.runAs(testAdminUser) {

            Account account = CommonTester.createAccount(true);
            Contact contact = CommonTester.createContact(account, true);

            Test.startTest();
            
            Opportunity opportunity = CommonTester.createOpportunity(account, true);
            
            Test.stopTest();

            Opportunity resultOpportunity = [SELECT Id,PriceBook2Id FROM Opportunity WHERE Id =: opportunity.Id LIMIT 1];
            System.assertEquals(String.isNotEmpty(resultOpportunity.PriceBook2Id), true);
            System.assertEquals(resultOpportunity.PriceBook2Id, Test.getStandardPricebookId());
        }
    }
}