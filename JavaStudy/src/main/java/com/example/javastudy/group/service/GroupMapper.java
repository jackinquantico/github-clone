package com.example.javastudy.group.service;

import com.example.javastudy.group.model.GroupDto;
import com.example.javastudy.group.model.GroupVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * packageName    : com.example.javastudy.group.service
 * fileName       : GroupMapper
 * author         : 서채영
 * date           : 2025-03-26
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-26           서채영            최초 생성
 */
@Mapper
public interface GroupMapper {
    List<GroupDto> selectGroupList(GroupDto dto);
    GroupDto selectGroup(GroupDto dto);

    void insertGroup(GroupVo entity);
    void updateGroup(GroupVo entity);
    void deleteGroup(GroupVo entity);
}
