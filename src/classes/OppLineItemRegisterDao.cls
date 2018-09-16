public with sharing class OppLineItemRegisterDao {

    /**
     * コンストラクタ
     */
    public OppLineItemRegisterDao() {
        
    }

    /**
     * 商談情報取得
     */
    public Opportunity getOpportunity(String recordId) {
        List<Opportunity> opportunities = [
            SELECT
                 Id
                ,Name
                ,CloseDate
            FROM
                Opportunity
            WHERE
                Id =: recordId
            LIMIT 1
        ];
        return opportunities.isEmpty() ? new Opportunity() : opportunities[0];
    }

    /**
     * 標準価格表情報取得
     */
    public Pricebook2 getPricebook2() {
        List<Pricebook2> pricebook2List = [
            SELECT
                 Id
                ,Name
                ,IsStandard
                ,IsActive
            FROM
                Pricebook2
            WHERE
                IsStandard = true
            AND
                IsActive = true
            LIMIT 1
        ];
        return pricebook2List.isEmpty() ? new Pricebook2() : pricebook2List[0];
    }

    /**
     * 価格表エントリ取得
     */
    public List<PricebookEntry> getPricebookEntryList(Id pricebook2Id, List<Product2> product2List) {
        return [
            SELECT
                 Id
                ,Name
                ,UnitPrice
                ,Product2Id
            FROM
                PricebookEntry
            WHERE
                Pricebook2Id =: pricebook2Id
            AND
                Product2Id IN: product2List
            ORDER BY Name ASC
            LIMIT 1000
        ];
    }

    /**
     * 商品情報取得
     */
    public List<Product2> getProduct2List(String productName, String productCode, String productFamily) {
        String query = '';
        query += ' SELECT ';
        query += ' Id ';
        query += ' ,Name ';
        query += ' ,ProductCode ';
        query += ' ,Description ';
        query += ' ,toLabel(Family) ';
        query += ' FROM ';
        query += ' Product2 ';
        String joinString  = ' WHERE ';

        // 商品名判定
        if (String.isNotEmpty(productName)) {
            query += joinString + ' Name LIKE ' + CommonUtil.toQuery('%' + productName + '%');
            joinString = ' AND ';
        }

        // 商品コード判定
        if (String.isNotEmpty(productCode)) {
            query += joinString + ' ProductCode LIKE ' + CommonUtil.toQuery(productCode + '%');
            joinString = ' AND ';
        }

        // 商品ファミリ判定
        if (String.isNotEmpty(productFamily)) {
            query += joinString + ' Family = ' + CommonUtil.toQuery(productFamily);
            joinString = ' AND ';
        }

        query += joinString + ' IsActive = true ';
        query += ' ORDER BY Name ASC ';
        query += ' LIMIT 1000 ';

        return database.query(query);
    }

    /**
     * 商品IDに紐付く商品情報を取得
     */
    public List<Product2> getProduct2ListByIds(List<String> productIds) {
        return [
            SELECT
                 Id
                ,Name
                ,toLabel(Family)
            FROM
                Product2
            WHERE
                Id IN: productIds
            ORDER BY Name ASC
            LIMIT 1000
        ];
    }
}