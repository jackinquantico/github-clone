package com.example.javastudy.member.service;

import com.example.javastudy.member.model.MemberDto;
import com.example.javastudy.member.model.MemberVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * packageName    : com.example.javastudy.member.mapper
 * fileName       : MemberMapper
 * author         : 서채영
 * date           : 2025-03-25
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-25           서채영            최초 생성
 */
@Mapper
public interface MemberMapper {

    List<MemberDto> selectMemberList(MemberDto memberDto);
    MemberDto selectMember(MemberDto memberDto);

    void insertMember(MemberVo entity);
    void updateMember(MemberVo entity);
    void deleteMember(MemberVo entity);
}
