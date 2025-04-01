package com.example.javastudy.group.service;

import com.example.javastudy.group.model.GroupMemberDto;
import com.example.javastudy.group.model.GroupMemberVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * packageName    : com.example.javastudy.group.service
 * fileName       : GroupMemberMapper
 * author         : 서채영
 * date           : 2025-03-26
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-26           서채영            최초 생성
 */
@Mapper
public interface GroupMemberMapper {
    List<GroupMemberDto> selectGroupMemberList(GroupMemberDto groupMemberDto);
    GroupMemberDto selectGroupMember(GroupMemberDto groupMemberDto);

    void insertGroupMember(GroupMemberVo entity);
    void updateGroupMember(GroupMemberVo entity);
    void deleteGroupMember(GroupMemberVo entity);
}
