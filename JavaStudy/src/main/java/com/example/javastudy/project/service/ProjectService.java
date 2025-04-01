package com.example.javastudy.project.service;

import com.example.core.security.SecurityUtils;
import com.example.javastudy.branch.model.BranchDto;
import com.example.javastudy.branch.service.BranchService;
import com.example.javastudy.project.model.ProjectDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * packageName    : com.example.javastudy.project.service
 * fileName       : ProjectService
 * author         : 서채영
 * date           : 2025-03-25
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-25           서채영            최초 생성
 */
@Service
@RequiredArgsConstructor
public class ProjectService {

    private final ProjectMapper projectMapper;
    private final BranchService branchService;

    public List<ProjectDto> selectProjectList(ProjectDto dto) {
        if (SecurityUtils.isAuthenticated()) {
            dto.setProjectOwner(SecurityUtils.Impl.getMemberIdInPrinciple());
        }
        return projectMapper.selectProjectList(dto);
    }

    public ProjectDto selectProject(ProjectDto dto) {
        return projectMapper.selectProject(dto);
    }

    public boolean insertProject(ProjectDto dto) {
        dto.generateSeq();
        dto.setProjectOwner(SecurityUtils.Impl.getMemberIdInPrinciple());
        projectMapper.insertProject(dto.toEntity());

        insertDefaultBranch(selectProject(dto));

        return true;
    }

    private void insertDefaultBranch(ProjectDto dto) {
        String groupSeq = dto.getGroupSeq();
        String groupName = dto.getGroupName();
        String projectSeq = dto.getSeq();
        String projectName = dto.getProjectName();
        String defaultBranch = dto.getDefaultBranch();
        BranchDto branchDto = BranchDto.builder()
                .groupSeq(groupSeq)
                .groupName(groupName)
                .projectSeq(projectSeq)
                .projectName(projectName)
                .branchName(defaultBranch)
                .isDefault("Y")
                .build();
        branchService.insertBranch(branchDto);
    }

    public boolean updateProject(ProjectDto dto) {
        projectMapper.updateProject(dto.toEntity());
        return true;
    }

    public boolean deleteProject(ProjectDto dto) {
        projectMapper.deleteProject(dto.toEntity());
        return true;
    }
}
