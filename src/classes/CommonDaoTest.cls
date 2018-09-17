@isTest
private class CommonDaoTest {

    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * ユーザ取得
     */
    @isTest static void getUserTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            // ログインユーザ取得
            User user = CommonDao.getUser();
            System.assertEquals(user.Id, UserInfo.getUserId());
            
            // ユーザ取得(1件)
            user = CommonDao.getUser(UserInfo.getUserId(), true);
            System.assertEquals(user.Id, UserInfo.getUserId());
            
            // ユーザ取得(0件)
            user = CommonDao.getUser(null, true);
            System.assertEquals(user, new User());
            
            Test.stopTest();
        }
    }
    
    /**
     * プロファイル取得
     */
    @isTest static void getProfileTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            Profile profile = CommonDao.getProfile('');
            System.assertEquals(String.isEmpty(profile.Id), true);
            
            Test.stopTest();
        }
    }
    
    /**
     * レポート取得
     */
    @isTest static void getReportTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            Report report = CommonDao.getReport('');
            System.assertEquals(String.isEmpty(report.Id), true);
            
            Test.stopTest();
        }
    }
    
    /**
     * レコードタイプ取得
     */
    @isTest static void getRecordTypeTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            RecordType recordType = CommonDao.getRecordType('', '');
            System.assertEquals(String.isEmpty(recordType.Id), true);
            
            Test.stopTest();
        }
    }

    /**
     * レコードタイプ取得
     */
    @isTest static void getRecordTypesTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            String prmSObjectType = '';
            List<RecordType> recordTypes = CommonDao.getRecordTypes(prmSObjectType);
            System.assertEquals(recordTypes.isEmpty(), true);

            prmSObjectType = 'Account';
            recordTypes = CommonDao.getRecordTypes(prmSObjectType);
            System.assertEquals(recordTypes.isEmpty(), false);
            
            Test.stopTest();
        }
    }
    
    /**
     * グループ取得
     */
    @isTest static void getGroupTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            Group grp = CommonDao.getGroup('');
            System.assertEquals(String.isEmpty(grp.Id), true);
            
            Test.stopTest();
        }
    }
    
    /**
     * 組織アドレス取得
     */
    @isTest static void getOrgWideEmailAddressTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            OrgWideEmailAddress orgWideEmailAddress = CommonDao.getOrgWideEmailAddress('');
            System.assertEquals(String.isEmpty(orgWideEmailAddress.Id), true);
            
            Test.stopTest();
        }
    }
    
    /**
     * フォルダ取得
     */
    @isTest static void getFolderTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            Folder folder = CommonDao.getFolder('', '');
            System.assertEquals(String.isEmpty(folder.Id), true);
            
            Test.stopTest();
        }
    }

    /**
     * 標準価格表情報取得
     */
    @isTest static void getStandardPricebook2Test1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            Pricebook2 result = CommonDao.getStandardPricebook2();
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.Id), true);
        }
    }
}