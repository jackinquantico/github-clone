package com.example.javastudy.auth.service;

import com.example.core.utils.CommonUtils;
import com.example.javastudy.auth.model.AuthDto;
import com.example.javastudy.member.model.MemberDto;
import com.example.javastudy.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.parameters.P;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

/**
 * packageName    : com.example.javastudy.auth.service
 * fileName       : AuthService
 * author         : 서채영
 * date           : 2025-03-25
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-25           서채영            최초 생성
 */
@Service
@RequiredArgsConstructor
public class AuthService {

    private final MemberService memberService;
    private final PasswordEncoder passwordEncoder;

    public boolean processLogin(AuthDto authDto) {
        MemberDto memberDto = memberService.selectMemberById(authDto.getMemberId());
        if (memberDto == null) return false;
        if (!isMatchPassword(authDto.getMemberPassword(), memberDto.getMemberPassword())) return false;

        HttpSession session = CommonUtils.getSession();
        session.setAttribute("loginMember", memberDto);
        return true;
    }

    public void processLogout() {
        HttpSession session = CommonUtils.getSession();
        session.invalidate();
    }

    private boolean isMatchPassword(String rawPwd, String encodedPwd) {
        return passwordEncoder.matches(rawPwd, encodedPwd);
    }
}
