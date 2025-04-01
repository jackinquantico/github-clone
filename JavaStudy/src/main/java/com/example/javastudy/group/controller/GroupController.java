package com.example.javastudy.group.controller;

import com.example.core.cmn.model.AjaxResBody;
import com.example.javastudy.group.model.GroupDto;
import com.example.javastudy.group.model.GroupMemberDto;
import com.example.javastudy.group.service.GroupMemberService;
import com.example.javastudy.group.service.GroupService;
import com.example.javastudy.member.model.MemberDto;
import com.example.javastudy.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * packageName    : com.example.javastudy.group.controller
 * fileName       : GroupController
 * author         : 서채영
 * date           : 2025-03-26
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-26           서채영            최초 생성
 */
@Controller
@RequestMapping("/group")
@RequiredArgsConstructor
public class GroupController {

    private final GroupService groupService;
    private final GroupMemberService groupMemberService;
    private final MemberService memberService;

    @GetMapping({"", "/", "list"})
    public String list(GroupDto dto, Model model) {
        model.addAttribute("list", groupService.selectGroupList(dto));
        return "group/list";
    }

    @GetMapping("/add")
    public String add() {
        return "group/add";
    }

    @PostMapping("/add")
    public @ResponseBody AjaxResBody add(@RequestBody GroupDto dto) {
        boolean result = false;
        String message = "그룹 생성에 실패했습니다.";
        String callback = "";

        try {
            result = groupService.insertGroup(dto);
            message = "그룹을 생성했습니다.";
            callback = "fnRedirectUrl('/group/list')";
        } catch (RuntimeException e) {
            e.printStackTrace();
        }

        return AjaxResBody.toResponse(result, message, callback);
    }

    @GetMapping("/{groupName}")
    public String view(@ModelAttribute GroupDto dto, Model model) {
        model.addAttribute("info", groupService.selectGroup(dto));
        return "group/view";
    }

    @GetMapping("/{groupName}/update")
    public String update(@ModelAttribute GroupDto dto, Model model) {
        model.addAttribute("info", groupService.selectGroup(dto));
        return "group/update";
    }

    @PostMapping("/{groupName}/update")
    public @ResponseBody AjaxResBody update(@RequestBody GroupDto dto) {
        boolean result = false;
        String message = "그룹 수정에 실패했습니다.";
        String callback = "";

        try {
            result = groupService.updateGroup(dto);
            message = "그룹을 수정했습니다.";
            callback = "fnRedirectUrl('/group/" + dto.getGroupName() + "')";
        } catch (RuntimeException e) {
            e.printStackTrace();
        }

        return AjaxResBody.toResponse(result, message, callback);
    }

    @PostMapping("/{groupName}/delete")
    public @ResponseBody AjaxResBody delete(@RequestBody GroupDto dto) {
        boolean result = false;
        String message = "그룹 삭제에 실패했습니다.";
        String callback = "";

        try {
            result = groupService.deleteGroup(dto);
            message = "그룹을 삭제했습니다.";
            callback = "fnRedirectUrl('/group/list')";
        } catch (RuntimeException e) {
            e.printStackTrace();
        }

        return AjaxResBody.toResponse(result, message, callback);
    }

    @PostMapping("/join-member")
    public @ResponseBody AjaxResBody joinMember(@RequestBody GroupMemberDto dto) {
        boolean result = false;
        String message = "그룹 가입에 실패했습니다.";
        String callback = "";

        try {
            result = groupMemberService.insertGroupMember(dto);
            message = "그룹에 가입했습니다.";
            callback = "fnReloadPage()";
        } catch (RuntimeException e) {
            e.printStackTrace();
        }

        return AjaxResBody.toResponse(result, message, callback);
    }

    @GetMapping("/{groupName}/add-member")
    public String addMember(@ModelAttribute GroupDto dto, Model model) {
        String groupSeq = dto.getSeq();
        List<MemberDto> memberList = memberService.selectMemberList(MemberDto.builder().groupSeq(groupSeq).build());
        model.addAttribute("memberList", memberList);
        model.addAttribute("info", dto);
        return "group/add_member";
    }

    @PostMapping("/{groupName}/add-member")
    public @ResponseBody AjaxResBody addMember(@RequestBody GroupDto dto, @PathVariable String groupName) {
        boolean result = false;
        String message = "회원 추가에 실패했습니다.";
        String callback = "";

        try {
            result = groupMemberService.insertGroupMemberList(dto.getMemberList());
            message = "그룹에 회원을 추가했습니다.";
            callback = "fnRedirectUrl('/group/" + groupName + "')";
        } catch (RuntimeException e) {
            e.printStackTrace();
        }

        return AjaxResBody.toResponse(result, message, callback);
    }

    @PostMapping("/{groupName}/delete-member")
    public @ResponseBody AjaxResBody deleteMember(@RequestBody GroupDto dto, @PathVariable String groupName) {
        boolean result = false;
        String message = "회원 추가에 실패했습니다.";
        String callback = "";

        try {
            result = groupMemberService.deleteGroupMemberList(dto.getMemberList());
            message = "그룹에 회원을 추가했습니다.";
            callback = "fnRedirectUrl('/group/" + groupName + "')";
        } catch (RuntimeException e) {
            e.printStackTrace();
        }

        return AjaxResBody.toResponse(result, message, callback);
    }
}
