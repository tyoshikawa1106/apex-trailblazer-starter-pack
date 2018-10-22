@isTest
private class OppLineItemListDaoTest {

    private static OppLineItemListDao dao = new OppLineItemListDao();
    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * 商談情報取得
     * 値なし
     */
    @isTest static void getOpportunityTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';

            Test.startTest();
            
            Opportunity result = dao.getOpportunity(recordId);
            System.assertEquals(String.isEmpty(result.Id), true);
            
            Test.stopTest();
        }
    }

    /**
     * 商談情報取得
     * 値あり
     */
    @isTest static void getOpportunityTest2() {
        
        System.runAs(testAdminUser) {

            Account account = CommonTester.createAccount(true);
            Opportunity opportunity = CommonTester.createOpportunity(account, true);

            String recordId = opportunity.Id;

            Test.startTest();
            
            Opportunity result = dao.getOpportunity(recordId);
            System.assertEquals(String.isNotEmpty(result.Id), true);
            
            Test.stopTest();
        }
    }

    /**
     * 商談商品情報取得
     * 値なし
     */
    @isTest static void getOpportunityLineItemListTest1() {
        
        System.runAs(testAdminUser) {

            String opportunityId = '';
            String productName = '';

            Test.startTest();
            
            List<OpportunityLineItem> results = dao.getOpportunityLineItemList(opportunityId, productName);
            System.assertEquals(results.isEmpty(), true);
            
            Test.stopTest();
        }
    }

    /**
     * 商談商品情報取得
     * 値あり
     */
    @isTest static void getOpportunityLineItemListTest2() {
        
        System.runAs(testAdminUser) {

            Account account = CommonTester.createAccount(true);
            Opportunity opportunity = CommonTester.createOpportunity(account, true);
            Product2 product2 = CommonTester.createProduct2(true);
            Id pricebook2Id = Test.getStandardPricebookId();
            PricebookEntry pricebookEntry = CommonTester.createPricebookEntry(product2, pricebook2Id, true);
            OpportunityLineItem opportunityLineItem = CommonTester.createOpportunityLineItem(opportunity, pricebookEntry, true);

            String opportunityId = opportunity.Id;
            String productName = product2.Name;

            Test.startTest();
            
            List<OpportunityLineItem> results = dao.getOpportunityLineItemList(opportunityId, productName);
            System.assertEquals(results.isEmpty(), false);
            
            Test.stopTest();
        }
    }

    /**
     * 更新用商談商品情報取得
     * 値なし
     */
    @isTest static void getEditOpportunityLineItemListTest1() {
        
        System.runAs(testAdminUser) {

            String opportunityId = '';
            List<String> opportunityLineItemIds = new List<String>();

            Test.startTest();
            
            List<OpportunityLineItem> results = dao.getEditOpportunityLineItemList(opportunityId, opportunityLineItemIds);
            System.assertEquals(results.isEmpty(), true);
            
            Test.stopTest();
        }
    }

    /**
     * 更新用商談商品情報取得
     * 値あり
     */
    @isTest static void getEditOpportunityLineItemListTest2() {
        
        System.runAs(testAdminUser) {

            Account account = CommonTester.createAccount(true);
            Opportunity opportunity = CommonTester.createOpportunity(account, true);
            Product2 product2 = CommonTester.createProduct2(true);
            Id pricebook2Id = Test.getStandardPricebookId();
            PricebookEntry pricebookEntry = CommonTester.createPricebookEntry(product2, pricebook2Id, true);
            OpportunityLineItem opportunityLineItem = CommonTester.createOpportunityLineItem(opportunity, pricebookEntry, true);

            String opportunityId = opportunity.Id;
            List<String> opportunityLineItemIds = new List<String>();
            opportunityLineItemIds.add(opportunityLineItem.Id);

            Test.startTest();
            
            List<OpportunityLineItem> results = dao.getEditOpportunityLineItemList(opportunityId, opportunityLineItemIds);
            System.assertEquals(results.isEmpty(), false);
            
            Test.stopTest();
        }
    }

    /**
     * 削除用商談商品情報取得
     * 値なし
     */
    @isTest static void getDeleteOpportunityLineItemListTest1() {
        
        System.runAs(testAdminUser) {

            String opportunityId = '';
            List<String> opportunityLineItemIds = new List<String>();

            Test.startTest();
            
            List<OpportunityLineItem> results = dao.getDeleteOpportunityLineItemList(opportunityId, opportunityLineItemIds);
            System.assertEquals(results.isEmpty(), true);
            
            Test.stopTest();
        }
    }

    /**
     * 削除用商談商品情報取得
     * 値あり
     */
    @isTest static void getDeleteOpportunityLineItemListTest2() {
        
        System.runAs(testAdminUser) {

            Account account = CommonTester.createAccount(true);
            Opportunity opportunity = CommonTester.createOpportunity(account, true);
            Product2 product2 = CommonTester.createProduct2(true);
            Id pricebook2Id = Test.getStandardPricebookId();
            PricebookEntry pricebookEntry = CommonTester.createPricebookEntry(product2, pricebook2Id, true);
            OpportunityLineItem opportunityLineItem = CommonTester.createOpportunityLineItem(opportunity, pricebookEntry, true);

            String opportunityId = opportunity.Id;
            List<String> opportunityLineItemIds = new List<String>();
            opportunityLineItemIds.add(opportunityLineItem.Id);

            Test.startTest();
            
            List<OpportunityLineItem> results = dao.getDeleteOpportunityLineItemList(opportunityId, opportunityLineItemIds);
            System.assertEquals(results.isEmpty(), false);
            
            Test.stopTest();
        }
    }
}