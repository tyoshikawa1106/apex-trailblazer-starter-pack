@isTest
private class OppLineItemRegisterControllerTest {

    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * コンストラクタ
     */
    @isTest static void OppLineItemRegisterControllerTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            OppLineItemRegisterController cls = new OppLineItemRegisterController(new ApexPages.StandardController(new Opportunity()));
            
            Test.stopTest();
        }
    }

    /**
     * 初期処理
     * 値なし
     */
    @isTest static void initTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';

            Test.startTest();
            
            OppLineItemRegisterWrapper result = OppLineItemRegisterController.init(recordId);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.errorMessage), true);
        }
    }

    /**
     * 初期処理
     * 値あり
     */
    @isTest static void initTest2() {
        
        System.runAs(testAdminUser) {

            // 取引先テストデータ作成
            Account account = CommonTester.createAccount(true);
            // 商談テストデータ作成
            Opportunity opportunity = CommonTester.createOpportunity(account, true);

            String recordId = opportunity.Id;

            Test.startTest();
            
            OppLineItemRegisterWrapper result = OppLineItemRegisterController.init(recordId);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.errorMessage), true, result.errorMessage);
        }
    }

    /**
     * 商品検索
     * 値なし
     */
    @isTest static void doSearchTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';
            String productName = '';
            String productCode = '';
            String productFamily = '';

            Test.startTest();
            
            OppLineItemRegisterWrapper result = OppLineItemRegisterController.doSearch(recordId, productName, productCode, productFamily);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.errorMessage), true);
        }
    }

    /**
     * 商品検索
     * 値あり
     */
    @isTest static void doSearchTest2() {
        
        System.runAs(testAdminUser) {

            Account account = CommonTester.createAccount(true);
            Opportunity opportunity = CommonTester.createOpportunity(account, true);
            Product2 product2 = CommonTester.createProduct2(true);
            Id pricebook2Id = Test.getStandardPricebookId();
            PricebookEntry pricebookEntry = CommonTester.createPricebookEntry(product2, pricebook2Id, true);

            String recordId = opportunity.Id;
            String productName = product2.Name;
            String productCode = product2.ProductCode;
            String productFamily = product2.Family;

            Test.startTest();
            
            OppLineItemRegisterWrapper result = OppLineItemRegisterController.doSearch(recordId, productName, productCode, productFamily);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.errorMessage), true, result.errorMessage);
        }
    }

    /**
     * 商品選択
     * 値なし
     */
    @isTest static void doSelectProductTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';
            List<String> productIds = new List<String>();

            Test.startTest();
            
            OppLineItemRegisterWrapper result = OppLineItemRegisterController.doSelectProduct(recordId, productIds);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.errorMessage), true);
        }
    }

    /**
     * 商品選択
     * 値あり
     */
    @isTest static void doSelectProductTest2() {
        
        System.runAs(testAdminUser) {

            Account account = CommonTester.createAccount(true);
            Opportunity opportunity = CommonTester.createOpportunity(account, true);
            Product2 product2 = CommonTester.createProduct2(true);
            Id pricebook2Id = Test.getStandardPricebookId();
            PricebookEntry pricebookEntry = CommonTester.createPricebookEntry(product2, pricebook2Id, true);

            String recordId = opportunity.Id;
            List<String> productIds = new List<String>{product2.Id};

            Test.startTest();
            
            OppLineItemRegisterWrapper result = OppLineItemRegisterController.doSelectProduct(recordId, productIds);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.errorMessage), true, result.errorMessage);
        }
    }

    /**
     * 保存処理
     * 値なし
     */
    @isTest static void doSaveTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';
            List<OpportunityLineItem> opportunityLineItemList = new List<OpportunityLineItem>();

            Test.startTest();
            
            OppLineItemRegisterWrapper result = OppLineItemRegisterController.doSave(recordId, opportunityLineItemList);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.errorMessage), true);
        }
    }

    /**
     * 保存処理
     * 値あり
     */
    @isTest static void doSaveTest2() {
        
        System.runAs(testAdminUser) {

            Account account = CommonTester.createAccount(true);
            Opportunity opportunity = CommonTester.createOpportunity(account, true);
            Product2 product2 = CommonTester.createProduct2(true);
            Id pricebook2Id = Test.getStandardPricebookId();
            PricebookEntry pricebookEntry = CommonTester.createPricebookEntry(product2, pricebook2Id, true);
            OpportunityLineItem opportunityLineItem = CommonTester.createOpportunityLineItem(opportunity, pricebookEntry, false);

            String recordId = opportunity.Id;
            List<OpportunityLineItem> opportunityLineItemList = new List<OpportunityLineItem>{opportunityLineItem};

            Test.startTest();
            
            OppLineItemRegisterWrapper result = OppLineItemRegisterController.doSave(recordId, opportunityLineItemList);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.errorMessage), true, result.errorMessage);
        }
    }
}