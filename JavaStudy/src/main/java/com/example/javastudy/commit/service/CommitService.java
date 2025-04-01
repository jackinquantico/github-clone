package com.example.javastudy.commit.service;

import com.example.core.security.SecurityUtils;
import com.example.core.utils.DateUtils;
import com.example.core.utils.Ulid;
import com.example.javastudy.branch.model.BranchDto;
import com.example.javastudy.branch.service.BranchService;
import com.example.javastudy.commit.model.CommitDto;
import com.example.javastudy.project.model.ProjectDto;
import com.example.javastudy.project.service.ProjectService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

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

    private List<CommitDto> selectRebaseCommitList(CommitDto dto) {
        return commitMapper.selectRebaseCommitList(dto);
    }

    private CommitDto selectCommit(AtomicReference<String> lastCommitSeq) {
        CommitDto commitDto = CommitDto.builder().seq(lastCommitSeq.get()).build();
        return commitMapper.selectCommit(commitDto);
    }

    public boolean insertCommit(CommitDto dto) {
        dto.generateSeq();
        setCommitInfo(dto);
        commitMapper.insertCommit(dto.toEntity());

        updateLastCommitInfo(dto);
        return true;
    }

    private void setCommitInfo(CommitDto dto) {
        dto.setCommitterId(SecurityUtils.Impl.getMemberIdInPrinciple());
        dto.setCommitYmd(DateUtils.getDate(2));
        dto.setCommitHm(DateUtils.getDate(11));
        if (StringUtils.isBlank(dto.getParentCommitSeq())) {
            BranchDto branch = branchService.selectBranch(BranchDto.builder().seq(dto.getBranchSeq()).build());
            dto.setParentCommitSeq(branch.getLastCommitSeq());
        }
    }

    private void updateLastCommitInfo(CommitDto dto) {
        BranchDto branch = setBranchLastCommitInfo(dto, true);
        branchService.updateBranch(branch);

        ProjectDto projectDto = setProjectLastCommitInfo(branchService.selectBranch(branch));
        projectService.updateProject(projectDto);
    }

    public boolean insertMergeCommit(BranchDto branchDto) {
        CommitDto commitDto = CommitDto.builder()
                .branchSeq(branchDto.getFromBranchSeq())
                .parentCommitSeq(branchDto.getLastCommitSeq())
                .commitMessage("Merge branch '" + branchDto.getFromBranchName() + "' into " + branchDto.getBranchName())
                .mergeFromCommitSeq(branchDto.getFromBranchLastCommitSeq())
                .build();
        insertCommit(commitDto);

        return true;
    }

    public boolean rebaseBranch(BranchDto originBranch) {
        AtomicReference<String> lastCommitSeq = new AtomicReference<>("");
        CommitDto commitDto = CommitDto.builder()
                .toBranchLastCommitSeq(originBranch.getLastCommitSeq())
                .fromBranchLastCommitSeq(originBranch.getFromBranchLastCommitSeq())
                .build();
        List<CommitDto> list = selectRebaseCommitList(commitDto);
        list.forEach(dto -> {
            dto.setSeq(Ulid.createUlid());
            if (StringUtils.isBlank(dto.getParentCommitSeq())) {
                dto.setParentCommitSeq(originBranch.getFromBranchLastCommitSeq());
            }
            rebaseCommit(dto); // rebase 한 복사본 커밋 추가
            deleteCommit(dto); // 기존 커밋 숨김 처리
            lastCommitSeq.set(dto.getSeq());
        });

        CommitDto lastCommit = selectCommit(lastCommitSeq);
        BranchDto updateBranch = setBranchLastCommitInfo(lastCommit, false);
        branchService.updateBranch(updateBranch);

        return true;
    }


    private void rebaseCommit(CommitDto commitDto) {
        commitMapper.rebaseCommit(commitDto.toEntity());
    }

    private void deleteCommit(CommitDto commitDto) {
        commitMapper.deleteCommit(commitDto.toEntity());
    }

    private BranchDto setBranchLastCommitInfo(CommitDto commit, boolean updateCommitCount) {
        return BranchDto.builder()
            .seq(commit.getBranchSeq())
            .lastCommitSeq(commit.getSeq())
            .lastCommitMessage(commit.getCommitMessage())
            .lastCommitYmd(commit.getCommitYmd())
            .lastCommitHm(commit.getCommitHm())
            .commitCount(updateCommitCount ? "Y" : null)
            .build();
    }

    private ProjectDto setProjectLastCommitInfo(BranchDto branch) {
        ProjectDto projectDto = ProjectDto.builder()
                .seq(branch.getProjectSeq())
                .lastCommitMessage(branch.getLastCommitMessage())
                .lastCommitYmd(branch.getLastCommitYmd())
                .lastCommitHm(branch.getLastCommitHm())
                .build();
        if ("Y".equals(branch.getIsDefault())) {
            projectDto.setCommitCount(branch.getCommitCount());
        }
        return projectDto;
    }
}
