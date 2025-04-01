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
        <li>Add</li>
    </ul>
</div>

<div>
    <form id="saveForm" action="/group/${ info.groupName }/project/${ info.projectName }/branch/add" method="post">
        <table>
            <tr>
                <th>그룹 / 프로젝트</th>
                <td colspan="3">
                    <input type="hidden" name="groupSeq" value="${ info.groupSeq }">
                    <input type="hidden" name="groupName" value="${ info.groupName }">
                    <input type="hidden" name="projectSeq" value="${ info.seq }">
                    <input type="hidden" name="projectName" value="${ info.projectName }">
                    <input type="hidden" name="fromBranchSeq" value="${ fromBranchSeq }">
                    ${ info.groupName } / ${ info.projectName }
                </td>
            </tr>
            <tr>
                <th>브랜치 이름</th>
                <td>
                    <input type="text" name="branchName" placeholder="브랜치 이름">
                </td>
                <th>기본 브랜치 여부</th>
                <td>
                    <label><input type="checkbox" name="isDefault" value="Y"> 기본 브랜치</label>
                </td>
            </tr>
        </table>
        <button type="button" onclick="fnSave()">Save</button>
    </form>
</div>

<script>
    function fnSave() {
        const url = CommonUtils.fnGetFormData('saveForm').getUrl();
        const data = CommonUtils.fnGetFormData('saveForm').getData();
        CommonUtils.fnPost(url, JSON.stringify(data));
    }
</script>