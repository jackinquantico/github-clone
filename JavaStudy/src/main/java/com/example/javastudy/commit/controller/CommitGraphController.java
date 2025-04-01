package com.example.javastudy.commit.controller;

import com.example.core.cmn.model.AjaxResBody;
import com.example.javastudy.commit.model.CommitGraphDto;
import com.example.javastudy.commit.service.CommitGraphService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * packageName    : com.example.javastudy.commit.controller
 * fileName       : CommitGraphController
 * author         : 서채영
 * date           : 2025-03-27
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-27           서채영            최초 생성
 */
@Controller
@RequestMapping("/group/{groupName}/project/{projectName}/commit-graph")
@RequiredArgsConstructor
public class CommitGraphController {
    private final CommitGraphService commitGraphService;

    @PostMapping({"", "/"})
    public @ResponseBody AjaxResBody graph(@RequestBody CommitGraphDto commitGraphDto) {
        String callback = "fnDrawGraph(__DATA__)";
        String mermaidResult = commitGraphService.generateCommitGraph(commitGraphDto);
        return AjaxResBody.toResponse(true, "", callback, mermaidResult);
    }
}
