package com.example.core.interceptor;

import com.example.javastudy.project.model.ProjectDto;
import com.example.javastudy.project.service.ProjectService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * packageName    : com.example.core
 * fileName       : SidebarIntercepto
 * author         : 서채영
 * date           : 2025-03-31
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-31           서채영            최초 생성
 */
@Slf4j
@Configuration
@RequiredArgsConstructor
public class SidebarInterceptor implements HandlerInterceptor {

    private final ProjectService projectService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        ProjectDto popular = ProjectDto.builder().commitCount("DESC").build();
        List<ProjectDto> popularList = projectService.selectProjectList(popular);
        request.setAttribute("popularList", popularList);

        ProjectDto recent = ProjectDto.builder().lastCommitYmd("DESC").build();
        List<ProjectDto> recentList = projectService.selectProjectList(recent);
        request.setAttribute("recentList", recentList);

        return HandlerInterceptor.super.preHandle(request, response, handler);
    }
}
