package com.example.javastudy.member.controller;

import com.example.core.cmn.model.AjaxResBody;
import com.example.javastudy.member.model.MemberDto;
import com.example.javastudy.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * packageName    : com.example.javastudy.member.controller
 * fileName       : MemberController
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
@RequestMapping("/member")
public class MemberController {
    private final MemberService memberService;

    @GetMapping("/list")
    public String list(@ModelAttribute MemberDto memberDto, Model model) {
        model.addAttribute("list", memberService.selectMemberList(memberDto));
        return "member/list";
    }

    @GetMapping("/add")
    public String addForm() {
        return "auth/add";
    }

    @PostMapping("/add")
    public @ResponseBody AjaxResBody add(@RequestBody MemberDto memberDto) {
        boolean result = false;
        String message = "비정상 처리되었습니다.";
        String callback = "";

        try {
            result = memberService.insertMember(memberDto);
            message = "정상 처리되었습니다.";
            callback = "fnRedirectUrl('/member/list')";
        } catch (Exception e) {
            e.printStackTrace();
        }

        return AjaxResBody.toResponse(result, message, callback);
    }

    @GetMapping("/update/{seq}")
    public String updateForm(@ModelAttribute MemberDto memberDto, Model model) {
        model.addAttribute("info", memberService.selectMember(memberDto));
        return "member/update";
    }

    @PostMapping("/update")
    public @ResponseBody AjaxResBody update(@RequestBody MemberDto memberDto) {
        boolean result = false;
        String message = "비정상 처리되었습니다.";
        String callback = "";

        try {
            result = memberService.updateMember(memberDto);
            message = "정상 처리되었습니다.";
            callback = "fnRedirectUrl('/member/list')";
        } catch (Exception e) {
            e.printStackTrace();
        }

        return AjaxResBody.toResponse(result, message, callback);
    }

    @PostMapping("/delete")
    public @ResponseBody AjaxResBody delete(@RequestBody MemberDto memberDto) {
        boolean result = false;
        String message = "비정상 처리되었습니다.";
        String callback = "";

        try {
            result = memberService.deleteMember(memberDto);
            message = "정상 처리되었습니다.";
            callback = "fnReloadPage()";
        } catch (Exception e) {
            e.printStackTrace();
        }

        return AjaxResBody.toResponse(result, message, callback);
    }
}
