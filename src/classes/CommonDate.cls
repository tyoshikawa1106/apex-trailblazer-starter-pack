public with sharing class CommonDate {
    
    /**
     * クエリ用に変換
     */
    public static String toQuery(Date prmDate) {
        return prmDate != null ? String.valueOf(prmDate) : '';
    }
    
    /**
     * 文字列日付を日付型に変換
     */
    public static Date toDate(String prmDate) {
        
        if (String.isEmpty(prmDate)) {
            return null;
        }
        return Date.valueOf(prmDate.replace('/', '-'));
    }
    
    /**
     * 対象文字列の日付判定
     */
    public static Boolean isDate(String prmDate) {
        
        try {
            Date target = toDate(prmDate);
        } catch (Exception e) {
            return false;
        }
        
        return true;
    }
    
    /**
     * 対象文字列の日付判定
     */
    public static String isDate(String prmDate, String errorMessage) {
        
        if (!CommonDate.isDate(prmDate)) {
            return errorMessage;
        }
        
        return '';
    }
    
    /**
     * 文字列日付を日付時間型に変換
     */
    public static DateTime toDateTimeFrom(String prmDate) {
        
        if (String.isEmpty(prmDate)) {
            return null;
        }
        
        List<String> prmDates = prmDate.replace('/', '-').split('-');
        Integer year = Integer.valueOf(prmDates[0]);
        Integer month = Integer.valueOf(prmDates[1]);
        Integer day = Integer.valueOf(prmDates[2]);
        
        return Datetime.newInstance(year, month, day, 0, 0, 0);
    }
    
    /**
     * 文字列日付を日付時間型に変換
     */
    public static DateTime toDateTimeTo(String prmDate) {
        
        if (String.isEmpty(prmDate)) {
            return null;
        }
        
        List<String> prmDates = prmDate.replace('/', '-').split('-');
        Integer year = Integer.valueOf(prmDates[0]);
        Integer month = Integer.valueOf(prmDates[1]);
        Integer day = Integer.valueOf(prmDates[2]);
        
        return Datetime.newInstance(year, month, day, 23, 59, 59);
    }
    
    /**
     * 休日判定
     */
    public static Boolean isHoliday(Date prmDate) {
        
        String week = Datetime.newInstance(prmDate, Time.newInstance(0, 0, 0, 0)).format('E');
        
        if(week.equals(CommonConst.WEEK_SATURDAY_EG) || week.equals(CommonConst.WEEK_SUNDAY_EG)) {
            // 土・日の場合Trueを返す
            return true;
        }
        
        return false;
    }
    
    /**
     * 月初日付取得
     */
    public static Date getMonthOfStartDay(Date prmDate) {
        return prmDate != null ? Date.newInstance(prmDate.year(), prmDate.month(), 1) : null;
    }
    
    /**
     * 月末日付取得
     */
    public static Date getMonthOfEndDay(Date prmDate) {
        return prmDate != null ? Date.newInstance(prmDate.year(), prmDate.month() + 1 ,0) : null;
    }
    
    /**
     * 曜日取得
     */
    public static String getDayOfTheWeek(Date prmDate) {
        
        if (prmDate == null) {
            return '';
        }
        
        // 対象日付から曜日取得
        String week = Datetime.newInstance(prmDate, Time.newInstance(0, 0, 0, 0)).format('E');
        
        // 曜日判定
        if (week.equals(CommonConst.WEEK_MONDAY_EG) == true) {
            // 月
            return '月';
            
        } else if (week.equals(CommonConst.WEEK_TUESDAY_EG) == true) {
            // 火
            return '火';
            
        } else if (week.equals(CommonConst.WEEK_WEDNESDAY_EG) == true) {
            // 水
            return '水';
            
        } else if (week.equals(CommonConst.WEEK_THURSDAY_EG) == true) {
            // 木
            return '木';
            
        } else if (week.equals(CommonConst.WEEK_FRIDAY_EG) == true) {
            // 金
            return '金';
            
        } else if (week.equals(CommonConst.WEEK_SATURDAY_EG) == true) {
            // 土
            return '土';
            
        } else {
            // 日
            return '日';
        }
    }
    
    /**
     * 有効時間の判定
     */
    public static Boolean isActiveTime(Time prmNowTime, Time prmStartTime, Time prmEndTime) {
        
        if (prmStartTime > prmNowTime) {
            return false;
        } else if(prmEndTime < prmNowTime) {
            return false;
        }
        
        return true;
    }
    
    /**
     * 時間の文字列変換(hh:mm:ss)
     */
    public static String toString(Time prmTargetTime) {
        return prmTargetTime != null ? String.valueOf(prmTargetTime).substring(0, 8) : null;
    }
    
    /**
     * 日付を指定フォーマットの文字列に変換する
     */
    public static String toFormat(Date prmDate, String prmFormat) {
        
        if (prmDate == null) {
            return '';
        }
        return Datetime.newInstance(prmDate, Time.newInstance(0, 0, 0, 0)).format(prmFormat);
    }
    
    /**
     * 文字列を日付型に変換
     */
    public static Date toParseDate(String prmValue) {
        
        if (String.isEmpty(prmValue)) {
            return null;
        }
        
        Date result = date.valueOf(prmValue.replace('/','-'));
        
        return result;
    }
    
    /**
     * 文字列を日付型に変換
     */
    public static Date toParseDate(String prmYear, String prmMonth, String prmDay) {
        
        Date result = null;
        try {
            String stringDate = prmYear + '-' + prmMonth + '-' + prmDay;
            result = date.valueOf(stringDate);
        } catch (Exception e) {
            return null;
        }
        
        return result;
    }
    
    /**
     * 数値を日付型に変換
     */
    public static Date toParseDate(Integer prmYear, Integer prmMonth, Integer prmDay) {
        return date.newInstance(prmYear, prmMonth, prmDay);
    }
    
    /**
     * 日付を日付時間型に変換
     */
    public static DateTime toParseDateTime(Date prmDate, String prmHour, String prmMinute, String prmSecond) {
        
        DateTime result = null;
        try {
            String stringDate = String.valueOf(prmDate.year())
                                + '-'
                                + String.valueOf(prmDate.month())
                                + '-'
                                + String.valueOf(prmDate.day())
                                + ' '
                                + prmHour
                                + ':'
                                + prmMinute
                                + ':'
                                + prmSecond;
                                    
            result = datetime.valueOf(stringDate);
        } catch (Exception e) {
            return null;
        }
        
        return result;
    }
    
    /**
     * 日付を日付時間型に変換
     */
    public static DateTime toParseDateTime(Integer prmYear, Integer prmMonth, Integer prmDay, Integer prmHour, Integer prmMinute, Integer prmSecond) {
        return datetime.newInstance(prmYear, prmMonth, prmDay, prmHour, prmMinute, prmSecond);
    }
    
    /**
     * 日付を日付時間型に変換
     */
    public static DateTime toParseDateTime(Integer prmYear, Integer prmMonth, Integer prmDay) {
        return datetime.newInstance(prmYear, prmMonth, prmDay);
    }
    
    /**
     *  年月日形式に変換
     */
    public static String toParseJapanDateFormat(Date prmDate) {
        String result = '';
        if (prmDate != null) {
            result =  String.valueOf(prmDate.year())
                        + CommonConst.JP_YEAR_LABEL
                        + String.valueOf(prmDate.month())
                        + CommonConst.JP_MONTH_LABEL
                        + String.valueOf(prmDate.day())
                        + CommonConst.JP_DAY_LABEL;
        }
        return result;
    }
    
    /**
     *  年月形式に変換
     */
    public static String toParseJapanDateFormatByMonthsAndYears(Date prmDate) {
        String result = '';
        if (prmDate != null) {
            result =  String.valueOf(prmDate.year())
                        + CommonConst.JP_YEAR_LABEL
                        + String.valueOf(prmDate.month())
                        + CommonConst.JP_MONTH_LABEL;
        }
        return result;
    }
    
    /**
     * 検索日付の形式判定
     */
    public static String isSearchDate(Date dateFrom, Date dateTo, String errorMessage) {
        if (dateFrom > dateTo) {
            return errorMessage;
        }
        return '';
    }
}