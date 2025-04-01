package com.example.javastudy.group.service;

import com.example.core.security.SecurityUtils;
import com.example.javastudy.group.model.GroupMemberDto;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * packageName    : com.example.javastudy.group.service
 * fileName       : GroupMemberService
 * author         : 서채영
 * date           : 2025-03-26
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-26           서채영            최초 생성
 */
@Service
@RequiredArgsConstructor
public class GroupMemberService {
    private final GroupMemberMapper groupMemberMapper;

    public List<GroupMemberDto> selectGroupMemberList(GroupMemberDto groupMemberDto) {
        return groupMemberMapper.selectGroupMemberList(groupMemberDto);
    }

    public GroupMemberDto selectGroupMember(GroupMemberDto groupMemberDto) {
        return groupMemberMapper.selectGroupMember(groupMemberDto);
    }

    public boolean insertGroupMember(GroupMemberDto dto) {
        if (StringUtils.isBlank(dto.getMemberSeq())) {
            dto.setMemberSeq(SecurityUtils.Impl.getMemberSeqInPrinciple());
        }
        groupMemberMapper.insertGroupMember(dto.toEntity());
        return true;
    }

    public boolean insertGroupMemberList(List<GroupMemberDto> memberList) {
        if (CollectionUtils.isEmpty(memberList)) return false;
        memberList.forEach(this::insertGroupMember);
        return true;
    }

    public boolean updateGroupMember(GroupMemberDto dto) {
        groupMemberMapper.updateGroupMember(dto.toEntity());
        return true;
    }

    public boolean deleteGroupMember(GroupMemberDto dto) {
        groupMemberMapper.deleteGroupMember(dto.toEntity());
        return true;
    }

    public boolean deleteGroupMemberList(List<GroupMemberDto> memberList) {
        if (CollectionUtils.isEmpty(memberList)) return false;
        memberList.forEach(this::deleteGroupMember);
        return true;
    }
}
