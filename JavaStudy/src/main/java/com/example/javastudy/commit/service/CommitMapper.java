package com.example.javastudy.commit.service;

import com.example.javastudy.commit.model.CommitDto;
import com.example.javastudy.commit.model.CommitVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * packageName    : com.example.javastudy.commit.service
 * fileName       : CommitMapper
 * author         : 서채영
 * date           : 2025-03-26
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-26           서채영            최초 생성
 */
@Mapper
public interface CommitMapper {
    List<CommitDto> selectCommitList(CommitDto dto);
    List<CommitDto> selectRebaseCommitList(CommitDto dto);
    CommitDto selectCommit(CommitDto commitDto);

    void insertCommit(CommitVo entity);
    void rebaseCommit(CommitVo entity);
    void deleteCommit(CommitVo entity);
}
