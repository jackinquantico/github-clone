package com.example.javastudy.branch.service;

import com.example.javastudy.branch.model.BranchDto;
import com.example.javastudy.project.model.ProjectDto;
import com.example.javastudy.project.service.ProjectService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
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

    private BranchDto selectBranch(String seq) {
        BranchDto dto = BranchDto.builder().seq(seq).build();
        return selectBranch(dto);
    }

    public boolean insertBranch(BranchDto dto) {
        dto.generateSeq();
        if (StringUtils.isNotBlank(dto.getFromBranchSeq())) {
            BranchDto fromBranch = selectBranch(dto.getFromBranchSeq());
            dto.setLastCommitSeq(fromBranch.getLastCommitSeq());
            dto.setLastCommitMessage(fromBranch.getLastCommitMessage());
            dto.setLastCommitYmd(fromBranch.getLastCommitYmd());
            dto.setLastCommitHm(fromBranch.getLastCommitHm());
        }
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
