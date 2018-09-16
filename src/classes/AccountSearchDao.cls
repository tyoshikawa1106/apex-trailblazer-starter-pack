public with sharing class AccountSearchDao {

    /**
     * コンストラクタ
     */
    public AccountSearchDao() {
        
    }

    /**
     * 取引先検索
     */
    public List<Account> getAccounts(String accountName, String accountBillingState) {
        String query = '';
        query += ' SELECT ';
        query += '  Id ';
        query += ' ,Name ';
        query += ' ,BillingState ';
        query += ' ,BillingCity ';
        query += ' ,BillingStreet ';
        query += ' ,Website ';
        query += ' ,OwnerId ';
        query += ' ,Owner.Name ';
        query += ' FROM ';
        query += ' Account ';
        String joinString  = ' WHERE ';

        // 取引先名判定
        if (String.isNotEmpty(accountName)) {
            query += joinString + ' Name LIKE ' + CommonUtil.toQuery('%' + accountName + '%');
            joinString = ' AND ';
        }
        
        // 都道府県判定
        if (String.isNotEmpty(accountBillingState)) {
            query += joinString + ' BillingState LIKE ' + CommonUtil.toQuery('%' + accountBillingState + '%');
            joinString = ' AND ';
        }
        
        query += ' LIMIT 50000 ';

        return database.query(query);
    }
}