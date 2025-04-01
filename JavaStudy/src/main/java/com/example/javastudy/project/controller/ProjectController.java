package com.example.javastudy.project.controller;

import com.example.core.cmn.model.AjaxResBody;
import com.example.javastudy.group.model.GroupDto;
import com.example.javastudy.group.service.GroupService;
import com.example.javastudy.project.model.ProjectDto;
import com.example.javastudy.project.service.ProjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * packageName    : com.example.javastudy.project.controller
 * fileName       : ProjectController
 * author         : 서채영
 * date           : 2025-03-25
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-25           서채영            최초 생성
 */
@Controller
@RequestMapping("/group/{groupName}/project")
@RequiredArgsConstructor
public class ProjectController {

    private final GroupService groupService;
    private final ProjectService projectService;

    @GetMapping({"", "/", "/list"})
    public String index(@ModelAttribute ProjectDto dto, Model model) {
        model.addAttribute("list", projectService.selectProjectList(dto));
        return "project/list";
    }

    @GetMapping("/add")
    public String add(@ModelAttribute GroupDto dto, Model model) {
        model.addAttribute("groupList", groupService.selectGroupList(dto));
        model.addAttribute("groupName", dto.getGroupName());
        return "project/add";
    }

    @PostMapping("/add")
    public @ResponseBody AjaxResBody add(@RequestBody ProjectDto dto) {
        boolean result = false;
        String message = "프로젝트 생성에 실패했습니다.";
        String callback = "";

        try {
            result = projectService.insertProject(dto);
            message = "프로젝트를 생성했습니다.";
            callback = "fnRedirectUrl('/group/" + dto.getGroupName() + "')";
        } catch (RuntimeException e) {
            e.printStackTrace();
        }

        return AjaxResBody.toResponse(result, message, callback);
    }

    @GetMapping("/{projectName}")
    public String view(@ModelAttribute ProjectDto dto, Model model) {
        ProjectDto info = projectService.selectProject(dto);
        model.addAttribute("info", info);
        return "project/view";
    }

    @GetMapping("/{projectName}/update")
    public String update(@ModelAttribute ProjectDto dto, Model model) {
        ProjectDto info = projectService.selectProject(dto);
        model.addAttribute("info", info);
        return "project/update";
    }

    @PostMapping("/{projectName}/update")
    public @ResponseBody AjaxResBody update(@RequestBody ProjectDto dto, @PathVariable String groupName) {
        boolean result = false;
        String message = "프로젝트 수정에 실패했습니다.";
        String callback = "";

        try {
            result = projectService.updateProject(dto);
            message = "프로젝트를 수정했습니다.";
            callback = "fnRedirectUrl('/group/" + groupName + "/project/" + dto.getProjectName() + "')";
        } catch (RuntimeException e) {
            e.printStackTrace();
        }

        return AjaxResBody.toResponse(result, message, callback);
    }

    @PostMapping("/{projectName}/delete")
    public @ResponseBody AjaxResBody delete(@RequestBody ProjectDto dto, @PathVariable String groupName) {
        boolean result = false;
        String message = "프로젝트 삭제에 실패했습니다.";
        String callback = "";

        try {
            result = projectService.deleteProject(dto);
            message = "프로젝트를 삭제했습니다.";
            callback = "fnRedirectUrl('/group/" + groupName + "')";
        } catch (RuntimeException e) {
            e.printStackTrace();
        }

        return AjaxResBody.toResponse(result, message, callback);
    }
}
