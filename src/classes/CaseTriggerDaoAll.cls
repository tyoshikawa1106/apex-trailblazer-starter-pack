public without sharing class CaseTriggerDaoAll {
    
    /**
     * 取引先に紐付くケースの件数を取得
     */
    public static List<Account> getCaseCntWithAccount(Set<Id> accountIds) {
        return [
            SELECT
                 Id
                ,(SELECT Id FROM Cases LIMIT 1000)
            FROM
                Account
            WHERE
                Id IN: accountIds
        ];
    }
}