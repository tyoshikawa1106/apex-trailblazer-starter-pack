public with sharing class OppLineItemListDao {

    /**
     * コンストラクタ
     */
    public OppLineItemListDao() {
        
    }

    /**
     * 商談情報取得
     */
    public Opportunity getOpportunity(String recordId) {
        List<Opportunity> opportunities = [
            SELECT
                 Id
                ,Name
            FROM
                Opportunity
            WHERE
                Id =: recordId
            LIMIT 1
        ];
        return opportunities.isEmpty() ? new Opportunity() : opportunities[0];
    }

    /**
     * 商談商品情報取得
     */
    public List<OpportunityLineItem> getOpportunityLineItemList(String opportunityId, String productName) {
        String query = '';
        query += ' SELECT ';
        query += '  Id ';
        query += ' ,Name ';
        query += ' ,Product2Id ';
        query += ' ,Product2.Name ';
        query += ' ,ServiceDate ';
        query += ' ,Quantity ';
        query += ' ,UnitPrice ';
        query += ' ,TotalPrice ';
        query += ' FROM ';
        query += ' OpportunityLineItem ';
        String joinString  = ' WHERE ';

        // 商談ID判定
        query += joinString + ' OpportunityId =: opportunityId ';
        joinString = ' AND ';

        // 商品判定
        if (String.isNotEmpty(productName)) {
            query += joinString + ' Product2.Name LIKE ' + CommonUtil.toQuery('%' + productName + '%');
            joinString = ' AND ';
        }

        query += ' ORDER BY Product2.Name ASC ';
        query += ' LIMIT 1000 ';

        return database.query(query);
    }

    /**
     * 更新用商談商品取得
     */
    public List<OpportunityLineItem> getEditOpportunityLineItemList(String opportunityId, List<String> opportunityLineItemIds) {
        return [
            SELECT
                 Id
                ,Name
                ,Product2.Name
                ,ServiceDate
                ,Quantity
                ,UnitPrice
                ,TotalPrice
            FROM
                OpportunityLineItem
            WHERE
                Id IN: opportunityLineItemIds
            AND
                OpportunityId =: opportunityId
            ORDER BY Product2.Name ASC
            LIMIT 1000
        ];
    }

    /**
     * 削除用商談商品取得
     */
    public List<OpportunityLineItem> getDeleteOpportunityLineItemList(String opportunityId, List<String> opportunityLineItemIds) {
        return [
            SELECT
                 Id
                ,Name
                ,Product2.Name
                ,ServiceDate
                ,Quantity
                ,UnitPrice
                ,TotalPrice
            FROM
                OpportunityLineItem
            WHERE
                Id IN: opportunityLineItemIds
            AND
                OpportunityId =: opportunityId
            ORDER BY Product2.Name ASC
            LIMIT 1000
        ];
    }
}