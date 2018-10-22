@isTest
private class OppLineItemRegisterHelperTest {

    private static OppLineItemRegisterHelper helper = new OppLineItemRegisterHelper();
    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * 商談情報取得判定
     */
    @isTest static void checkOpportunityIdTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // 値なし
            OppLineItemRegisterWrapper wrapper = new OppLineItemRegisterWrapper();
            String opportunityId = '';
            OppLineItemRegisterWrapper result = helper.checkOpportunityId(wrapper, opportunityId);
            System.assertEquals(String.isNotEmpty(wrapper.errorMessage), true);

            // 値あり
            wrapper = new OppLineItemRegisterWrapper();
            opportunityId = 'xxx';
            result = helper.checkOpportunityId(wrapper, opportunityId);
            System.assertEquals(String.isEmpty(wrapper.errorMessage), true, wrapper.errorMessage);
            
            Test.stopTest();
        }
    }

    /**
     * 商品情報取得判定
     */
    @isTest static void checkProduct2ListSizeTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // 値なし
            OppLineItemRegisterWrapper wrapper = new OppLineItemRegisterWrapper();
            Integer product2ListSize = null;
            OppLineItemRegisterWrapper result = helper.checkProduct2ListSize(wrapper, product2ListSize);
            System.assertEquals(String.isNotEmpty(wrapper.errorMessage), true);

            // 値あり
            wrapper = new OppLineItemRegisterWrapper();
            product2ListSize = 0;
            result = helper.checkProduct2ListSize(wrapper, product2ListSize);
            System.assertEquals(String.isNotEmpty(wrapper.errorMessage), true);

            // 値あり
            wrapper = new OppLineItemRegisterWrapper();
            product2ListSize = 1;
            result = helper.checkProduct2ListSize(wrapper, product2ListSize);
            System.assertEquals(String.isEmpty(wrapper.errorMessage), true, wrapper.errorMessage);
            
            Test.stopTest();
        }
    }

    /**
     * 標準価格表情報取得判定
     */
    @isTest static void checkPricebook2IdTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // 値なし
            OppLineItemRegisterWrapper wrapper = new OppLineItemRegisterWrapper();
            String pricebook2Id = '';
            OppLineItemRegisterWrapper result = helper.checkPricebook2Id(wrapper, pricebook2Id);
            System.assertEquals(String.isNotEmpty(wrapper.errorMessage), true);

            // 値あり
            wrapper = new OppLineItemRegisterWrapper();
            pricebook2Id = 'xxx';
            result = helper.checkPricebook2Id(wrapper, pricebook2Id);
            System.assertEquals(String.isEmpty(wrapper.errorMessage), true, wrapper.errorMessage);
            
            Test.stopTest();
        }
    }

    /**
     * 価格表エントリ情報取得判定
     */
    @isTest static void checkPricebookEntryListSizeTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // 値なし
            OppLineItemRegisterWrapper wrapper = new OppLineItemRegisterWrapper();
            Integer pricebookEntryListSize = null;
            OppLineItemRegisterWrapper result = helper.checkPricebookEntryListSize(wrapper, pricebookEntryListSize);
            System.assertEquals(String.isNotEmpty(wrapper.errorMessage), true);

            // 値あり
            wrapper = new OppLineItemRegisterWrapper();
            pricebookEntryListSize = 0;
            result = helper.checkPricebookEntryListSize(wrapper, pricebookEntryListSize);
            System.assertEquals(String.isNotEmpty(wrapper.errorMessage), true);

            // 値あり
            wrapper = new OppLineItemRegisterWrapper();
            pricebookEntryListSize = 1;
            result = helper.checkPricebookEntryListSize(wrapper, pricebookEntryListSize);
            System.assertEquals(String.isEmpty(wrapper.errorMessage), true, wrapper.errorMessage);
            
            Test.stopTest();
        }
    }

    /**
     * 商談商品の作成権限判定
     */
    @isTest static void checkIsCreateableOpportunityLineItemTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            OppLineItemRegisterWrapper wrapper = new OppLineItemRegisterWrapper();
            Boolean isTestable = true;
            OppLineItemRegisterWrapper result = helper.checkIsCreateableOpportunityLineItem(wrapper, isTestable);
            System.assertEquals(String.isNotEmpty(wrapper.errorMessage), true);
            
            Test.stopTest();
        }
    }

    /**
     * 価格表エントリマップ取得
     * 値なし
     */
    @isTest static void getPricebookEntryMapTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            List<PricebookEntry> pricebookEntryList = new List<PricebookEntry>();
            Map<Id, PricebookEntry> result = helper.getPricebookEntryMap(pricebookEntryList);
            System.assertEquals(result.isEmpty(), true);
            
            Test.stopTest();
        }
    }

    /**
     * 価格表エントリマップ取得
     * 値あり
     */
    @isTest static void getPricebookEntryMapTest2() {
        
        System.runAs(testAdminUser) {

            // 商品テストデータ作成
            Product2 product2 = CommonTester.createProduct2(true);
            // 標準価格表ID
            Id pricebook2Id = Test.getStandardPricebookId();
            // 価格表エントリ
            PricebookEntry pricebookEntry = CommonTester.createPricebookEntry(product2, pricebook2Id, true);

            Test.startTest();
            
            List<PricebookEntry> pricebookEntryList = new List<PricebookEntry>();
            pricebookEntryList.add(pricebookEntry);
            Map<Id, PricebookEntry> result = helper.getPricebookEntryMap(pricebookEntryList);
            System.assertEquals(result.isEmpty(), false);
            
            Test.stopTest();
        }
    }

    /**
     * 商品フィールドリスト取得
     * 値なし
     */
    @isTest static void getProductFieldListTest1() {
        
        System.runAs(testAdminUser) {

            List<Product2> product2List = new List<Product2>();
            Map<Id, PricebookEntry> pricebookEntryMap = new Map<Id, PricebookEntry>();

            Test.startTest();
            
            List<OppLineItemRegisterWrapper.ProductField> results = helper.getProductFieldList(product2List, pricebookEntryMap);
            System.assertEquals(results.isEmpty(), true);
            
            Test.stopTest();
        }
    }

    /**
     * 商品フィールドリスト取得
     * 値あり
     */
    @isTest static void getProductFieldListTest2() {
        
        System.runAs(testAdminUser) {

            // 商品テストデータ作成
            Product2 product2 = CommonTester.createProduct2(true);
            // 標準価格表ID
            Id pricebook2Id = Test.getStandardPricebookId();
            // 価格表エントリ
            PricebookEntry pricebookEntry = CommonTester.createPricebookEntry(product2, pricebook2Id, true);

            List<Product2> product2List = new List<Product2>();
            product2List.add(product2);
            Map<Id, PricebookEntry> pricebookEntryMap = new Map<Id, PricebookEntry>();
            pricebookEntryMap.put(product2.Id, pricebookEntry);

            Test.startTest();
            
            List<OppLineItemRegisterWrapper.ProductField> results = helper.getProductFieldList(product2List, pricebookEntryMap);
            System.assertEquals(results.isEmpty(), false);
            
            Test.stopTest();
        }
    }

    /**
     * 商談商品フィールドリスト取得
     * 値なし
     */
    @isTest static void getOpportunityLineItemFieldsTest1() {
        
        System.runAs(testAdminUser) {

            List<Product2> product2List = new List<Product2>();
            Opportunity opportunity = new Opportunity();
            Map<Id, PricebookEntry> pricebookEntryMap = new Map<Id, PricebookEntry>();

            Test.startTest();
            
            List<OppLineItemRegisterWrapper.OpportunityLineItemField> results = helper.getOpportunityLineItemFields(product2List, opportunity, pricebookEntryMap);
            System.assertEquals(results.isEmpty(), true);
            
            Test.stopTest();
        }
    }

    /**
     * 商談商品フィールドリスト取得
     * 値あり
     */
    @isTest static void getOpportunityLineItemFieldsTest2() {
        
        System.runAs(testAdminUser) {
            
            // 取引先テストデータ作成
            Account account = CommonTester.createAccount(true);
            // 商談テストデータ作成
            Opportunity opportunity = CommonTester.createOpportunity(account, true);
            // 商品テストデータ作成
            Product2 product2 = CommonTester.createProduct2(true);
            // 標準価格表ID
            Id pricebook2Id = Test.getStandardPricebookId();
            // 価格表エントリ
            PricebookEntry pricebookEntry = CommonTester.createPricebookEntry(product2, pricebook2Id, true);

            List<Product2> product2List = new List<Product2>();
            product2List.add(product2);
            Map<Id, PricebookEntry> pricebookEntryMap = new Map<Id, PricebookEntry>();
            pricebookEntryMap.put(product2.Id, pricebookEntry);

            Test.startTest();
            
            List<OppLineItemRegisterWrapper.OpportunityLineItemField> results = helper.getOpportunityLineItemFields(product2List, opportunity, pricebookEntryMap);
            System.assertEquals(results.isEmpty(), false);
            
            Test.stopTest();
        }
    }
}