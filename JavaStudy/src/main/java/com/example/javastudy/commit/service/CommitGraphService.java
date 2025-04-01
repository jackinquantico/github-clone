package com.example.javastudy.commit.service;

import com.example.javastudy.commit.model.CommitGraphDto;
import com.example.javastudy.commit.utils.MermaidBuilder;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * packageName    : com.example.javastudy.commit.service
 * fileName       : CommitGraphService
 * author         : 서채영
 * date           : 2025-03-27
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-27           서채영            최초 생성
 */
@Service
@RequiredArgsConstructor
public class CommitGraphService {
    private final CommitGraphMapper commitGraphMapper;

    private List<CommitGraphDto> selectCommitGraphList(CommitGraphDto commitGraphDto) {
        return commitGraphMapper.selectCommitGraphList(commitGraphDto);
    }

    public String generateCommitGraph(CommitGraphDto commitGraphDto) {
        List<CommitGraphDto> list = selectCommitGraphList(commitGraphDto);
        MermaidBuilder builder = new MermaidBuilder(list);
        return builder.build();
    }
}
