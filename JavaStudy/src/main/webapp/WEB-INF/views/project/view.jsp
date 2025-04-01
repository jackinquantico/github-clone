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
                <td>${ info.groupName }</td>
                <th>프로젝트 이름</th>
                <td>${ info.projectName }</td>
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
</div>

<script>
    function fnDelete() {
        const url = fnGetFormData('deleteForm').getUrl();
        const data = fnGetFormData('deleteForm').getData();
        fnPost(url, JSON.stringify(data));
    }
</script>