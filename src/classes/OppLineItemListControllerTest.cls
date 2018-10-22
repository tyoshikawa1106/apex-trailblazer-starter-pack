@isTest
private class OppLineItemListControllerTest {

    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * コンストラクタ
     */
    @isTest static void OppLineItemListControllerTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            OppLineItemListController cls = new OppLineItemListController(new ApexPages.StandardController(new Opportunity()));
            
            Test.stopTest();
        }
    }

    /**
     * 初期処理
     */
    @isTest static void initTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';

            Test.startTest();
            
            OppLineItemListWrapper wrapper = OppLineItemListController.init(recordId);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(wrapper.errorMessage), true);
        }
    }

    /**
     * 初期処理
     */
    @isTest static void initTest2() {
        
        System.runAs(testAdminUser) {

            Account account = CommonTester.createAccount(true);
            Opportunity opportunity = CommonTester.createOpportunity(account, true);
            Product2 product2 = CommonTester.createProduct2(true);
            Id pricebook2Id = Test.getStandardPricebookId();
            PricebookEntry pricebookEntry = CommonTester.createPricebookEntry(product2, pricebook2Id, true);
            OpportunityLineItem opportunityLineItem = CommonTester.createOpportunityLineItem(opportunity, pricebookEntry, true);

            String recordId = opportunity.Id;

            Test.startTest();
            
            OppLineItemListWrapper wrapper = OppLineItemListController.init(recordId);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(wrapper.errorMessage), true, wrapper.errorMessage);
        }
    }

    /**
     * 商談商品検索
     * エラーあり
     */
    @isTest static void doSearchOpportunityLineItemTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';
            String productName = '';

            Test.startTest();
            
            OppLineItemListWrapper wrapper = OppLineItemListController.doSearchOpportunityLineItem(recordId, productName);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(wrapper.errorMessage), true);
        }
    }

    /**
     * 商談商品検索
     * エラーなし
     */
    @isTest static void doSearchOpportunityLineItemTest2() {
        
        System.runAs(testAdminUser) {

            Account account = CommonTester.createAccount(true);
            Opportunity opportunity = CommonTester.createOpportunity(account, true);
            Product2 product2 = CommonTester.createProduct2(true);
            Id pricebook2Id = Test.getStandardPricebookId();
            PricebookEntry pricebookEntry = CommonTester.createPricebookEntry(product2, pricebook2Id, true);
            OpportunityLineItem opportunityLineItem = CommonTester.createOpportunityLineItem(opportunity, pricebookEntry, true);

            String recordId = opportunity.Id;
            String productName = '';

            Test.startTest();
            
            OppLineItemListWrapper wrapper = OppLineItemListController.doSearchOpportunityLineItem(recordId, productName);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(wrapper.errorMessage), true, wrapper.errorMessage);
        }
    }

    /**
     * 編集対象の商談商品取得
     * エラーあり
     */
    @isTest static void doSelectEditOpportunityLineItemTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';
            List<String> opportunityLineItemIds = new List<String>();

            Test.startTest();
            
            OppLineItemListWrapper wrapper = OppLineItemListController.doSelectEditOpportunityLineItem(recordId, opportunityLineItemIds);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(wrapper.errorMessage), true);
        }
    }

    /**
     * 編集対象の商談商品取得
     * エラーなし
     */
    @isTest static void doSelectEditOpportunityLineItemTest2() {
        
        System.runAs(testAdminUser) {

            Account account = CommonTester.createAccount(true);
            Opportunity opportunity = CommonTester.createOpportunity(account, true);
            Product2 product2 = CommonTester.createProduct2(true);
            Id pricebook2Id = Test.getStandardPricebookId();
            PricebookEntry pricebookEntry = CommonTester.createPricebookEntry(product2, pricebook2Id, true);
            OpportunityLineItem opportunityLineItem = CommonTester.createOpportunityLineItem(opportunity, pricebookEntry, true);

            String recordId = opportunity.Id;
            List<String> opportunityLineItemIds = new List<String>();
            opportunityLineItemIds.add(opportunityLineItem.Id);

            Test.startTest();
            
            OppLineItemListWrapper wrapper = OppLineItemListController.doSelectEditOpportunityLineItem(recordId, opportunityLineItemIds);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(wrapper.errorMessage), true, wrapper.errorMessage);
        }
    }

    /**
     * 商談商品の更新
     */
    @isTest static void doUpdateOpportunityLineItemTest1() {
        
        System.runAs(testAdminUser) {

            Account account = CommonTester.createAccount(true);
            Opportunity opportunity = CommonTester.createOpportunity(account, true);
            Product2 product2 = CommonTester.createProduct2(true);
            Id pricebook2Id = Test.getStandardPricebookId();
            PricebookEntry pricebookEntry = CommonTester.createPricebookEntry(product2, pricebook2Id, true);
            OpportunityLineItem opportunityLineItem = CommonTester.createOpportunityLineItem(opportunity, pricebookEntry, true);

            List<OpportunityLineItem> opportunityLineItemList = new List<OpportunityLineItem>();
            opportunityLineItemList.add(opportunityLineItem);

            Test.startTest();
            
            OppLineItemListWrapper wrapper = OppLineItemListController.doUpdateOpportunityLineItem(opportunityLineItemList);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(wrapper.errorMessage), true, wrapper.errorMessage);
        }
    }

    /**
     * 削除対象の商談商品取得
     * エラーあり
     */
    @isTest static void doSelectDeleteOpportunityLineItemTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';
            List<String> opportunityLineItemIds = new List<String>();

            Test.startTest();
            
            OppLineItemListWrapper wrapper = OppLineItemListController.doSelectDeleteOpportunityLineItem(recordId, opportunityLineItemIds);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(wrapper.errorMessage), true);
        }
    }

    /**
     * 削除対象の商談商品取得
     * エラーなし
     */
    @isTest static void doSelectDeleteOpportunityLineItemTest2() {
        
        System.runAs(testAdminUser) {

            Account account = CommonTester.createAccount(true);
            Opportunity opportunity = CommonTester.createOpportunity(account, true);
            Product2 product2 = CommonTester.createProduct2(true);
            Id pricebook2Id = Test.getStandardPricebookId();
            PricebookEntry pricebookEntry = CommonTester.createPricebookEntry(product2, pricebook2Id, true);
            OpportunityLineItem opportunityLineItem = CommonTester.createOpportunityLineItem(opportunity, pricebookEntry, true);

            String recordId = opportunity.Id;
            List<String> opportunityLineItemIds = new List<String>();
            opportunityLineItemIds.add(opportunityLineItem.Id);

            Test.startTest();
            
            OppLineItemListWrapper wrapper = OppLineItemListController.doSelectDeleteOpportunityLineItem(recordId, opportunityLineItemIds);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(wrapper.errorMessage), true, wrapper.errorMessage);
        }
    }

    /**
     * 商談商品削除
     */
    @isTest static void doDeleteOpportunityLineItemTest1() {
        
        System.runAs(testAdminUser) {

            Account account = CommonTester.createAccount(true);
            Opportunity opportunity = CommonTester.createOpportunity(account, true);
            Product2 product2 = CommonTester.createProduct2(true);
            Id pricebook2Id = Test.getStandardPricebookId();
            PricebookEntry pricebookEntry = CommonTester.createPricebookEntry(product2, pricebook2Id, true);
            OpportunityLineItem opportunityLineItem = CommonTester.createOpportunityLineItem(opportunity, pricebookEntry, true);

            String recordId = opportunity.Id;
            List<String> opportunityLineItemIds = new List<String>();
            opportunityLineItemIds.add(opportunityLineItem.Id);

            // 削除判定(実行前)
            Integer resultCnt = [SELECT COUNT() FROM OpportunityLineItem WHERE Id =: opportunityLineItem.Id];
            System.assertEquals(resultCnt, 1);

            Test.startTest();
            
            OppLineItemListWrapper wrapper = OppLineItemListController.doDeleteOpportunityLineItem(recordId, opportunityLineItemIds);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(wrapper.errorMessage), true, wrapper.errorMessage);
            // 削除判定(実行後)
            resultCnt = [SELECT COUNT() FROM OpportunityLineItem WHERE Id =: opportunityLineItem.Id];
            System.assertEquals(resultCnt, 0);
        }
    }
}