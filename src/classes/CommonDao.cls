public with sharing class CommonDao {
    
    /**
     * ログインユーザ取得
     */
    public static User getUser() {
        return [
            SELECT
                 Id
                ,Name
                ,LanguageLocaleKey
                ,LocaleSidKey
            FROM
                User
            WHERE
                Id =: UserInfo.getUserId()
            LIMIT 1
        ];
    }
    
    /**
     * ユーザ取得
     */
    public static User getUser(Id prmUserId, Boolean IsActive) {
        List<User> users = [
            SELECT
                 Id
                ,Name
            FROM
                User
            WHERE
                Id =: prmUserId
            AND
                IsActive =: IsActive
            LIMIT 1
        ];
        
        return users.isEmpty() ? new User() : users[0];
    }
    
    /**
     * プロファイル取得
     */
    public static Profile getProfile(String prmProfileName) {
        List<Profile> profiles = [
            SELECT
                 Id
                ,Name
            FROM
                Profile
            WHERE
                Name =: prmProfileName
            LIMIT 1
        ];
        
        return profiles.isEmpty() ? new Profile() : profiles[0];
    }
    
    /**
     * レポート取得
     */
    public static Report getReport(String prmDeveloperName) {
        List<Report> reports = [
            SELECT
                 Id
                ,Name
                ,DeveloperName
            FROM
                Report
            WHERE
                DeveloperName =: prmDeveloperName
            LIMIT 1
        ];
        
        return reports.isEmpty() ? new Report() : reports[0];
    }
    
    /**
     * レコードタイプ取得
     */
    public static RecordType getRecordType(String prmSObjectType, String prmDeveloperName) {
        List<RecordType> recordTypes = [
            SELECT
                 Id
                ,Name
                ,DeveloperName
            FROM
                RecordType
            WHERE
                SobjectType =: prmSObjectType
            AND
                DeveloperName =: prmDeveloperName
            LIMIT 1
        ];
        
        return recordTypes.isEmpty() ? new RecordType() : recordTypes[0];
    }

    /**
     * レコードタイプ情報取得
     */
    public static List<RecordType> getRecordTypes(String prmSObjectType) {
        return [
            SELECT
                 Id
                ,Name
                ,DeveloperName
            FROM
                RecordType
            WHERE
                SobjectType =: prmSObjectType
            LIMIT 200
        ];
    }
    
    /**
     * グループ情報取得
     */
    public static Group getGroup(String prmGroupName) {
        List<Group> groups = [
            SELECT
                 Id
                ,Name
            FROM
                Group
            WHERE
                Name =: prmGroupName
            LIMIT 1
        ];
        
        return groups.isEmpty() ? new Group() : groups[0];
    }
    
    /**
     * 組織のアドレス取得
     */
    public static OrgWideEmailAddress getOrgWideEmailAddress(String prmDisplayName) {
        List<OrgWideEmailAddress> orgWideEmailAddresses = [
            SELECT
                 Id
            FROM
                OrgWideEmailAddress
            WHERE
                DisplayName =: prmDisplayName
            LIMIT 1
        ];
        
        return orgWideEmailAddresses.isEmpty() ? new OrgWideEmailAddress() : orgWideEmailAddresses[0];
    }
    
    /**
     * フォルダ取得
     */
    public static Folder getFolder(String docType, String developerName) {
        List<Folder> folders = [
            SELECT
                 Id
                ,Name
                ,DeveloperName
                ,Type
            FROM
                Folder
            WHERE
                Type =: docType
            AND
                DeveloperName =: developerName
            LIMIT 1
        ];

        return folders.isEmpty() ? new Folder() : folders[0];
    }

    /**
     * 標準価格表情報取得
     */
    public static Pricebook2 getStandardPricebook2() {
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
}