package com.example.javastudy.branch.model;

import com.example.core.utils.Ulid;
import lombok.*;
import org.apache.commons.lang3.StringUtils;

/**
 * packageName    : com.example.javastudy.branch.model
 * fileName       : BranchDto
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
public class BranchDto {
    /** 브랜치_SEQ */
    private String seq;
    /** 그룹_SEQ */
    private String groupSeq;
    /** 그룹_이름 */
    private String groupName;
    /** 프로젝트_SEQ */
    private String projectSeq;
    /** 프로젝트_이름 */
    private String projectName;
    /** 브랜치_이름 */
    private String branchName;
    /** 기본_브랜치_여부 */
    private String isDefault;
    /** 최근_커밋_SEQ */
    private String lastCommitSeq;
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

    // 검색용
    private String fromBranchSeq; // new Branch from, merge 시 사용
    private String fromBranchName;
    private String fromBranchLastCommitSeq;

    public void generateSeq() {
        if (StringUtils.isBlank(seq)) {
            this.seq = Ulid.createUlid();
        }
    }

    public BranchVo toEntity() {
        BranchVo vo = BranchVo.builder()
                .seq(seq)
                .groupSeq(groupSeq)
                .groupName(groupName)
                .projectSeq(projectSeq)
                .projectName(projectName)
                .branchName(branchName)
                .isDefault(isDefault)
                .lastCommitSeq(lastCommitSeq)
                .lastCommitMessage(lastCommitMessage)
                .lastCommitYmd(lastCommitYmd)
                .lastCommitHm(lastCommitHm)
                .commitCount(commitCount)
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
