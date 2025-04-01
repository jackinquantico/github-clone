package com.example.javastudy.branch.controller;

import com.example.core.cmn.model.AjaxResBody;
import com.example.javastudy.branch.model.BranchDto;
import com.example.javastudy.branch.model.BranchVo;
import com.example.javastudy.branch.service.BranchService;
import com.example.javastudy.commit.model.CommitDto;
import com.example.javastudy.commit.service.CommitService;
import com.example.javastudy.project.model.ProjectDto;
import com.example.javastudy.project.service.ProjectService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * packageName    : com.example.javastudy.branch.controller
 * fileName       : BranchController
 * author         : 서채영
 * date           : 2025-03-26
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-26           서채영            최초 생성
 */
@Controller
@RequestMapping("/group/{groupName}/project/{projectName}/branch")
@RequiredArgsConstructor
public class BranchController {

    private final ProjectService projectService;
    private final BranchService branchService;
    private final CommitService commitService;

    @GetMapping({"", "/", "/list"})
    public String list(@ModelAttribute("info") BranchDto branchDto, Model model) {
        model.addAttribute("list", branchService.selectBranchList(branchDto));
        return "branch/list";
    }

    @GetMapping("/add")
    public String add(@ModelAttribute ProjectDto projectDto, Model model) {
        model.addAttribute("info", projectService.selectProject(projectDto));
        if (StringUtils.isNotBlank(projectDto.getBranchSeq())) {
            model.addAttribute("fromBranchSeq", projectDto.getBranchSeq());
        }
        return "branch/add";
    }

    @PostMapping("/add")
    public @ResponseBody AjaxResBody add(@RequestBody BranchDto dto) {
        boolean result = false;
        String message = "브랜치 생성에 실패했습니다.";
        String callback = "";

        try {
            result = branchService.insertBranch(dto);
            message = "브랜치를 생성했습니다.";
            callback = "fnRedirectUrl('/group/" + dto.getGroupName() + "/project/" + dto.getProjectName() + "/branch/list')";
        } catch (RuntimeException e) {
            e.printStackTrace();
        }

        return AjaxResBody.toResponse(result, message, callback);
    }

    @GetMapping("/{branchName}")
    public String view(@ModelAttribute BranchDto branchDto, Model model) {
        BranchDto info = branchService.selectBranch(branchDto);
        List<CommitDto> list = commitService.selectCommitList(CommitDto.builder().branchSeq(info.getSeq()).build());
        model.addAttribute("info", info);
        model.addAttribute("list", list);
        return "branch/view";
    }

    @GetMapping("/{branchName}/update")
    public String update(@ModelAttribute BranchDto branchDto, Model model) {
        model.addAttribute("info", branchService.selectBranch(branchDto));
        return "branch/update";
    }

    @PostMapping("/{branchName}/update")
    public @ResponseBody AjaxResBody update(@RequestBody BranchDto dto, @ModelAttribute BranchDto urlInfo) {
        boolean result = false;
        String message = "브랜치 변경에 실패했습니다.";
        String callback = "";

        try {
            result = branchService.updateBranch(dto);
            message = "브랜치를 변경했습니다.";
            callback = "fnRedirectUrl('/group/" + urlInfo.getGroupName() + "/project/" + urlInfo.getProjectName() + "/branch/list')";
        } catch (RuntimeException e) {
            e.printStackTrace();
        }

        return AjaxResBody.toResponse(result, message, callback);
    }

    @PostMapping("/{branchName}/delete")
    public @ResponseBody AjaxResBody delete(@RequestBody BranchDto dto, @ModelAttribute BranchDto urlInfo) {
        boolean result = false;
        String message = "브랜치 삭제에 실패했습니다.";
        String callback = "";

        try {
            result = branchService.deleteBranch(dto);
            message = "브랜치를 삭제했습니다.";
            callback = "fnRedirectUrl('/group/" + urlInfo.getGroupName() + "/project/" + urlInfo.getProjectName() + "/branch/list')";
        } catch (RuntimeException e) {
            e.printStackTrace();
        }

        return AjaxResBody.toResponse(result, message, callback);
    }
}
