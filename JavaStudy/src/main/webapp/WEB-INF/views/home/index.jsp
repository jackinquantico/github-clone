<%--
  Created by IntelliJ IDEA.
  User: 서채영
  Date: 2025-03-25
  Time: 오전 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include/_taglib.jsp" %>

<div>
    <h2>main</h2>
</div>

<div>
    <table>
        <thead>
        <tr>
            <th>Group</th>
            <th>Project Name</th>
            <th>Owner</th>
            <th>Visibility</th>
            <th>Last Commited</th>
            <th>Commit Count</th>
        </tr>
        </thead>
        <tbody class="list-area">
        <c:if test="${ not empty list }">
            <c:forEach var="item" items="${ list }">
                <tr data-project-name="${ item.projectName }" data-group-name="${ item.groupName }">
                    <td>${ item.groupName }</td>
                    <td>${ item.projectName }</td>
                    <td>${ item.projectOwner }</td>
                    <td>${ item.visibility }</td>
                    <td>${ item.lastCommitYmd } ${ item.lastCommitHm }</td>
                    <td>${ item.commitCount }</td>
                </tr>
            </c:forEach>
        </c:if>
        <c:if test="${ empty list }">
            <tr>
                <td colspan="6">생성된 프로젝트가 없습니다.</td>
            </tr>
        </c:if>
        </tbody>
    </table>
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
</script>