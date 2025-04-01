<%--
  Created by IntelliJ IDEA.
  User: 서채영
  Date: 2025-03-25
  Time: 오후 6:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include/_taglib.jsp" %>

<div>
    <ul>
        <li>Branch List</li>
    </ul>
</div>

<div>
    <table>
        <tr>
            <th>Group Name</th>
            <td>${ info.groupName }</td>
            <th>Project Name</th>
            <td>${ info.projectName }</td>
        </tr>
    </table>
    <table>
        <thead>
        <tr>
            <th>Branch Name</th>
            <th>Last Commit Message</th>
            <th>Last Commited</th>
            <th>Commit Count</th>
        </tr>
        </thead>
        <tbody class="list-area">
        <c:if test="${ not empty list }">
            <c:forEach var="item" items="${ list }">
                <tr data-project-name="${ item.projectName }" data-group-name="${ item.groupName }" data-branch-name="${ item.branchName }">
                    <td>${ item.branchName }</td>
                    <td>${ item.lastCommitMessage }</td>
                    <td>${ item.lastCommitYmd } ${ item.lastCommitHm }</td>
                    <td>${ item.commitCount }</td>
                </tr>
            </c:forEach>
        </c:if>
        <c:if test="${ empty list }">
            <tr>
                <td colspan="4">생성된 브랜치가 없습니다.</td>
            </tr>
        </c:if>
        </tbody>
    </table>
    <button type="button" onclick="location.href='/group/${info.groupName}/project/${info.projectName}/branch/add';">Add</button>
</div>

<script>
    $(() => {
        $('.list-area td').on('click', (event) => {
            const target = $(event.currentTarget).parents('tr');
            const groupName = target.data('groupName');
            const projectName = target.data('projectName');
            const branchName = target.data('branchName');
            location.href = `/group/\${groupName}/project/\${projectName}/branch/\${branchName}`;
        })
    });
</script>