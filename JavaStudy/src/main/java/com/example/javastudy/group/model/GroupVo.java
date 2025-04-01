package com.example.javastudy.group.model;

import lombok.*;

/**
 * packageName    : com.example.javastudy.group.model
 * fileName       : GroupDto
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
public class GroupVo {
    /** 그룹_SEQ */
    private String seq;
    /** 그룹_이름 */
    private String groupName;
    /** 그룹_설명 */
    private String groupDescription;
    /** 그룹_소유자 */
    private String groupOwner;
    /** 공개_여부 */
    private String visibility;
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
}