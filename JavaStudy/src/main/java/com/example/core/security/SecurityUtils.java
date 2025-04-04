package com.example.core.security;

import com.example.core.security.impl.UserDetailsImpl;
import com.example.javastudy.member.model.MemberDto;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * packageName    : com.example.core.security
 * fileName       : SecurityUtils
 * author         : 서채영
 * date           : 2025-03-25
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-25           서채영            최초 생성
 */
public class SecurityUtils {

    public static UserDetailsImpl getPrincipal() {
        final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() instanceof UserDetailsImpl) {
            return (UserDetailsImpl) authentication.getPrincipal();
        }
        return null;
    }

    public static boolean isAuthenticated() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication != null && authentication.isAuthenticated()
                && !(authentication.getPrincipal() instanceof String);
    }

    public static class Impl {
        public static MemberDto getMemberDtoInPrinciple() {
            if (SecurityUtils.getPrincipal() != null) {
                return SecurityUtils.getPrincipal().getMemberDto();
            }
            return new MemberDto();
        }

        public static String getMemberSeqInPrinciple() {
            if (SecurityUtils.getPrincipal() != null) {
                return SecurityUtils.getPrincipal().getMemberDto().getSeq();
            }
            return "";
        }

        public static String getMemberIdInPrinciple() {
            if (SecurityUtils.getPrincipal() != null) {
                return SecurityUtils.getPrincipal().getMemberDto().getMemberId();
            }
            return "";
        }
    }
}
