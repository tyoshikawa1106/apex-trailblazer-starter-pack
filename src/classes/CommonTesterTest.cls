@isTest
private class CommonTesterTest {

    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * テスト実行ユーザ取得
     */
    @isTest static void getLoginUserTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            User result = CommonTester.getLoginUser();
            System.assertEquals(result.Id, UserInfo.getUserId());
            
            Test.stopTest();
        }
    }

    /**
     * テスト実行ページ取得
     */
    @isTest static void getPageReferenceTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            PageReference result = CommonTester.getPageReference();
            System.assertEquals(result.getUrl(), new PageReference('PageReference').getUrl());
            
            Test.stopTest();
        }
    }

    /**
     * 取引先
     */
    @isTest static void createAccountTest() {

        System.runAs(testAdminUser) {

            Test.startTest();
            
            // Insertなし
            Account account = CommonTester.createAccount(false);
            System.assertEquals(String.isEmpty(account.Id), true);
            
            // Insertあり
            account = CommonTester.createAccount(true);
            System.assertEquals(String.isNotEmpty(account.Id), true);
            
            Test.stopTest();
        }
    }

    /**
     * 取引先責任者
     */
    @isTest static void createContactTest() {

        System.runAs(testAdminUser) {

            Account account = CommonTester.createAccount(true);
            
            Test.startTest();
            
            // Insertなし
            Contact contact = CommonTester.createContact(account, false);
            System.assertEquals(String.isEmpty(contact.Id), true);
            
            // Insertあり
            contact = CommonTester.createContact(account, true);
            System.assertEquals(String.isNotEmpty(contact.Id), true);
            
            Test.stopTest();
        }
    }

    /**
     * 商談
     */
    @isTest static void createOpportunityTest() {
        
        System.runAs(testAdminUser) {

            Account account = CommonTester.createAccount(true);
            
            Test.startTest();
            
            // Insertなし
            Opportunity opportunity = CommonTester.createOpportunity(account, false);
            System.assertEquals(String.isEmpty(opportunity.Id), true);
            
            // Insertあり
            opportunity = CommonTester.createOpportunity(account, true);
            System.assertEquals(String.isNotEmpty(opportunity.Id), true);
            
            Test.stopTest();
        }
    }
    
    /**
     * 商談の取引先責任者の役割
     */
    @isTest static void createOpportunityContactRoleTest() {
        
        System.runAs(testAdminUser) {

            Account account = CommonTester.createAccount(true);
            Contact contact = CommonTester.createContact(account, true);
            Opportunity opportunity = CommonTester.createOpportunity(account, true);
            
            Test.startTest();
            
            // Insertなし
            OpportunityContactRole opportunityContactRole = CommonTester.createOpportunityContactRole(opportunity, contact, false);
            System.assertEquals(String.isEmpty(opportunityContactRole.Id), true);
            
            // Insertあり
            opportunityContactRole = CommonTester.createOpportunityContactRole(opportunity, contact, true);
            System.assertEquals(String.isNotEmpty(opportunity.Id), true);
            
            Test.stopTest();
        }
    }
    
    /**
     * 商品
     */
    @isTest static void createProduct2Test() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // Insertなし
            Product2 product2 = CommonTester.createProduct2(false);
            System.assertEquals(String.isEmpty(product2.Id), true);
            
            // Insertあり
            product2 = CommonTester.createProduct2(true);
            System.assertEquals(String.isNotEmpty(product2.Id), true);
            
            Test.stopTest();
        }
    }
    
    /**
     * 価格表エントリ
     */
    @isTest static void createPricebookEntryTest() {
        
        System.runAs(testAdminUser) {

            // 商品テストデータ作成
            Product2 product2 = CommonTester.createProduct2(true);
            // 標準価格表ID
            Id pricebook2Id = Test.getStandardPricebookId();
            
            Test.startTest();
            
            // Insertなし
            PricebookEntry pricebookEntry = CommonTester.createPricebookEntry(product2, pricebook2Id, false);
            System.assertEquals(String.isEmpty(pricebookEntry.Id), true);
            
            // Insertあり
            pricebookEntry = CommonTester.createPricebookEntry(product2, pricebook2Id, true);
            System.assertEquals(String.isNotEmpty(pricebookEntry.Id), true);
            
            Test.stopTest();
        }
    }
    
    /**
     * 商談商品
     */
    @isTest static void createOpportunityLineItemTest() {
        
        System.runAs(testAdminUser) {
            
            Account account = CommonTester.createAccount(true);
            Opportunity opportunity = CommonTester.createOpportunity(account, true);
            Product2 product2 = CommonTester.createProduct2(true);
            Id pricebook2Id = Test.getStandardPricebookId();
            PricebookEntry pricebookEntry = CommonTester.createPricebookEntry(product2, pricebook2Id, true);
            
            Test.startTest();
            
            // Insertなし
            OpportunityLineItem opportunityLineItem = CommonTester.createOpportunityLineItem(opportunity, pricebookEntry, false);
            System.assertEquals(String.isEmpty(opportunityLineItem.Id), true);
            
            // Insertあり
            opportunityLineItem = CommonTester.createOpportunityLineItem(opportunity, pricebookEntry, true);
            System.assertEquals(String.isNotEmpty(opportunityLineItem.Id), true);
            
            Test.stopTest();
        }
    }
}