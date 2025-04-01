package com.example.javastudy.project.model;

import lombok.*;

/**
 * packageName    : com.example.javastudy.project.model
 * fileName       : ProjectDto
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
public class ProjectVo {
    /** 프로젝트_SEQ */
    private String seq;
    /** 그룹_SEQ */
    private String groupSeq;
    /** 그룹_이름 */
    private String groupName;
    /** 프로젝트_이름 */
    private String projectName;
    /** 프로젝트_소유자 */
    private String projectOwner;
    /** 프로젝트_설명 */
    private String description;
    /** 공개_여부 */
    private String visibility;
    /** 기본_브랜치 */
    private String defaultBranch;
    /** 최근_커밋_메시지 */
    private String lastCommitMessage;
    /** 최근_커밋_일자 */
    private String lastCommitYmd;
    /** 최근_커밋_시간 */
    private String lastCommitHm;
    /** 전체_커밋_수 */
    private String commitCount;
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
