public with sharing class CommonConst {
    
    /**
     * コンストラクタ
     */
    public CommonConst () {
        
    }
    
    /** システムエラーメッセージ */
    public static final String EXCEPTION_MSG      = 'システムエラーが発生しました。お手数ですがシステム管理者までご連絡ください。';
    
    /** URLパラメータ */
    public static final String PARAM_RETURN_URL   = 'retURL';
    public static final String PARAM_ID           = 'id';
    
    /** TYPE **/
    public static final String TYPE_DOWNLOAD      = 'dwn';
    
    /** 曜日(英字) */
    public static final String WEEK_MONDAY_EG     = 'Mon';
    public static final String WEEK_TUESDAY_EG    = 'Tue';
    public static final String WEEK_WEDNESDAY_EG  = 'Wed';
    public static final String WEEK_THURSDAY_EG   = 'Thu';
    public static final String WEEK_FRIDAY_EG     = 'Fri';
    public static final String WEEK_SATURDAY_EG   = 'Sat';
    public static final String WEEK_SUNDAY_EG     = 'Sun';
    
    /** 月(英字) */
    public static final String MONTH_JAN_EG       = 'Jan';
    public static final String MONTH_FEB_EG       = 'Feb';
    public static final String MONTH_MAR_EG       = 'Mar';
    public static final String MONTH_APR_EG       = 'Apr';
    public static final String MONTH_MAY_EG       = 'May';
    public static final String MONTH_JUN_EG       = 'Jun';
    public static final String MONTH_JUL_EG       = 'Jul';
    public static final String MONTH_AUG_EG       = 'Aug';
    public static final String MONTH_SEP_EG       = 'Sep';
    public static final String MONTH_OCT_EG       = 'Oct';
    public static final String MONTH_NOV_EG       = 'Nov';
    public static final String MONTH_DEC_EG       = 'Dec';
    
    /** 年月日 */
    public static final String JP_YEAR_LABEL  = '年';
    public static final String JP_MONTH_LABEL = '月';
    public static final String JP_DAY_LABEL   = '日';
    
    /* 和暦 */
    public static final String JP_CALENDAR_TYPE_1 = '明治';
    public static final String JP_CALENDAR_TYPE_2 = '大正';
    public static final String JP_CALENDAR_TYPE_3 = '昭和';
    public static final String JP_CALENDAR_TYPE_4 = '平成';
    
    /** ファイル種別 */
    public static final String FILE_TYPE_PDF      = '.pdf';
    public static final String FILE_TYPE_EXCEL    = '.xls';
    public static final String FILE_TYPE_WORD     = '.doc';
    
    /** URL **/
    public static final String URL_HOME = '/home/home.jsp';
    
    /** 契約ステータス初期値 */
    public static final String CONTRACT_DEFAULT_STATUS  = 'Draft';
    
    /** 改行コード */
    public static final String CRLF = '\r\n';
}