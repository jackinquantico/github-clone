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
    <form id="saveForm" action="/group/${ info.groupName }/project/${ info.projectName }/branch/${ info.branchName }/delete" method="post">
        <input type="hidden" name="seq" value="${ info.seq }">
        <table>
            <tr>
                <th>그룹 / 프로젝트</th>
                <td colspan="3">
                    ${ info.groupName } / ${ info.projectName }
                </td>
            </tr>
            <tr>
                <th>브랜치 이름</th>
                <td>${ info.branchName }
                </td>
                <th>기본 브랜치 여부</th>
                <td>
                    <label><input type="checkbox" name="isDefault" value="Y" ${ CommonUtils.checked(info.isDefault, 'Y') } disabled> 기본 브랜치</label>
                </td>
            </tr>
        </table>
        <button type="button" onclick="location.href='/group/${ info.groupName }/project/${ info.projectName }/branch/${ info.branchName }/update';">Update</button>
        <button type="button" onclick="fnDelete()">Delete</button>
    </form>
</div>

<script>
    function fnDelete() {
        const url = fnGetFormData('saveForm').getUrl();
        const data = fnGetFormData('saveForm').getData();
        fnPost(url, JSON.stringify(data));
    }
</script>