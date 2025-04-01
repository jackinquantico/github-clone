package com.example.javastudy.auth.model;

import lombok.*;

/**
 * packageName    : com.example.javastudy.auth.model
 * fileName       : AuthDto
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
public class AuthDto {
    private String memberId;
    private String memberPassword;
}
