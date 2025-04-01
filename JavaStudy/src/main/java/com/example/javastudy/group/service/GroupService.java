package com.example.javastudy.group.service;

import com.example.core.security.SecurityUtils;
import com.example.javastudy.group.model.GroupDto;
import com.example.javastudy.group.model.GroupMemberDto;
import com.example.javastudy.project.model.ProjectDto;
import com.example.javastudy.project.service.ProjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * packageName    : com.example.javastudy.group.service
 * fileName       : GroupService
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
public class GroupService {

    private final GroupMapper groupMapper;
    private final GroupMemberService groupMemberService;
    private final ProjectService projectService;

    public List<GroupDto> selectGroupList(GroupDto dto) {
        dto.setGroupOwner(SecurityUtils.Impl.getMemberIdInPrinciple());
        return groupMapper.selectGroupList(dto);
    }

    public GroupDto selectGroup(GroupDto dto) {
        GroupDto info = groupMapper.selectGroup(dto);
        info.setMemberList(groupMemberService.selectGroupMemberList(GroupMemberDto.builder().groupSeq(info.getSeq()).build()));
        info.setProjectList(projectService.selectProjectList(ProjectDto.builder().groupSeq(info.getSeq()).build()));
        return info;
    }

    public boolean insertGroup(GroupDto dto) {
        dto.generateSeq();
        dto.setGroupOwner(SecurityUtils.Impl.getMemberIdInPrinciple());
        groupMapper.insertGroup(dto.toEntity());

        GroupMemberDto groupMemberDto = GroupMemberDto.builder()
                .groupSeq(dto.getSeq())
                .memberSeq(SecurityUtils.Impl.getMemberSeqInPrinciple())
                .role("Owner")
                .build();
        groupMemberService.insertGroupMember(groupMemberDto);

        return true;
    }

    public boolean updateGroup(GroupDto dto) {
        groupMapper.updateGroup(dto.toEntity());
        return true;
    }

    public boolean deleteGroup(GroupDto dto) {
        groupMapper.deleteGroup(dto.toEntity());
        return true;
    }
}
