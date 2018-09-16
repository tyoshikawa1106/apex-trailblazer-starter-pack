@isTest
private class OppLineItemRegisterDaoTest {

    private static OppLineItemRegisterDao dao = new OppLineItemRegisterDao();
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
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.Id), true);
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
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.Id), true);
        }
    }

    /**
     * 標準価格表情報取得
     */
    @isTest static void getPricebook2Test1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            Pricebook2 result = dao.getPricebook2();
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.Id), true);
        }
    }

    /**
     * 価格表エントリ取得
     * 値なし
     */
    @isTest static void getPricebookEntryListTest1() {
        
        System.runAs(testAdminUser) {

            Id pricebook2Id = null;
            List<Product2> product2List = new List<Product2>();

            Test.startTest();
            
            List<PricebookEntry> results = dao.getPricebookEntryList(pricebook2Id, product2List);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * 価格表エントリ取得
     * 値あり
     */
    @isTest static void getPricebookEntryListTest2() {
        
        System.runAs(testAdminUser) {

            // 商品テストデータ作成
            Product2 product2 = CommonTester.createProduct2(true);
            // 標準価格表ID
            Id pricebook2Id = Test.getStandardPricebookId();
            // 価格表エントリ
            PricebookEntry pricebookEntry = CommonTester.createPricebookEntry(product2, pricebook2Id, true);

            List<Product2> product2List = new List<Product2>();
            product2List.add(product2);

            Test.startTest();
            
            List<PricebookEntry> results = dao.getPricebookEntryList(pricebook2Id, product2List);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), false);
        }
    }

    /**
     * 商品情報取得
     * 値なし
     */
    @isTest static void getProduct2ListTest1() {
        
        System.runAs(testAdminUser) {

            String productName = '';
            String productCode = '';
            String productFamily = '';

            Test.startTest();
            
            List<Product2> results = dao.getProduct2List(productName, productCode, productFamily);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * 商品情報取得
     * 値あり
     */
    @isTest static void getProduct2ListTest2() {
        
        System.runAs(testAdminUser) {

            // 商品テストデータ作成
            Product2 product2 = CommonTester.createProduct2(true);

            String productName = product2.Name;
            String productCode = product2.ProductCode;
            String productFamily = product2.Family;

            Test.startTest();
            
            List<Product2> results = dao.getProduct2List(productName, productCode, productFamily);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), false);
        }
    }

    /**
     * 商品IDに紐付く商品情報を取得
     * 値なし
     */
    @isTest static void getProduct2ListByIdsTest1() {
        
        System.runAs(testAdminUser) {

            List<String> productIds = new List<String>();

            Test.startTest();
            
            List<Product2> results = dao.getProduct2ListByIds(productIds);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * 商品IDに紐付く商品情報を取得
     * 値あり
     */
    @isTest static void getProduct2ListByIdsTest2() {
        
        System.runAs(testAdminUser) {

            // 商品テストデータ作成
            Product2 product2 = CommonTester.createProduct2(true);

            List<String> productIds = new List<String>{product2.Id};

            Test.startTest();
            
            List<Product2> results = dao.getProduct2ListByIds(productIds);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), false);
        }
    }
}