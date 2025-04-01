package com.example.javastudy.commit.utils;

import com.example.javastudy.commit.model.CommitGraphDto;

import java.util.*;

/**
 * packageName    : com.example.javastudy.commit.utils
 * fileName       : MermaidBuilder
 * author         : 서채영
 * date           : 2025-03-27
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-27           서채영            최초 생성
 */
public class MermaidBuilder {

    private final List<CommitGraphDto> commitList;
    private final StringBuilder builder = new StringBuilder();
    private final Map<String, String> branchNameMap = new HashMap<>();
    private final Set<String> declaredBranches = new HashSet<>();
    private String currentBranch = "";

    public MermaidBuilder(List<CommitGraphDto> commitList) {
        this.commitList = commitList;
    }

    public String build() {
        builder.append("gitGraph TB:\n");

        for (CommitGraphDto commit : commitList) {
            String branchName = commit.getBranchName();
            String commitMsg = commit.getCommitMessage();
            String mergeFrom = commit.getMergeFromCommitSeq();
            String rebaseOrigin = commit.getRebaseOriginSeq();

            // 브랜치 선언 & checkout 처리
            if (!declaredBranches.contains(branchName)) {
                if (!"main".equals(branchName)) {
                    builder.append("    branch \"").append(branchName).append("\"\n");
                }
                declaredBranches.add(branchName);
                builder.append("    checkout \"").append(branchName).append("\"\n");
                currentBranch = branchName;
            } else if (!branchName.equals(currentBranch)) {
                builder.append("    checkout \"").append(branchName).append("\"\n");
                currentBranch = branchName;
            }

            // 커밋 추가
            builder.append("    commit id: \"").append(commitMsg);

            // ✅ rebase 표시 추가
            if (rebaseOrigin != null && !rebaseOrigin.isEmpty()) {
                builder.append(" (rebase)");
            }

            builder.append("\"\n");

            // 머지 처리
            if (mergeFrom != null && !mergeFrom.isEmpty()) {
                String mergeBranch = findBranchNameByLastCommit(mergeFrom);
                if (mergeBranch != null) {
                    builder.append("    merge \"").append(mergeBranch).append("\"\n");
                }
            }
        }
        return builder.toString();
    }

    // 커밋 SEQ로부터 해당 브랜치명 찾기 (머지용)
    private String findBranchNameByLastCommit(String commitSeq) {
        for (CommitGraphDto dto : commitList) {
            if (dto.getSeq().equals(commitSeq)) {
                return dto.getBranchName();
            }
        }
        return null;
    }
}
