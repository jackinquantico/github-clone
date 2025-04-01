package com.example.javastudy.commit.service;

import com.example.core.security.SecurityUtils;
import com.example.core.utils.DateUtils;
import com.example.javastudy.branch.model.BranchDto;
import com.example.javastudy.branch.service.BranchService;
import com.example.javastudy.commit.model.CommitDto;
import com.example.javastudy.project.model.ProjectDto;
import com.example.javastudy.project.service.ProjectService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

/**
 * packageName    : com.example.javastudy.commit.service
 * fileName       : CommitService
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
public class CommitService {

    private final CommitMapper commitMapper;
    private final BranchService branchService;
    private final ProjectService projectService;

    public List<CommitDto> selectCommitList(CommitDto dto) {
        return commitMapper.selectCommitList(dto);
    }

    public boolean insertCommit(CommitDto dto) {
        dto.generateSeq();
        setCommitDate(dto);
        commitMapper.insertCommit(dto.toEntity());

        updateLastCommitInfo(dto);
        return true;
    }

    private void setCommitDate(CommitDto dto) {
        dto.setCommitYmd(DateUtils.getDate(2));
        dto.setCommitHm(DateUtils.getDate(11));
    }

    private void updateLastCommitInfo(CommitDto dto) {
        String lastCommitSeq = dto.getSeq();
        String lastCommitMessage = dto.getCommitMessage();
        String lastCommitYmd = dto.getCommitYmd();
        String lastCommitHm = dto.getCommitHm();

        BranchDto branch = BranchDto.builder()
                .seq(dto.getBranchSeq())
                .lastCommitSeq(lastCommitSeq)
                .lastCommitMessage(lastCommitMessage)
                .lastCommitYmd(lastCommitYmd)
                .lastCommitHm(lastCommitHm).build();
        branchService.updateBranch(branch);

        BranchDto info = branchService.selectBranch(branch);
        projectService.updateProject(ProjectDto.builder()
                .seq(info.getProjectSeq())
                .lastCommitMessage(lastCommitMessage)
                .lastCommitYmd(lastCommitYmd)
                .lastCommitHm(lastCommitHm).build());
    }
}
