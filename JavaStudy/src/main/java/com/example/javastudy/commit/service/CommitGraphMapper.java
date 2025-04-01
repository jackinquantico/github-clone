package com.example.javastudy.commit.service;

import com.example.javastudy.commit.model.CommitGraphDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * packageName    : com.example.javastudy.commit.service
 * fileName       : CommitGraphMapper
 * author         : 서채영
 * date           : 2025-03-27
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-27           서채영            최초 생성
 */
@Mapper
public interface CommitGraphMapper {

    List<CommitGraphDto> selectCommitGraphList(CommitGraphDto commitGraphDto);
}
