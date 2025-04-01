package com.example.javastudy.commit.model;

import lombok.*;

/**
 * packageName    : com.example.javastudy.commit.model
 * fileName       : CommitDto
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
public class CommitVo {
    /** 커밋_SEQ */
    private String seq;
    /** 브랜치_SEQ */
    private String branchSeq;
    /** 이전_커밋_SEQ */
    private String parentCommitSeq;
    /** 커밋_메시지 */
    private String commitMessage;
    /** 커밋_ID */
    private String committerId;
    /** 커밋_일자 */
    private String commitYmd;
    /** 커밋_시간 */
    private String commitHm;
    /** Merge_커밋_SEQ */
    private String mergeFromCommitSeq;
    /** 생성일시 */
    private String createDate;
    /** rebase 시 기존 커밋 SEQ */
    private String rebaseOriginSeq;
}
