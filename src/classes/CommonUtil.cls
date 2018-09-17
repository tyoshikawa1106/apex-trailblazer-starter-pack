public with sharing class CommonUtil {
    
    /**
     * URLパラメータ取得
     */
    public static String getParameters(String prmValue) {
        
        String parameter = System.currentPageReference().getParameters().get(prmValue);
        
        if (String.isEmpty(parameter)) {
            return '';
        }
        return parameter;
    }
    
    /**
     * Exceptionメッセージを取得
     */
    public static String getExceptionMsg(Exception e, String prmMsg) {
        return prmMsg + '\n' + 'Message: ' +  + e.getMessage() + '\n' + 'Line: ' + String.valueOf(e.getLineNumber());
    }
    
    /**
     * SingleQuote追加
     */
    public static String toQuery(String prmValue) {
        
        if(String.isEmpty(prmValue)) {
            // 値なし
            return '\'' + '\'';
        }
        // 値あり
        return '\'' + String.escapeSingleQuotes(prmValue) + '\'';
    }
    
    /**
     * バッチ処理起動可能か否かを判定
     */
    public static Boolean isBatchExecute() {
        Integer jobCnt = [SELECT COUNT() FROM AsyncApexJob WHERE Status NOT IN('Aborted', 'Completed', 'Failed')];
        return (jobCnt < 5);
    }
    
    /**
     * パディング(0埋め)
     */
    public static String toPadding(Integer prmValue, Integer prmDigit) {
        
        String padding = String.valueof(prmValue);
        for(Integer i = padding.length(); i < prmDigit ; i++) {
            padding = '0' + padding;
        }
        
        return padding;
    }
    
    /**
     * 先頭と末尾の文字を除去
     */
    public static String toStrip(String prmValue) {
        // 先頭末尾の空白、改行の除去
        String trimValue = prmValue.trim();
        // 文字列長さを取得
        Integer lenCnt = trimValue.length() - 1;
        // 文字数判定
        if (lenCnt <= 1) {
            return '';
        }
        // 文字列除去
        String retValue = trimValue.substring(1,lenCnt);
        
        return retValue + ' ';
    }
    
    /**
     * 指定文字数以降を切り捨て
     */
    public static String toSubString(String prmValue, Integer limitLength) {
        
        if (String.isEmpty(prmValue)) {
            return '';
        }
        
        if (prmValue.length() <= limitLength) {
            return prmValue;
        }
        
        return prmValue.subString(0, limitLength);
    }
    
    /**
     * 特定の文字数ごとに文字を挿入する
     */
    public static String toInsert(String prmTarget, Integer prmLength, String prmInsertVal) {
        
        if (String.isEmpty(prmTarget)) {
            return '';
        }
        
        String result = '';
        prmTarget = prmTarget.trim();
        
        // 現在の文字数を判定
        while (prmTarget.length() > prmLength) {
            result += prmTarget.substring(0,prmLength) + prmInsertVal;
            prmTarget = prmTarget.substring(prmLength, prmTarget.length());
        }
        
        if (String.isEmpty(prmTarget) != true) {
            // 値あり
            result += prmTarget;
        }
        
        return result;
    }
    
    /**
     * 特定の文字数ごとに文字を挿入する
     */
    public static String toInsert(String prmTarget, Integer prmLength, String prmInsertVal, Integer prmLimitLength) {
    
        if (String.isEmpty(prmTarget)) {
            return '';
        }
        
        String target = CommonUtil.toSubString(prmTarget.trim(), prmLimitLength);
        return CommonUtil.toInsert(target, prmLength, prmInsertVal);
    }
    
    /**
     * 先頭の'0'を除外
     */
    public static String toZeroTrim(String prmValue) {
        try {
            // 数値型に変換して先頭の'0'を除外
            Integer wkNumber = Integer.valueOf(prmValue);
            // 文字列型に再変換
            prmValue= String.valueOf(wkNumber );
        } catch (Exception e) {
            return '';
        }
        
        return prmValue;
    }

    /**
     * 全角半角スペースを指定文字列に置換
     */
    public static String toSpaceReplace(String prmTarget, String prmReplaceKey) {
        if (String.isEmpty(prmTarget)) {
            return '';
        }
        return prmTarget.replace('　', ' ').replace(' ', prmReplaceKey);
    }
    
    /**
     * StringをSetに変換
     */
    public static Set<String> parseToSet(String keywarod, String splitKey) {
        Set<String> resutls = new Set<String>();
        // 値判定
        if (String.isEmpty(keywarod) || String.isEmpty(splitKey)) {
            return new Set<String>();
        }
        // 指定したキーワード区切りでリストに変換
        List<String> parseList = keywarod.split(splitKey);
        // Setに変換
        for (String s : parseList) {
            if (String.isNotEmpty(s)) {
                resutls.add(s);
            }
        }

        return resutls;
    }
    
    /**
     * リストをString型に変換 (複数選択リスト変換用)
     */
    public static String parseMultiSelectToString(List<String> selections) {
        String result = '';
        if (!selections.isEmpty()) {
            result = String.valueOf(selections);
            result = result.replace(',', ';');
            result = result.substring(1, result.length() - 1);
        }
        
        return result;
    }

    /**
     * 価格表ID取得
     */
    public static Id getPriceBook2Id(Pricebook2 pricebook2) {
        return Test.isRunningTest() ? Test.getStandardPricebookId() : pricebook2.Id;
    }
}