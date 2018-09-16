public with sharing class CommonTester {
    
    /**
     * テスト実行ユーザ取得
     */
    public static User getLoginUser() {
        return new User(Id = UserInfo.getUserId());
    }

    /**
     * テスト実行ページ取得
     */
    public static PageReference getPageReference() {
        return new PageReference('PageReference');
    }

    /**
     * 取引先
     */
    public static Account createAccount(Boolean isInsert) {
        
        Account account = new Account(       
             Name = '株式会社サンプル'
            ,BillingState = '東京都'
        );
        
        if (isInsert) {
            insert account;
        }
        
        return account;
    }

    /**
     * 取引先責任者
     */
    public static Contact createContact(Account account, Boolean isInsert) {
        
        Contact contact = new Contact(
             AccountId = account.Id
            ,LastName = 'LastName'
            ,FirstName = 'FirstName'
        );
        
        if (isInsert) {
            insert contact;
        }
        
        return contact;
    }

    /**
     * 商談
     */
    public static Opportunity createOpportunity(Account account, Boolean isInsert) {
        
        Opportunity opportunity = new Opportunity(
             AccountId = account.Id
            ,Name = 'Name'
            ,CloseDate = date.newInstance(2011, 10, 5)
            ,StageName = '提案'
        );
        
        if (isInsert) {
            insert opportunity;
        }
        
        return opportunity;
    }
    
    /**
     * 商談に紐付く取引先責任者の役割
     */
    public static OpportunityContactRole createOpportunityContactRole(Opportunity opportunity, Contact contact, Boolean isInsert) {
        
        OpportunityContactRole opportunityContactRole = new OpportunityContactRole(       
             IsPrimary = true
            ,OpportunityId = opportunity.Id
            ,ContactId = contact.Id
        );
        
        if (isInsert) {
            insert opportunityContactRole;
        }
        
        return opportunityContactRole;
    }
    
    /**
     * 商品
     */
    public static Product2 createProduct2(Boolean isInsert) {
        
        Product2 product2 = new Product2(
             Name = 'サンプル'
            ,IsActive = true
            ,ProductCode = '0000'
            ,Family = 'SLA'
        );
        
        if (isInsert) {
            insert product2;
        }
        
        return product2;
    }
    
    /**
     * 価格表エントリ
     */
    public static PricebookEntry createPricebookEntry(Product2 prmProduct2Id, Id prmPricebook2Id, Boolean isInsert) {
        
        PricebookEntry pricebookEntry = new PricebookEntry(
             IsActive = true
            ,Pricebook2Id = prmPricebook2Id
            ,Product2Id = prmProduct2Id.Id
            ,UnitPrice = 0.00
            ,UseStandardPrice = false
        );
        
        if (isInsert) {
            insert pricebookEntry;
        }
        
        return pricebookEntry;
    }
    
    /**
     * 商談商品
     */
    public static OpportunityLineItem createOpportunityLineItem(Opportunity prmOpportunity, PricebookEntry prmPricebookEntry, Boolean isInsert) {
        
        OpportunityLineItem opportunityLineItem = new OpportunityLineItem( 
             OpportunityId = prmOpportunity.Id
            ,UnitPrice = 10000
            ,Quantity = 10
            ,PricebookEntryId = prmPricebookEntry.Id
        );
        
        if (isInsert) {
            insert opportunityLineItem;
        }
        
        return opportunityLineItem;
    }
}