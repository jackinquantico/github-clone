package com.example.javastudy.group.model;

import com.example.core.utils.Ulid;
import lombok.*;
import org.apache.commons.lang3.StringUtils;

/**
 * packageName    : com.example.javastudy.group.model
 * fileName       : GroupMemberDto
 * author         : 서채영
 * date           : 2025-03-26
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-26           서채영            최초 생성
 */
@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GroupMemberDto {
    /** 멤버_SEQ */
    private String memberSeq;
    /** 그룹_SEQ */
    private String groupSeq;
    /** 권한 */
    private String role;
    /** 삭제여부 */
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

    private String memberId;
    private String memberName;
    private String memberEmail;

    public GroupMemberVo toEntity() {
        GroupMemberVo vo = GroupMemberVo.builder()
                .memberSeq(memberSeq)
                .groupSeq(groupSeq)
                .role(role)
                .delYn(delYn)
                .createId(createId)
                .createName(createName)
                .createDate(createDate)
                .updateId(updateId)
                .updateName(updateName)
                .updateDate(updateDate)
                .deleteId(deleteId)
                .deleteName(deleteName)
                .deleteDate(deleteDate)
                .build();
        return vo;
    }
}