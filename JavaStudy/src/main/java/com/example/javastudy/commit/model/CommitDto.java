package com.example.javastudy.commit.model;

import com.example.core.utils.Ulid;
import lombok.*;
import org.apache.commons.lang3.StringUtils;

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
public class CommitDto {
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

    private String fromBranchLastCommitSeq; // rebase 할 기준 브랜치 (main)
    private String toBranchLastCommitSeq; // rebase 할 대상 브랜치 (feature)

    public void generateSeq() {
        if (StringUtils.isBlank(seq)) {
            this.seq = Ulid.createUlid();
        }
    }

    public CommitVo toEntity() {
        CommitVo vo = CommitVo.builder()
                .seq(seq)
                .branchSeq(branchSeq)
                .parentCommitSeq(parentCommitSeq)
                .commitMessage(commitMessage)
                .committerId(committerId)
                .commitYmd(commitYmd)
                .commitHm(commitHm)
                .mergeFromCommitSeq(mergeFromCommitSeq)
                .createDate(createDate)
                .rebaseOriginSeq(rebaseOriginSeq)
                .build();
        return vo;
    }
}
