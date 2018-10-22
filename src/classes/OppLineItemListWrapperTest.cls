@isTest
private class OppLineItemListWrapperTest {
    
    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * コンストラクタ
     */
    @isTest static void OppLineItemListWrapperTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            OppLineItemListWrapper wrapper = new OppLineItemListWrapper();
            System.assertEquals(String.isEmpty(wrapper.errorMessage), true, wrapper.errorMessage);
            
            Test.stopTest();
        }
    }

    /**
     * 商談商品フィールド
     */
    @isTest static void OpportunityLineItemFieldTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            OppLineItemListWrapper.OpportunityLineItemField fields = new OppLineItemListWrapper.OpportunityLineItemField();
            System.assertEquals(fields.isChecked, false);

            fields = new OppLineItemListWrapper.OpportunityLineItemField(new OpportunityLineItem());
            System.assertEquals(fields.isChecked, false);
            
            Test.stopTest();
        }
    }
}