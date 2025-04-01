package com.example.core.utils;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * packageName    : com.example.core.utils
 * fileName       : DateUtils
 * author         : 서채영
 * date           : 2025-03-27
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-27           서채영            최초 생성
 */
public class DateUtils {

    public static String getDate(int type) {
        final String[] dateType = {
                EDateTimeFormat.SHORT_DATE_TIME.getValue(), // 0
                EDateTimeFormat.LONG_DATE_TIME.getValue(),  // 1
                EDateTimeFormat.SHORT_DATE.getValue(),      // 2
                EDateTimeFormat.LONG_DATE.getValue(),       // 3
                EDateTimeFormat.YEAR.getValue(),            // 4
                EDateTimeFormat.MONTH.getValue(),           // 5
                EDateTimeFormat.DAY.getValue(),             // 6
                EDateTimeFormat.HOUR.getValue(),            // 7
                EDateTimeFormat.MIN.getValue(),             // 8
                EDateTimeFormat.SEC.getValue(),             // 9
                EDateTimeFormat.LONG_TIME.getValue(),       // 10
                EDateTimeFormat.HM.getValue(),              // 11
        };
        return _formatDate(dateType[type]);
    }

    private static String _formatDate(String pattern) {
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern(pattern));
    }

    @Getter
    @AllArgsConstructor
    enum EDateTimeFormat {
        LONG_DATE_TIME("yyyy-MM-dd HH:mm:ss"),
        SHORT_DATE_TIME("yyyyMMddHHmmss"),
        LONG_DATE("yyyy-MM-dd"),
        SHORT_DATE("yyyyMMdd"),
        LONG_TIME("HH:mm:ss"),
        SHORT_TIME("HHmmss"),
        YEAR("yyyy"),
        MONTH("MM"),
        DAY("dd"),
        HOUR("HH"),
        MIN("mm"),
        SEC("ss"),
        HM("HHmm")
        ;

        private final String value;
    }
}
