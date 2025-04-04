package com.example.javastudy;

import com.example.javastudy.member.model.MemberDto;
import com.example.javastudy.member.service.MemberService;
import com.example.javastudy.project.model.ProjectDto;
import com.example.javastudy.project.service.ProjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * packageName    : com.example.javastudy
 * fileName       : IndexController
 * author         : 서채영
 * date           : 2025-03-25
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-25           서채영            최초 생성
 */
@Controller
@RequiredArgsConstructor
public class IndexController {

    private final ProjectService projectService;

    @GetMapping({ "", "/" })
    public String index(@ModelAttribute ProjectDto projectDto, Model model) {
        model.addAttribute("list", projectService.selectProjectList(projectDto));
        return "home/index";
    }
}
