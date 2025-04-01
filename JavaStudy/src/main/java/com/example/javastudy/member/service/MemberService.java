package com.example.javastudy.member.service;

import com.example.javastudy.member.model.MemberDto;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * packageName    : com.example.javastudy.member.service
 * fileName       : MemberService
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
public class MemberService {
    public final MemberMapper memberMapper;
    public final PasswordEncoder passwordEncoder;

    public List<MemberDto> selectMemberList(MemberDto memberDto) {
        return memberMapper.selectMemberList(memberDto);
    }

    public MemberDto selectMember(MemberDto memberDto) {
        return memberMapper.selectMember(memberDto);
    }

    public MemberDto selectMember(String seq) {
        MemberDto memberDto = MemberDto.builder().seq(seq).build();
        return selectMember(memberDto);
    }

    public boolean insertMember(MemberDto memberDto) {
        memberDto.generateSeq();
        memberDto.setMemberPassword(passwordEncoder.encode(memberDto.getMemberPassword()));
        memberMapper.insertMember(memberDto.toEntity());
        return true;
    }

    public boolean updateMember(MemberDto memberDto) {
        if (StringUtils.isNotBlank(memberDto.getMemberPassword())) {
            memberDto.setMemberPassword(passwordEncoder.encode(memberDto.getMemberPassword()));
        }
        memberMapper.updateMember(memberDto.toEntity());
        return true;
    }

    public boolean deleteMember(MemberDto memberDto) {
        memberMapper.deleteMember(memberDto.toEntity());
        return true;
    }
}
