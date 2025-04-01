package com.example.javastudy.project.service;

import com.example.javastudy.project.model.ProjectDto;
import com.example.javastudy.project.model.ProjectVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * packageName    : com.example.javastudy.project.mapper
 * fileName       : ProjectMapper
 * author         : 서채영
 * date           : 2025-03-25
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-25           서채영            최초 생성
 */
@Mapper
public interface ProjectMapper {
    List<ProjectDto> selectProjectList(ProjectDto dto);
    ProjectDto selectProject(ProjectDto dto);

    void insertProject(ProjectVo entity);
    void updateProject(ProjectVo entity);
    void deleteProject(ProjectVo entity);
}
