package com.example.core.cmn.model;

import lombok.*;
import org.checkerframework.checker.units.qual.A;

/**
 * packageName    : com.example.core.cmn.model
 * fileName       : AjaxResBody
 * author         : 서채영
 * date           : 2025-03-25
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-25           서채영            최초 생성
 */
@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AjaxResBody {
    private boolean result;
    private String message;
    private String callback;
    private Object data;

    public static AjaxResBody toResponse(boolean result, String message, String callback, Object data) {
        return AjaxResBody.builder()
                .result(result)
                .message(message)
                .callback(callback)
                .data(data)
                .build();
    }

    public static  AjaxResBody toResponse(boolean result, String message, String callback) {
        return AjaxResBody.builder()
                .result(result)
                .message(message)
                .callback(callback)
                .build();
    }

    public static  AjaxResBody toResponse(boolean result, String message) {
        return AjaxResBody.builder()
                .result(result)
                .message(message)
                .build();
    }
}
