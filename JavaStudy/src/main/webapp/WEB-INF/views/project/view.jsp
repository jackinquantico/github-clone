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
    <form id="deleteForm" action="/group/${ info.groupName }/project/${ info.projectName }/delete" method="post">
        <input type="hidden" name="seq" value="${ info.seq }">
        <table>
            <tr>
                <th>프로젝트 그룹</th>
                <td>
                    <input type="hidden" name="groupName" value="${ info.groupName }">
                    ${ info.groupName }
                </td>
                <th>프로젝트 이름</th>
                <td>
                    <input type="hidden" name="projectName" value="${ info.projectName }">
                    ${ info.projectName }
                </td>
            </tr>
            <tr>
                <th>프로젝트 설명</th>
                <td colspan="3">${ info.description }</td>
            </tr>
            <tr>
                <th>공개 범위</th>
                <td colspan="3">
                    <label><input type="radio" name="visibility" value="Private" ${ CommonUtils.checked(info.visibility, 'Private') } disabled> Private</label>
                    <label><input type="radio" name="visibility" value="Internal" ${ CommonUtils.checked(info.visibility, 'Internal') } disabled> Internal</label>
                    <label><input type="radio" name="visibility" value="Public" ${ CommonUtils.checked(info.visibility, 'Public') } disabled> Public</label>
                </td>
            </tr>
        </table>
        <button type="button" onclick="location.href='/group/${info.groupName}/project/${info.projectName}/update';">Update</button>
        <button type="button" onclick="fnDelete()">Delete</button>
    </form>
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
    <button type="button" onclick="location.href='/group/${info.groupName}/project/${info.projectName}/branch/add';">Create Branch</button>
</div>

<pre class="mermaid">
gitGraph TB:
   commit id: "init"
   branch feature
   checkout feature
   commit id: "feat1"
</pre>

<script>
    $(() => {
        $('.list-area td').on('click', (event) => {
            const target = $(event.currentTarget).parents('tr');
            const groupName = target.data('groupName');
            const projectName = target.data('projectName');
            const branchName = target.data('branchName');
            location.href = `/group/\${groupName}/project/\${projectName}/branch/\${branchName}`;
        })

        fnGenerateGraph();
    });

    function fnDelete() {
        const url = fnGetFormData('deleteForm').getUrl();
        const data = fnGetFormData('deleteForm').getData();
        fnPost(url, JSON.stringify(data));
    }

    function fnGenerateGraph() {
        const groupName = $('[name=groupName]').val();
        const projectName = $('[name=projectName]').val();
        const url = `/group/\${groupName}/project/\${projectName}/commit-graph`;
        const data = {
            groupName: groupName,
            projectName: projectName,
        }
        fnPost(url, JSON.stringify(data));
    }

    function fnDrawGraph(data) {
        $('.mermaid').text(data)
        console.log(data)
        mermaid.init(undefined, ".mermaid");
    }
</script>