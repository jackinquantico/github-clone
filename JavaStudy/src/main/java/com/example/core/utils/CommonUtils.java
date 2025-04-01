package com.example.core.utils;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * packageName    : com.example.core.utils
 * fileName       : CommonUtils
 * author         : 서채영
 * date           : 2025-03-25
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-25           서채영            최초 생성
 */
public class CommonUtils {

    public static HttpServletRequest getRequest() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        return attr.getRequest();
    }

    public static HttpSession getSession() {
        return getRequest().getSession();
    }

    public static String ternaryOperator(String variable, String value, String rtnStr) {
        if (variable == null || value == null) {
            return "";
        }
        return value.equals(variable) ? rtnStr : "";
    }

    public static String selected(String val1, String val2) {
        return (StringUtils.isNoneBlank(val1, val2) && val1.equals(val2)) ? "selected" : "";
    }

    public static String checked(String val1, String val2) {
        return (StringUtils.isNoneBlank(val1, val2) && val1.equals(val2)) ? "checked" : "";
    }

    public static String defaultString(String value) {
        return StringUtils.defaultString(value);
    }
}
