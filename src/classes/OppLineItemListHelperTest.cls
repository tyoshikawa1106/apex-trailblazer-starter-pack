@isTest
private class OppLineItemListHelperTest {

    private static OppLineItemListHelper helper = new OppLineItemListHelper();
    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * 商談情報取得判定
     */
    @isTest static void checkOpportunityIdTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // エラーメッセージあり
            OppLineItemListWrapper wrapper = new OppLineItemListWrapper();
            String opportunityId = '';
            OppLineItemListWrapper result = helper.checkOpportunityId(wrapper, opportunityId);
            System.assertEquals(String.isNotEmpty(result.errorMessage), true);

            // エラーメッセージなし
            wrapper = new OppLineItemListWrapper();
            opportunityId = 'xxxxxxxxxx';
            result = helper.checkOpportunityId(wrapper, opportunityId);
            System.assertEquals(String.isEmpty(result.errorMessage), true);
            
            Test.stopTest();
        }
    }

    /**
     * 商談商品情報取得判定
     */
    @isTest static void checkOpportunityLineItemListSizeTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // エラーメッセージあり
            OppLineItemListWrapper wrapper = new OppLineItemListWrapper();
            Integer opportunityLineItemSize = 0;
            OppLineItemListWrapper result = helper.checkOpportunityLineItemListSize(wrapper, opportunityLineItemSize);
            System.assertEquals(String.isNotEmpty(result.errorMessage), true);

            // エラーメッセージなし
            wrapper = new OppLineItemListWrapper();
            opportunityLineItemSize = 1;
            result = helper.checkOpportunityLineItemListSize(wrapper, opportunityLineItemSize);
            System.assertEquals(String.isEmpty(result.errorMessage), true);
            
            Test.stopTest();
        }
    }

    /**
     * 商談商品の編集権限判定
     */
    @isTest static void checkIsUpdateableOpportunityLineItemTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // エラーメッセージあり
            OppLineItemListWrapper wrapper = new OppLineItemListWrapper();
            Boolean isTestable = true;
            OppLineItemListWrapper result = helper.checkIsUpdateableOpportunityLineItem(wrapper, isTestable);
            System.assertEquals(String.isNotEmpty(result.errorMessage), true);

            // エラーメッセージなし
            wrapper = new OppLineItemListWrapper();
            isTestable = false;
            result = helper.checkIsUpdateableOpportunityLineItem(wrapper, isTestable);
            System.assertEquals(String.isEmpty(result.errorMessage), true);
            
            Test.stopTest();
        }
    }

    /**
     * 商談商品保存処理の必須チェック
     */
    @isTest static void checkOpportunityLineItemRequiredFieldsTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // 単価未入力エラー
            OppLineItemListWrapper wrapper = new OppLineItemListWrapper();
            List<OpportunityLineItem> opportunityLineItems = new List<OpportunityLineItem>();
            opportunityLineItems.add(new OpportunityLineItem(UnitPrice = null, Quantity = 1));
            OppLineItemListWrapper result = helper.checkOpportunityLineItemRequiredFields(wrapper, opportunityLineItems);
            System.assertEquals(String.isNotEmpty(result.errorMessage), true);

            // 数量未入力エラー
            wrapper = new OppLineItemListWrapper();
            opportunityLineItems = new List<OpportunityLineItem>();
            opportunityLineItems.add(new OpportunityLineItem(UnitPrice = 1, Quantity = null));
            result = helper.checkOpportunityLineItemRequiredFields(wrapper, opportunityLineItems);
            System.assertEquals(String.isNotEmpty(result.errorMessage), true);

            // 未入力エラーなし
            wrapper = new OppLineItemListWrapper();
            opportunityLineItems = new List<OpportunityLineItem>();
            opportunityLineItems.add(new OpportunityLineItem(UnitPrice = 1, Quantity = 1));
            result = helper.checkOpportunityLineItemRequiredFields(wrapper, opportunityLineItems);
            System.assertEquals(String.isEmpty(result.errorMessage), true);
            
            Test.stopTest();
        }
    }

    /**
     * 商談商品保存処理の日付項目判定
     */
    @isTest static void checkOpportunityLineItemDateFieldsTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // リストなし
            List<OpportunityLineItem> opportunityLineItems = new List<OpportunityLineItem>();
            List<OpportunityLineItem> results = helper.checkOpportunityLineItemDateFields(opportunityLineItems);
            System.assertEquals(results.isEmpty(), true);

            // リストあり
            opportunityLineItems = new List<OpportunityLineItem>();
            opportunityLineItems.add(new OpportunityLineItem());
            results = helper.checkOpportunityLineItemDateFields(opportunityLineItems);
            System.assertEquals(results.isEmpty(), false);
            
            Test.stopTest();
        }
    }

    /**
     * 商談商品の削除権限判定
     */
    @isTest static void checkIsDeletableOpportunityLineItemTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // エラーメッセージあり
            OppLineItemListWrapper wrapper = new OppLineItemListWrapper();
            Boolean isTestable = true;
            OppLineItemListWrapper result = helper.checkIsDeletableOpportunityLineItem(wrapper, isTestable);
            System.assertEquals(String.isNotEmpty(result.errorMessage), true);

            // エラーメッセージなし
            wrapper = new OppLineItemListWrapper();
            isTestable = false;
            result = helper.checkIsDeletableOpportunityLineItem(wrapper, isTestable);
            System.assertEquals(String.isEmpty(result.errorMessage), true);
            
            Test.stopTest();
        }
    }

    /**
     * 商談商品フィールドリスト取得
     */
    @isTest static void getOpportunityLineItemFieldListTest1() {
        
        System.runAs(testAdminUser) {

            Account account = CommonTester.createAccount(true);
            Opportunity opportunity = CommonTester.createOpportunity(account, true);
            Product2 product2 = CommonTester.createProduct2(true);
            Id pricebook2Id = Test.getStandardPricebookId();
            PricebookEntry pricebookEntry = CommonTester.createPricebookEntry(product2, pricebook2Id, true);
            OpportunityLineItem opportunityLineItem = CommonTester.createOpportunityLineItem(opportunity, pricebookEntry, true);

            Test.startTest();
            
            // エラーメッセージあり
            List<OpportunityLineItem> opportunityLineItems = new List<OpportunityLineItem>();
            List<OppLineItemListWrapper.OpportunityLineItemField> results = helper.getOpportunityLineItemFieldList(opportunityLineItems);
            System.assertEquals(results.isEmpty(), true);

            // エラーメッセージなし
            opportunityLineItems = new List<OpportunityLineItem>();
            opportunityLineItems.add(opportunityLineItem);
            results = helper.getOpportunityLineItemFieldList(opportunityLineItems);
            System.assertEquals(results.isEmpty(), false);
            
            Test.stopTest();
        }
    }
}