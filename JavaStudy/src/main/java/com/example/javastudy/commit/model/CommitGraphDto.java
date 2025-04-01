package com.example.javastudy.commit.model;

import lombok.*;

/**
 * packageName    : com.example.javastudy.commit.model
 * fileName       : CommitGraphDto
 * author         : 서채영
 * date           : 2025-03-27
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-27           서채영            최초 생성
 */
@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CommitGraphDto {
    private String seq;
    private String groupName;
    private String projectName;
    private String branchSeq;
    private String branchName;
    private String parentCommitSeq;
    private String mergeFromCommitSeq;
    private String rebaseOriginSeq;
    private String commitMessage;
}
