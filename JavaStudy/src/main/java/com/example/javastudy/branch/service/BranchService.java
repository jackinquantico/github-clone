package com.example.javastudy.branch.service;

import com.example.javastudy.branch.model.BranchDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * packageName    : com.example.javastudy.branch.service
 * fileName       : BranchService
 * author         : 서채영
 * date           : 2025-03-26
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-26           서채영            최초 생성
 */
@Service
@RequiredArgsConstructor
public class BranchService {

    private final BranchMapper branchMapper;

    public List<BranchDto> selectBranchList(BranchDto branchDto) {
        return branchMapper.selectBranchList(branchDto);
    }

    public BranchDto selectBranch(BranchDto branchDto) {
        return branchMapper.selectBranch(branchDto);
    }

    public boolean insertBranch(BranchDto dto) {
        dto.generateSeq();
        branchMapper.insertBranch(dto.toEntity());
        return true;
    }

    public boolean updateBranch(BranchDto dto) {
        branchMapper.updateBranch(dto.toEntity());
        return true;
    }

    public boolean deleteBranch(BranchDto dto) {
        branchMapper.deleteBranch(dto.toEntity());
        return true;
    }
}
