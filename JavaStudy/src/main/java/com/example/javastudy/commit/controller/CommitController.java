package com.example.javastudy.commit.controller;

import com.example.core.cmn.model.AjaxResBody;
import com.example.javastudy.commit.model.CommitDto;
import com.example.javastudy.commit.service.CommitService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * packageName    : com.example.javastudy.commit.controller
 * fileName       : CommitController
 * author         : 서채영
 * date           : 2025-03-26
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-26           서채영            최초 생성
 */
@Controller
@RequestMapping("/commit")
@RequiredArgsConstructor
public class CommitController {

    private final CommitService commitService;

    @PostMapping("/list")
    public @ResponseBody AjaxResBody list(@RequestBody CommitDto dto) {
        List<CommitDto> list = commitService.selectCommitList(dto);
        String callback = "fnRefreshList(__DATA__);";
        return AjaxResBody.toResponse(true, "", callback, list);
    }

    @PostMapping("/add")
    public @ResponseBody AjaxResBody add(@RequestBody CommitDto dto) {
        boolean result = false;
        String message = "";
        String callback = "fnGetList();";

        try {
            result = commitService.insertCommit(dto);
            message = "";
            callback = "fnReloadPage();";
        } catch (RuntimeException e) {
            e.printStackTrace();
        }

        return AjaxResBody.toResponse(result, message, callback);
    }
}
