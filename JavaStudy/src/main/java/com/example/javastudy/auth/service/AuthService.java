package com.example.javastudy.auth.service;

import com.example.core.utils.CommonUtils;
import com.example.javastudy.auth.model.AuthDto;
import com.example.javastudy.member.model.MemberDto;
import com.example.javastudy.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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

    private final AuthenticationManager authenticationManager;
    private final PasswordEncoder passwordEncoder;

    public boolean processLogin(AuthDto authDto) {
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(authDto.getMemberId(), authDto.getMemberPassword());
        Authentication auth = authenticationManager.authenticate(token);
        SecurityContextHolder.getContext().setAuthentication(auth);
        return true;
    }

    public void processLogout() {
        HttpSession session = CommonUtils.getSession();
        session.invalidate();
    }
}
