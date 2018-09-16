@isTest
private class OppLineItemRegisterWrapperTest {

    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * コンストラクタ
     */
    @isTest static void OppLineItemRegisterWrapperTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            OppLineItemRegisterWrapper result = new OppLineItemRegisterWrapper();
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.errorMessage), true);
        }
    }

    /**
     * 商品検索フィールド
     */
    @isTest static void ProductFieldTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            OppLineItemRegisterWrapper.ProductField result = new OppLineItemRegisterWrapper.ProductField();
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.product2.Id), true);
        }
    }

    /**
     * 商品検索フィールド
     */
    @isTest static void ProductFieldTest2() {
        
        System.runAs(testAdminUser) {

            Product2 product2 = new Product2();
            PricebookEntry pricebookEntry = new PricebookEntry();

            Test.startTest();
            
            OppLineItemRegisterWrapper.ProductField result = new OppLineItemRegisterWrapper.ProductField(product2, pricebookEntry);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.product2.Id), true);
        }
    }

    /**
     * 商談商品フィールド
     */
    @isTest static void OpportunityLineItemFieldTest1() {
        
        System.runAs(testAdminUser) {
            
            Test.startTest();
            
            OppLineItemRegisterWrapper.OpportunityLineItemField result = new OppLineItemRegisterWrapper.OpportunityLineItemField();
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.product2.Id), true);
        }
    }

    /**
     * 商談商品フィールド
     */
    @isTest static void OpportunityLineItemFieldTest2() {
        
        System.runAs(testAdminUser) {

            Product2 product2 = new Product2();
            PricebookEntry pricebookEntry = new PricebookEntry();
            OpportunityLineItem opportunityLineItem = new OpportunityLineItem();

            Test.startTest();
            
            OppLineItemRegisterWrapper.OpportunityLineItemField result = new OppLineItemRegisterWrapper.OpportunityLineItemField(product2, pricebookEntry, opportunityLineItem);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.product2.Id), true);
        }
    }
}