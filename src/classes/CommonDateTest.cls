/**
 * 共通日付/時間
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class CommonDateTest {

    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * クエリ用に変換
     */
    @isTest static void toQueryTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            String result = '';
            
            // 値あり
            result = CommonDate.toQuery(date.newInstance(2011, 11, 1));
            System.assertEquals(result, '2011-11-01');
            
            // 値なし
            result = CommonDate.toQuery(null);
            System.assertEquals(result, '');
            
            Test.stopTest();
        }
    }
    
    /**
     * 文字列日付を日付型に変換
     */
    @isTest static void toDateTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // 値あり
            Date result = CommonDate.toDate('2014/05/10');
            System.assertEquals(result, Date.newInstance(2014, 5, 10));
            
            // 値なし
            result = CommonDate.toDate('');
            System.assertEquals(result, null);
            
            Test.stopTest();
        }
    }
    
    /**
     * 対象文字列の日付判定
     */
    @isTest static void isDateTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // 値なし
            Boolean result = CommonDate.isDate('');
            System.assertEquals(result, true);
            
            // 日付
            result = CommonDate.isDate('2014/01/01');
            System.assertEquals(result, true);
            
            // 日付以外
            result = CommonDate.isDate('Hello!!');
            System.assertEquals(result, false);
            
            Test.stopTest();
        }
    }
    
    /**
     * 対象文字列の日付判定
     */
    @isTest static void isDateTestByErrorMessage() {
        
        System.runAs(testAdminUser) {
            
            String errorMessage = 'Error';
            
            Test.startTest();
            
            // 値なし
            String result = CommonDate.isDate('', errorMessage);
            System.assertEquals(String.isEmpty(result), true);
            
            // 日付
            result = CommonDate.isDate('2014/01/01', errorMessage);
            System.assertEquals(String.isEmpty(result), true);
            
            // 日付以外
            result = CommonDate.isDate('Hello!!', errorMessage);
            System.assertEquals(result, errorMessage);
            
            Test.stopTest();
        }
    }
    
    /**
     * 文字列日付を日付時間型に変換
     */
    @isTest static void toDateTimeFromTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // 値あり
            DateTime result = CommonDate.toDateTimeFrom('2014/05/10');
            System.assertEquals(result, DateTime.newInstance(2014, 5, 10, 0, 0, 0));
            
            // 値なし
            result = CommonDate.toDateTimeFrom('');
            System.assertEquals(result, null);
            
            Test.stopTest();
        }
    }
    
    /**
     * 文字列日付を日付時間型に変換
     */
    @isTest static void toDateTimeToTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // 値あり
            DateTime result = CommonDate.toDateTimeTo('2014/05/10');
            System.assertEquals(result, DateTime.newInstance(2014, 5, 10, 23, 59, 59));
            
            // 値なし
            result = CommonDate.toDateTimeTo('');
            System.assertEquals(result, null);
            
            Test.stopTest();
        }
    }
    
    /**
     * 休日判定処理
     */
    @isTest static void isHolidayTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            Boolean result = false;
            
            // 曜日判定(土曜日)
            result = CommonDate.isHoliday(date.newInstance(2011, 6, 25));
            System.assertEquals(result, true);
            
            // 曜日判定(日曜日)
            result = CommonDate.isHoliday(date.newInstance(2011, 6, 26));
            System.assertEquals(result, true);
            
            // 曜日判定(月曜日)
            result = CommonDate.isHoliday(date.newInstance(2011, 6, 27));
            System.assertEquals(result, false);
            
            Test.stopTest();
        }
    }
    
    /**
     * 月初日付取得
     */
    @isTest static void getMonthOfStartDayTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            Date result;
            
            // 2014年01月
            result = CommonDate.getMonthOfStartDay(date.newInstance(2014, 01, 20));
            System.assertEquals(result, date.newInstance(2014, 01, 01));
                
            // 2014年02月
            result = CommonDate.getMonthOfStartDay(date.newInstance(2014, 02, 20));
            System.assertEquals(result, date.newInstance(2014, 02, 01));
                
            // 2014年03月
            result = CommonDate.getMonthOfStartDay(date.newInstance(2014, 03, 20));
            System.assertEquals(result, date.newInstance(2014, 03, 01));
            
            // 2014年04月
            result = CommonDate.getMonthOfStartDay(date.newInstance(2014, 04, 20));
            System.assertEquals(result, date.newInstance(2014, 04, 01));
            
            // 2014年05月
            result = CommonDate.getMonthOfStartDay(date.newInstance(2014, 05, 20));
            System.assertEquals(result, date.newInstance(2014, 05, 01));
            
            // 2014年06月
            result = CommonDate.getMonthOfStartDay(date.newInstance(2014, 06, 20));
            System.assertEquals(result, date.newInstance(2014, 06, 01));
            
            // 2014年07月
            result = CommonDate.getMonthOfStartDay(date.newInstance(2014, 07, 20));
            System.assertEquals(result, date.newInstance(2014, 07, 01));
            
            // 2014年08月
            result = CommonDate.getMonthOfStartDay(date.newInstance(2014, 08, 20));
            System.assertEquals(result, date.newInstance(2014, 08, 01));
            
            // 2014年09月
            result = CommonDate.getMonthOfStartDay(date.newInstance(2014, 09, 20));
            System.assertEquals(result, date.newInstance(2014, 09, 01));
            
            // 2014年10月
            result = CommonDate.getMonthOfStartDay(date.newInstance(2014, 10, 20));
            System.assertEquals(result, date.newInstance(2014, 10, 01));
            
            // 2014年11月
            result = CommonDate.getMonthOfStartDay(date.newInstance(2014, 11, 20));
            System.assertEquals(result, date.newInstance(2014, 11, 01));
            
            // 2014年12月
            result = CommonDate.getMonthOfStartDay(date.newInstance(2014, 12, 20));
            System.assertEquals(result, date.newInstance(2014, 12, 01));
            
            // 値なし
            result = CommonDate.getMonthOfStartDay(null);
            System.assertEquals(result, null);
            
            Test.stopTest();
        }
    }
    
    /**
     * 月末日付取得
     */
    @isTest static void getMonthOfEndDayTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            Date result;
            
            // 2014年01月
            result = CommonDate.getMonthOfEndDay(date.newInstance(2014, 01, 10));
            System.assertEquals(result, date.newInstance(2014, 01, 31));
            
            // 2014年02月
            result = CommonDate.getMonthOfEndDay(date.newInstance(2014, 02, 10));
            System.assertEquals(result, date.newInstance(2014, 02, 28));
            
            // 2014年03月
            result = CommonDate.getMonthOfEndDay(date.newInstance(2014, 03, 10));
            System.assertEquals(result, date.newInstance(2014, 03, 31));
            
            // 2014年04月
            result = CommonDate.getMonthOfEndDay(date.newInstance(2014, 04, 10));
            System.assertEquals(result, date.newInstance(2014, 04, 30));
            
            // 2014年05月
            result = CommonDate.getMonthOfEndDay(date.newInstance(2014, 05, 10));
            System.assertEquals(result, date.newInstance(2014, 05, 31));
            
            // 2014年06月
            result = CommonDate.getMonthOfEndDay(date.newInstance(2014, 06, 10));
            System.assertEquals(result, date.newInstance(2014, 06, 30));
            
            // 2014年07月
            result = CommonDate.getMonthOfEndDay(date.newInstance(2014, 07, 10));
            System.assertEquals(result, date.newInstance(2014, 07, 31));
            
            // 2014年08月
            result = CommonDate.getMonthOfEndDay(date.newInstance(2014, 08, 10));
            System.assertEquals(result, date.newInstance(2014, 08, 31));
            
            // 2014年09月
            result = CommonDate.getMonthOfEndDay(date.newInstance(2014, 09, 10));
            System.assertEquals(result, date.newInstance(2014, 09, 30));
            
            // 2014年10月
            result = CommonDate.getMonthOfEndDay(date.newInstance(2014, 10, 10));
            System.assertEquals(result, date.newInstance(2014, 10, 31));
            
            // 2014年11月
            result = CommonDate.getMonthOfEndDay(date.newInstance(2014, 11, 10));
            System.assertEquals(result, date.newInstance(2014, 11, 30));
            
            // 2014年12月
            result = CommonDate.getMonthOfEndDay(date.newInstance(2014, 12, 10));
            System.assertEquals(result, date.newInstance(2014, 12, 31));
            
            // 値なし
            result = CommonDate.getMonthOfEndDay(null);
            System.assertEquals(result, null);
            
            Test.stopTest();
        }
    }
    
    /**
     * 曜日を取得
     */
    @isTest static void getDayOfTheWeekTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // 曜日を取得
            String result = '';
            // 月曜日
            result = CommonDate.getDayOfTheWeek(date.newInstance(2011, 10, 31));
            System.assertEquals(result, '月');
            // 火曜日
            result = CommonDate.getDayOfTheWeek(date.newInstance(2011, 11, 1));
            System.assertEquals(result, '火');
            // 水曜日
            result = CommonDate.getDayOfTheWeek(date.newInstance(2011, 11, 2));
            System.assertEquals(result, '水');
            // 木曜日
            result = CommonDate.getDayOfTheWeek(date.newInstance(2011, 11, 3));
            System.assertEquals(result, '木');
            // 金曜日
            result = CommonDate.getDayOfTheWeek(date.newInstance(2011, 11, 4));
            System.assertEquals(result, '金');
            // 土曜日
            result = CommonDate.getDayOfTheWeek(date.newInstance(2011, 11, 5));
            System.assertEquals(result, '土');
            // 日曜日
            result = CommonDate.getDayOfTheWeek(date.newInstance(2011, 11, 6));
            System.assertEquals(result, '日');
            
            // NULL
            result = CommonDate.getDayOfTheWeek(null);
            System.assertEquals(result, '');
            
            Test.stopTest();
        }
    }
    
    /**
     * 有効時間判定
     */
    @isTest static void isActiveTimeTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // 開始時間
            Time startTime = Time.newInstance(9, 0, 0, 0);
            System.assertEquals('09:00:00.000Z', String.valueOf(startTime));
            // 終了時間
            Time endTime = Time.newInstance(18, 0, 0, 0);
            System.assertEquals('18:00:00.000Z', String.valueOf(endTime));
            
            // 現在時間
            Time nowTime = null;
            System.assertEquals(nowTime, null);
            
            Boolean result = false;
            
            // 開始時間前
            nowTime = startTime.addSeconds(-1);
            System.assertEquals('08:59:59.000Z', String.valueOf(nowTime));
            result = CommonDate.isActiveTime(nowTime, startTime, endTime);
            System.assertEquals(result, false);
            
            // 開始時間と一致
            nowTime = startTime;
            System.assertEquals('09:00:00.000Z', String.valueOf(nowTime));
            result = CommonDate.isActiveTime(nowTime, startTime, endTime);
            System.assertEquals(result, true);
            
            // 開始時間後
            nowTime = startTime.addSeconds(1);
            System.assertEquals('09:00:01.000Z', String.valueOf(nowTime));
            result = CommonDate.isActiveTime(nowTime, startTime, endTime);
            System.assertEquals(result, true);
            
            // 終了時間前
            nowTime = endTime.addSeconds(-1);
            System.assertEquals('17:59:59.000Z', String.valueOf(nowTime));
            result = CommonDate.isActiveTime(nowTime, startTime, endTime);
            System.assertEquals(result, true);
            
            // 終了時間と一致
            nowTime = endTime;
            System.assertEquals('18:00:00.000Z', String.valueOf(nowTime));
            result = CommonDate.isActiveTime(nowTime, startTime, endTime);
            System.assertEquals(result, true);
            
            // 終了時間後
            nowTime = endTime.addSeconds(1);
            System.assertEquals('18:00:01.000Z', String.valueOf(nowTime));
            result = CommonDate.isActiveTime(nowTime, startTime, endTime);
            System.assertEquals(result, false);
            
            Test.stopTest();
        }
    }
    
    /**
     * 有効時間判定
     */
    @isTest static void toStringTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            Time result = null;
            
            // 値あり(1桁)
            result = Time.newInstance(0, 0, 0, 0);
            System.assertEquals('00:00:00.000Z', String.valueOf(result));
            System.assertEquals('00:00:00', CommonDate.toString(result));
            
            // 値あり(2桁)
            result = Time.newInstance(23, 59, 59, 0);
            System.assertEquals('23:59:59.000Z', String.valueOf(result));
            System.assertEquals('23:59:59', CommonDate.toString(result));
            
            // 値なし
            result = null;
            System.assertEquals(null, result);
            
            Test.stopTest();
        }
    }
    
    /**
     * 日付を文字列に変換する
     */
    @isTest static void toFormatTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // 値あり
            String result = CommonDate.toFormat(date.newInstance(2011, 10, 20), 'yyyyMMdd');
            System.assertEquals(result, '20111020');
            
            // 値なし
            result = CommonDate.toFormat(null, 'yyyyMMdd');
            System.assertEquals(result, '');
            
            Test.stopTest();
        }
    }
    
    /**
     * 日付文字列を日付型に変換
     */
    @isTest static void toParseDateTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // ハイフン区切り
            Date result = CommonDate.toParseDate('2011-10-20');
            System.assertEquals(result, date.valueOf('2011-10-20'));
            
            // スラッシュ区切り
            result = CommonDate.toParseDate('2011/10/20');
            System.assertEquals(result, date.valueOf('2011-10-20'));
            
            // 値なし
            result = CommonDate.toParseDate('');
            System.assertEquals(result, null);
            
            Test.stopTest();
        }
    }
    
    /**
     * 文字列を日付型に変換
     */
    @isTest static void toParseDateTest2() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // 値あり
            Date result = CommonDate.toParseDate('2010','10','05');
            System.assertEquals(result, date.valueOf('2010-10-05'));
            
            // 値なし
            result = CommonDate.toParseDate('2010','','');
            System.assertEquals(result, null);
            
            result = CommonDate.toParseDate('','10','');
            System.assertEquals(result, null);
            
            result = CommonDate.toParseDate('','','05');
            System.assertEquals(result, null);
            
            result = CommonDate.toParseDate('','','');
            System.assertEquals(result, null);
            
            Test.stopTest();
        }
    }
    
    /**
     * 文字列を日付型に変換
     */
    @isTest static void toParseDateTest3() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // 値あり
            Date result = CommonDate.toParseDate(2010, 10, 5);
            System.assertEquals(result, date.valueOf('2010-10-05'));
            
            Test.stopTest();
        }
    }
    
    /**
     * 日付を日付時間型に変換
     */
    @isTest static void toParseDateTimeTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            Date day = date.newInstance(2011, 11, 1);
            
            // 値あり
            DateTime result = CommonDate.toParseDateTime(day, '10', '20', '30');
            System.assertEquals(result, datetime.newInstance(2011, 11, 1, 10, 20, 30));
            
            // 値なし
            result = CommonDate.toParseDateTime(null, '10', '20', '30');
            System.assertEquals(result, null);
            
            Test.stopTest();
        }
    }
    
    /**
     * 日付を日付時間型に変換
     */
    @isTest static void toParseDateTimeTest2() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // 値あり
            DateTime result = CommonDate.toParseDateTime(2011, 11, 1, 10, 20, 30);
            System.assertEquals(result, datetime.newInstance(2011, 11, 1, 10, 20, 30));
            
            Test.stopTest();
        }
    }
    
    /**
     * 日付を日付時間型に変換
     */
    @isTest static void toParseDateTimeTest3() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // 値あり
            DateTime result = CommonDate.toParseDateTime(2011, 11, 1);
            System.assertEquals(result, datetime.newInstance(2011, 11, 1, 0, 0, 0));
            
            Test.stopTest();
        }
    }
    
    /**
     * 年月日形式に変換
     */
    @isTest static void toParseJapanDateFormatTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // 値なし
            String result = CommonDate.toParseJapanDateFormat(null);
            System.assertEquals(String.isEmpty(result), true);
            // 値あり
            result = CommonDate.toParseJapanDateFormat(date.valueOf('2011-10-20'));
            System.assertEquals(result, '2011年10月20日');
            
            Test.stopTest();
        }
    }
    
    /**
     * 年月形式に変換
     */
    @isTest static void toParseJapanDateFormatByMonthsAndYearsTest() {
        
        System.runAs(testAdminUser) {
            
            Test.startTest();
            
            // 値なし
            String result = CommonDate.toParseJapanDateFormatByMonthsAndYears(null);
            System.assertEquals(String.isEmpty(result), true);
            // 値あり
            result = CommonDate.toParseJapanDateFormatByMonthsAndYears(date.valueOf('2011-10-20'));
            System.assertEquals(result, '2011年10月');
            
            Test.stopTest();
        }
    }
    
    /**
     * 文字列日付を日付時間型に変換
     */
    @isTest static void isSearchDateTest() {
        
        System.runAs(testAdminUser) {
            
            Test.startTest();
            
            // FROM = NULL && TO = NULL
            Date dateFrom = null;
            Date dateTo = null;
            String errorMessage = '日付が不正です。';
            String result = CommonDate.isSearchDate(dateFrom, dateTo, errorMessage);
            System.assertEquals(String.isEmpty(result), true);
            
            // FROM != NULL && TO = NULL
            dateFrom = date.newInstance(2014, 5, 5);
            dateTo = null;
            result = CommonDate.isSearchDate(dateFrom, dateTo, errorMessage);
            System.assertEquals(String.isEmpty(result), true);
            
            // FROM = NULL && TO != NULL
            dateFrom = null;
            dateTo = date.newInstance(2014, 5, 5);
            result = CommonDate.isSearchDate(dateFrom, dateTo, errorMessage);
            System.assertEquals(String.isEmpty(result), true);
            
            // From < To
            dateFrom = date.newInstance(2014, 5, 5);
            dateTo = date.newInstance(2014, 5, 6);
            result = CommonDate.isSearchDate(dateFrom, dateTo, errorMessage);
            System.assertEquals(String.isEmpty(result), true);
            
            // From = To
            dateFrom = date.newInstance(2014, 5, 5);
            dateTo = date.newInstance(2014, 5, 5);
            result = CommonDate.isSearchDate(dateFrom, dateTo, errorMessage);
            System.assertEquals(String.isEmpty(result), true);
            
            // From > To
            dateFrom = date.newInstance(2014, 5, 6);
            dateTo = date.newInstance(2014, 5, 5);
            result = CommonDate.isSearchDate(dateFrom, dateTo, errorMessage);
            System.assertEquals(result, errorMessage);
            
            Test.stopTest();
        }
    }
}