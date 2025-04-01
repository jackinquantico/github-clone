package com.example.javastudy.commit.utils;

import com.example.javastudy.commit.model.CommitGraphDto;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * packageName    : com.example.javastudy.commit.utils
 * fileName       : GitGraphDataBuilder
 * author         : 서채영
 * date           : 2025-03-28
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-28           서채영            최초 생성
 */
public class GitGraphDataBuilder {
    private final List<CommitGraphDto> commitList;

    public GitGraphDataBuilder(List<CommitGraphDto> commitList) {
        this.commitList = commitList;
    }

    public List<Map<String, Object>> build() {
        List<Map<String, Object>> result = new ArrayList<>();

        for (CommitGraphDto commit : commitList) {
            Map<String, Object> map = new LinkedHashMap<>();
            map.put("seq", commit.getSeq());
            map.put("branchName", commit.getBranchName());
            map.put("commitMessage", commit.getCommitMessage());
            map.put("parentCommitSeq", commit.getParentCommitSeq());
            map.put("mergeFromCommitSeq", commit.getMergeFromCommitSeq());
            map.put("rebaseOriginSeq", commit.getRebaseOriginSeq());
            result.add(map);
        }
        return result;
    }
}
