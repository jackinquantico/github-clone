package com.example.javastudy.branch.service;

import com.example.javastudy.branch.model.BranchDto;
import com.example.javastudy.branch.model.BranchVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * packageName    : com.example.javastudy.branch.service
 * fileName       : BranchMapper
 * author         : 서채영
 * date           : 2025-03-26
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-26           서채영            최초 생성
 */
@Mapper
public interface BranchMapper {
    List<BranchDto> selectBranchList(BranchDto branchDto);
    BranchDto selectBranch(BranchDto branchDto);

    void insertBranch(BranchVo entity);
    void updateBranch(BranchVo entity);
    void deleteBranch(BranchVo entity);
}
