package com.example.core.utils;

import com.github.f4b6a3.ulid.UlidCreator;

/**
 * packageName    : com.example.core.utils
 * fileName       : Ulid
 * author         : 서채영
 * date           : 2025-03-25
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-25           서채영            최초 생성
 */
public class Ulid {
    public static String createUlid() {
        return UlidCreator.getUlid().toLowerCase().toUpperCase();
    }
}
