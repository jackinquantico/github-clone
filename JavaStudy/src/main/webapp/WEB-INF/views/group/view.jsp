<%--
  Created by IntelliJ IDEA.
  User: 서채영
  Date: 2025-03-25
  Time: 오후 5:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include/_taglib.jsp" %>

<div>
    <ul>
        <li>View</li>
    </ul>
</div>

<div>
    <form id="saveForm" action="/group/${ info.groupName }/delete" method="post">
        <input type="hidden" name="seq" value="${ info.seq }">
        <table>
            <tr>
                <th>그룹 이름</th>
                <td>${ info.groupName }</td>
            </tr>
            <tr>
                <th>프로젝트 설명</th>
                <td>${ info.groupDescription }</td>
            </tr>
            <tr>
                <th>공개 범위</th>
                <td>
                    <label><input type="radio" name="visibility" value="Private" ${ CommonUtils.checked(info.visibility, "Private") } disabled> Private</label>
                    <label><input type="radio" name="visibility" value="Internal" ${ CommonUtils.checked(info.visibility, "Internal") } disabled> Internal</label>
                    <label><input type="radio" name="visibility" value="Public" ${ CommonUtils.checked(info.visibility, "Public") } disabled> Public</label>
                </td>
            </tr>
        </table>
        <c:if test="${ loginId eq info.groupOwner }">
            <button type="button" onclick="location.href='/group/${info.groupName}/update';">Update</button>
            <button type="button" onclick="fnDelete()">Delete</button>
        </c:if>
    </form>
    <table>
        <thead>
        <tr>
            <th></th>
            <th>Member Id</th>
            <th>Member Email</th>
            <th>Role</th>
            <th>Joined At</th>
        </tr>
        </thead>
        <tbody id="member-list">
        <c:if test="${ not empty info.memberList }">
            <c:forEach var="item" items="${ info.memberList }">
            <tr>
                <td>
                    <input type="checkbox" data-member-seq="${item.memberSeq}" data-group-seq="${item.groupSeq}">
                </td>
                <td>${ item.memberId }</td>
                <td>${ item.memberEmail }</td>
                <td>${ item.role }</td>
                <td>${ item.createDate }</td>
            </tr>
            </c:forEach>
        </c:if>
        <c:if test="${ empty info.memberList }">
        <tr>
            <td colspan="4">아직 추가된 회원이 존재하지 않습니다.</td>
        </tr>
        </c:if>
        </tbody>
    </table>
    <c:if test="${ loginId eq info.groupOwner }">
        <button type="button" onclick="fnAddMember('${ info.groupName }', '${ info.seq }');">Add Member</button>
        <button type="button" onclick="fnDeleteMember('${ info.groupName }');">Delete Member</button>
    </c:if>
    <c:if test="${ loginId ne info.groupOwner }">
        <button type="button" onclick="fnJoinMember('${ info.seq }');">Join</button>
    </c:if>
    <table>
        <thead>
        <tr>
            <th>Project Name</th>
            <th>Owner</th>
            <th>Visibility</th>
            <th>Last Commited</th>
            <th>Commit Count</th>
        </tr>
        </thead>
        <tbody class="list-area">
        <c:if test="${ not empty info.projectList }">
            <c:forEach var="item" items="${ info.projectList }">
            <tr data-project-name="${ item.projectName }" data-group-name="${ item.groupName }">
                <td>${ item.projectName }</td>
                <td>${ item.projectOwner }</td>
                <td>${ item.visibility }</td>
                <td>${ item.lastCommitYmd } ${ item.lastCommitHm }</td>
                <td>${ item.commitCount }</td>
            </tr>
            </c:forEach>
        </c:if>
        <c:if test="${ empty info.projectList }">
        <tr>
            <td colspan="4">아직 생성된 프로젝트가 존재하지 않습니다.</td>
        </tr>
        </c:if>
        </tbody>
    </table>
    <button type="button" onclick="location.href='/group/${info.groupName}/project/add';">Add Project</button>
</div>

<script>
    $(() => {
        $('.list-area td').on('click', (event) => {
            const target = $(event.currentTarget).parents('tr');
            const groupName = target.data('groupName');
            const projectName = target.data('projectName');
            location.href = `/group/\${groupName}/project/\${projectName}`;
        })
    });

    function fnDelete() {
        const url = CommonUtils.fnGetFormData('saveForm').getUrl();
        const data = CommonUtils.fnGetFormData('saveForm').getData();
        CommonUtils.fnPost(url, JSON.stringify(data));
    }

    function fnAddMember(groupName, groupSeq) {
        location.href = `/group/\${groupName}/add-member?seq=\${groupSeq}`;
    }

    function fnDeleteMember(groupName) {
        const url = `/group/\${groupName}/delete-member`;
        const memberList = $('#member-list input[type=checkbox]:checked')
            .map((i, el) => {
                return {
                    memberSeq: $(el).data('memberSeq'),
                    groupSeq: $(el).data('groupSeq'),
                }
            })
            .get();
        CommonUtils.fnPost(url, JSON.stringify({memberList: memberList,}));
    }

    function fnJoinMember(groupSeq) {
        const url = '/group/join-member';
        const data = {
            groupSeq: groupSeq,
            role: 'Member',
        }
        CommonUtils.fnPost(url, JSON.stringify(data));
    }
</script>