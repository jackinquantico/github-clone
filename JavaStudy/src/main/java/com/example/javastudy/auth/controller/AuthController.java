package com.example.javastudy.auth.controller;

import com.example.core.cmn.model.AjaxResBody;
import com.example.javastudy.auth.model.AuthDto;
import com.example.javastudy.auth.service.AuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * packageName    : com.example.javastudy.auth.controller
 * fileName       : AuthController
 * author         : 서채영
 * date           : 2025-03-25
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-25           서채영            최초 생성
 */
@Controller
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    @GetMapping("/join")
    public String join() {
        return "member/add";
    }

    @GetMapping("/login")
    public String loginForm() {
        return "auth/login";
    }

    @PostMapping("/login")
    public @ResponseBody AjaxResBody login(@RequestBody AuthDto authDto) {
        boolean result = false;
        String message = "로그인에 실패했습니다.";
        String callback = "";

        try {
            result = authService.processLogin(authDto);
            message = "로그인되었습니다.";
            callback = "fnRedirectUrl('/')";
        } catch (RuntimeException e) {
            e.printStackTrace();
        }

        return AjaxResBody.toResponse(result, message, callback);
    }

    @GetMapping("/logout")
    public String logout() {
        authService.processLogout();
        return "redirect:/";
    }
}
