@isTest
private class CommonUtilTest {

    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * URLパラメータ取得
     */
    @isTest static void getParametersTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            String result = '';
            
            // パラメータなし
            result = CommonUtil.getParameters(CommonConst.PARAM_ID);
            System.assertEquals(result, '');
            
            // パラメータあり
            PageReference pageRef = CommonTester.getPageReference();
            pageRef.getParameters().put(CommonConst.PARAM_ID, String.valueOf(UserInfo.getUserId()));
            
            Test.setCurrentPage(pageRef);
            
            result = CommonUtil.getParameters(CommonConst.PARAM_ID);
            System.assertEquals(result, String.valueOf(UserInfo.getUserId()));
            
            Test.stopTest();
        }
    }
    
    /**
     * Exceptionメッセージを取得
     */
    @isTest static void toExceptionTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();

            try {
                // Exceptionエラー発生
                Id checkId = 'Exception';     
            } catch(Exception e) {
                CommonUtil.getExceptionMsg(e, 'Error');
            }

            Test.stopTest();
        }
    }
    
    /**
     * SingleQuote追加
     */
    @isTest static void toQueryTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();

            String check;
            String result;
            
            // 値なし
            check = '';
            result = CommonUtil.toQuery(check);
            System.assertEquals(result, '\'' + '\'');
            
            //　値あり
            check = 'XXX';
            result = CommonUtil.toQuery(check);
            System.assertEquals(result, '\'' + 'XXX' + '\'');

            Test.stopTest();
        }
    }
    
    /**
     * バッチ処理起動可能か否かを判定
     */
    @isTest static void isBatchExecuteTest() {

        System.runAs(testAdminUser) {

            Test.startTest();

            Boolean result = CommonUtil.isBatchExecute();
            System.assertEquals(result, true);

            Test.stopTest();
        }
    }
    
    /**
     * パディング(0埋め)
     */
    @isTest static void toPaddingTest() {

        System.runAs(testAdminUser) {

            Test.startTest();

            String result = '';
            
            // 桁数1から開始
            result = CommonUtil.toPadding(1, 5);
            System.assertEquals(result, '00001');
            
            // 桁数3から開始
            result = CommonUtil.toPadding(123, 5);
            System.assertEquals(result, '00123');
            
            // 桁数5から開始
            result = CommonUtil.toPadding(12345, 5);
            System.assertEquals(result, '12345');

            Test.stopTest();
        }
    }
    
    /**
     * 先頭と末尾の文字を除去
     */
    @isTest static void toStripTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();

            String resultValue;
            
            // 文字数：0
            resultValue = CommonUtil.toStrip('');
            System.assertEquals(resultValue, '');
            // 文字数：1
            resultValue = CommonUtil.toStrip('A');
            System.assertEquals(resultValue, '');
            // 文字数：2
            resultValue = CommonUtil.toStrip('AA');
            System.assertEquals(resultValue, '');
            // 文字数：3
            resultValue = CommonUtil.toStrip('AAA');
            System.assertEquals(resultValue, 'A' + ' ');

            Test.stopTest();
        }
    }
    
    /**
     * 指定文字数以降を切り捨て
     */
    @isTest static void toSubStringTest() {

        System.runAs(testAdminUser) {

            Test.startTest();

            String result = '';
            
            // 空文字
            result = CommonUtil.toSubString('', 5);
            System.assertEquals(String.isEmpty(result), true);
            
            // 指定文字数以下
            result = CommonUtil.toSubString('ABCD', 5);
            System.assertEquals(result, 'ABCD');
            
            // 指定文字数と一致
            result = CommonUtil.toSubString('ABCDE', 5);
            System.assertEquals(result, 'ABCDE');
            
            // 指定文字数より大きい
            result = CommonUtil.toSubString('ABCDEF', 5);
            System.assertEquals(result, 'ABCDE');

            Test.stopTest();
        }
    }
    
    /**
     * 特定の文字数ごとに文字を挿入する
     */
    @isTest static void toInsertTest() {

        System.runAs(testAdminUser) {

            Test.startTest();

            String result;
            
            // 1文字毎に改行
            result = CommonUtil.toInsert('ABCDE', 1, '\n');
            System.assertEquals(result, 'A' + '\n' + 'B' + '\n' + 'C' + '\n' + 'D' + '\n' + 'E');
            
            // 2文字毎に改行
            result = CommonUtil.toInsert('ABCDE', 2, '\n');
            System.assertEquals(result, 'AB' + '\n' + 'CD' + '\n' + 'E');
            
            // 5文字毎に改行
            result = CommonUtil.toInsert('ABCDE', 5, '\n');
            System.assertEquals(result, 'ABCDE');
            
            // 値なし
            result = CommonUtil.toInsert('', 1, '\n');
            System.assertEquals(result, '');

            Test.stopTest();
        }
    }
    
    /**
     * 特定の文字数ごとに文字を挿入する
     */
    @isTest static void toInsertTestByLimitLengh() {

        System.runAs(testAdminUser) {

            Test.startTest();

            String result;
            
            // 1文字毎に改行
            result = CommonUtil.toInsert('ABCDE', 1, '\n', 3);
            System.assertEquals(result, 'A' + '\n' + 'B' + '\n' + 'C');
            
            // 2文字毎に改行
            result = CommonUtil.toInsert('ABCDE', 2, '\n', 3);
            System.assertEquals(result, 'AB' + '\n' + 'C');
            
            // 5文字毎に改行
            result = CommonUtil.toInsert('ABCDE', 5, '\n', 3);
            System.assertEquals(result, 'ABC');
            
            // 値なし
            result = CommonUtil.toInsert('', 1, '\n', 3);
            System.assertEquals(result, '');

            Test.stopTest();
        }
    }
    
    /**
     * 先頭の'0'を除外
     */
    @isTest static void toZeroTrimTest() {
        
        System.runAs(testAdminUser) {
        
            Test.startTest();
            
            // 値なし
            String target = '';
            String result = CommonUtil.toZeroTrim(target);
            System.assertEquals(String.isEmpty(result), true);
            
            // 先頭0なし
            target = '1230';
            result = CommonUtil.toZeroTrim(target);
            System.assertEquals(result, '1230');
            
            // 先頭0あり(1文字)
            target = '01230';
            result = CommonUtil.toZeroTrim(target);
            System.assertEquals(result, '1230');
            
            // 先頭0あり(3文字)
            target = '0001230';
            result = CommonUtil.toZeroTrim(target);
            System.assertEquals(result, '1230');
            
            // 対象外
            target = 'abc';
            result = CommonUtil.toZeroTrim(target);
            System.assertEquals(String.isEmpty(result), true);
            
            Test.stopTest();
        }
    }

    /**
     * 全角半角スペースを指定文字列に置換
     */
    @isTest static void toSpaceReplaceTest() {
        
        System.runAs(testAdminUser) {
        
            Test.startTest();
            
            // 値なし
            String target = '';
            String result = CommonUtil.toSpaceReplace(target, ',');
            System.assertEquals(String.isEmpty(result), true);
            
            // 半角スペースあり
            target = 'A B';
            result = CommonUtil.toSpaceReplace(target, ',');
            System.assertEquals(result, 'A,B');
            
            // 全角スペースあり
            target = 'A　B';
            result = CommonUtil.toSpaceReplace(target, ',');
            System.assertEquals(result, 'A,B');
            
            // 半角&全角スペースあり
            target = '　 A 　B 　';
            result = CommonUtil.toSpaceReplace(target, ',');
            System.assertEquals(result, ',,A,,B,,');

            // スペースなし
            target = 'AB';
            result = CommonUtil.toSpaceReplace(target, ',');
            System.assertEquals(result, 'AB');
            
            Test.stopTest();
        }
    }
    
    /**
     * StringをSetに変換
     */
    @isTest static void parseToSetTest1() {

        System.runAs(testAdminUser) {

            String keywarod = '';
            String splitKey = '';

            Test.startTest();

            Set<String> results = CommonUtil.parseToSet(keywarod, splitKey);

            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * StringをSetに変換
     */
    @isTest static void parseToSetTest2() {

        System.runAs(testAdminUser) {

            String keywarod = 'Hello';
            String splitKey = '';

            Test.startTest();

            Set<String> results = CommonUtil.parseToSet(keywarod, splitKey);

            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * StringをSetに変換
     */
    @isTest static void parseToSetTest3() {

        System.runAs(testAdminUser) {

            String keywarod = '';
            String splitKey = ',';

            Test.startTest();

            Set<String> results = CommonUtil.parseToSet(keywarod, splitKey);

            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * StringをSetに変換
     */
    @isTest static void parseToSetTest4() {

        System.runAs(testAdminUser) {

            String keywarod = 'Hello';
            String splitKey = ',';

            Test.startTest();

            Set<String> results = CommonUtil.parseToSet(keywarod, splitKey);

            Test.stopTest();

            System.assertEquals(results.size(), 1);
        }
    }

    /**
     * StringをSetに変換
     */
    @isTest static void parseToSetTest5() {
        
        System.runAs(testAdminUser) {

            String keywarod = 'Hello,World';
            String splitKey = ',';

            Test.startTest();

            Set<String> results = CommonUtil.parseToSet(keywarod, splitKey);

            Test.stopTest();

            System.assertEquals(results.size(), 2);
            System.assertEquals(results.contains('Hello'), true);
            System.assertEquals(results.contains('World'), true);
        }
    }
    
    /**
     * リストをString型に変換 (複数選択リスト変換用)
     */
    @isTest static void parseMultiSelectToStringTest1() {
        
        System.runAs(testAdminUser) {
            
            Test.startTest();
            
            // 値なし
            List<String> selections = new List<String>();
            String result = CommonUtil.parseMultiSelectToString(selections);
            System.assertEquals(String.isEmpty(result), true);
            
            // 値あり
            selections = new List<String>{'value1, value2, value3'};
            result = CommonUtil.parseMultiSelectToString(selections);
            System.assertEquals(String.isNotEmpty(result), true);
            System.assertEquals(result, 'value1; value2; value3');
            
            Test.stopTest();
        }
    }

    /**
     * 価格表ID取得
     */
    @isTest static void getPriceBook2IdTest() {
        
        System.runAs(testAdminUser) {

            Pricebook2 pricebook2 = new Pricebook2();

            Test.startTest();
            
            Id pricebook2Id = CommonUtil.getPriceBook2Id(pricebook2);
            System.assertEquals(pricebook2Id, Test.getStandardPricebookId());
            
            Test.stopTest();
        }
    }
}