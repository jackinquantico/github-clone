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

import java.util.List;
import java.util.Map;

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

    @PostMapping("/mermaid")
    public @ResponseBody AjaxResBody mermaid(@RequestBody CommitGraphDto commitGraphDto) {
        String callback = "fnDrawGraphByMermaid(__DATA__)";
        String mermaidResult = commitGraphService.generateCommitGraphByMermaid(commitGraphDto);
        return AjaxResBody.toResponse(true, "", callback, mermaidResult);
    }

    @PostMapping("/gitgraph")
    public @ResponseBody AjaxResBody gitgraph(@RequestBody CommitGraphDto commitGraphDto) {
        String callback = "fnDrawGraphByGirGraph(__DATA__)";
        List<Map<String, Object>> maps = commitGraphService.generateCommitGraphByGitGraph(commitGraphDto);
        return AjaxResBody.toResponse(true, "", callback, maps);
    }
}
