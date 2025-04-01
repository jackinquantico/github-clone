package com.example.javastudy.member.model;

import com.example.core.utils.Ulid;
import lombok.*;
import org.apache.commons.lang3.StringUtils;


/**
 * packageName    : com.example.javastudy.member.model
 * fileName       : MemberDto
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
public class MemberVo {
    /** SEQ */
    private String seq;
    /** 회원 아이디 */
    private String memberId;
    /** 회원 이름 */
    private String memberName;
    /** 회원 비밀번호 */
    private String memberPassword;
    /** 회원 이메일 */
    private String memberEmail;
    /** 삭제 여부 */
    private String delYn;
    /** 등록ID */
    private String createId;
    /** 등록명 */
    private String createName;
    /** 등록일시 */
    private String createDate;
    /** 수정ID */
    private String updateId;
    /** 수정명 */
    private String updateName;
    /** 수정일시 */
    private String updateDate;
    /** 삭제ID */
    private String deleteId;
    /** 삭제명 */
    private String deleteName;
    /** 삭제일시 */
    private String deleteDate;
}
