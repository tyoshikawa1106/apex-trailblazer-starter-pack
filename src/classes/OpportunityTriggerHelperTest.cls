@isTest
private class OpportunityTriggerHelperTest {

    private static OpportunityTriggerHelper helper = new OpportunityTriggerHelper();
    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * 価格表項目に値をセット
     * 値なし
     */
    @isTest static void setPriceBook2IdTest1() {
        
        System.runAs(testAdminUser) {

            List<Opportunity> opportunities = new List<Opportunity>();
            Id priceBook2Id = null;

            Test.startTest();
            
            List<Opportunity> resutls = helper.setPriceBook2Id(opportunities, priceBook2Id);
            
            Test.stopTest();

            System.assertEquals(resutls.isEmpty(), true);
        }
    }

    /**
     * 価格表項目に値をセット
     * 値あり
     */
    @isTest static void setPriceBook2IdTest2() {
        
        System.runAs(testAdminUser) {

            Account account = CommonTester.createAccount(true);
            Contact contact = CommonTester.createContact(account, true);
            Opportunity opportunity = CommonTester.createOpportunity(account, false);

            List<Opportunity> opportunities = new List<Opportunity>();
            opportunities.add(opportunity);
            Id priceBook2Id = Test.getStandardPricebookId();

            Test.startTest();
            
            List<Opportunity> resutls = helper.setPriceBook2Id(opportunities, priceBook2Id);
            
            Test.stopTest();

            System.assertEquals(resutls.isEmpty(), false);
            System.assertEquals(String.isNotEmpty(resutls[0].Pricebook2Id), true);
            System.assertEquals(resutls[0].Pricebook2Id, priceBook2Id);
        }
    }

    /**
     * 価格表項目に値をセット
     * 標準価格表なし
     */
    @isTest static void setPriceBook2IdTest3() {
        
        System.runAs(testAdminUser) {

            Account account = CommonTester.createAccount(true);
            Contact contact = CommonTester.createContact(account, true);
            Opportunity opportunity = CommonTester.createOpportunity(account, false);

            List<Opportunity> opportunities = new List<Opportunity>();
            opportunities.add(opportunity);
            Id priceBook2Id = null;

            Test.startTest();
            
            List<Opportunity> resutls = helper.setPriceBook2Id(opportunities, priceBook2Id);
            
            Test.stopTest();

            System.assertEquals(resutls.isEmpty(), false);
            System.assertEquals(String.isEmpty(resutls[0].Pricebook2Id), true);
        }
    }
}