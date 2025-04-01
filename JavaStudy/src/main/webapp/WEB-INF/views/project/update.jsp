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
        <li>Update</li>
    </ul>
</div>

<div>
    <form id="saveForm" action="/group/${ info.groupName }/project/${ info.projectName }/update" method="post">
        <input type="hidden" name="seq" value="${ info.seq }">
        <table>
            <tr>
                <th>프로젝트 그룹</th>
                <td>
                    <select name="groupSeq" onclick="return false;">
                        <option value="${ info.groupSeq }">${ info.groupName }</option>
                    </select>
                </td>
                <th>프로젝트 이름</th>
                <td>
                    <input type="text" name="projectName" value="${ info.projectName }" readonly>
                </td>
            </tr>
            <tr>
                <th>프로젝트 설명</th>
                <td colspan="3">
                    <input type="text" name="description" value="${ info.description }">
                </td>
            </tr>
            <tr>
                <th>공개 범위</th>
                <td colspan="3">
                    <label><input type="radio" name="visibility" value="Private" ${ CommonUtils.checked(info.visibility, "") }> Private</label>
                    <label><input type="radio" name="visibility" value="Internal" ${ CommonUtils.checked(info.visibility, "") }> Internal</label>
                    <label><input type="radio" name="visibility" value="Public" ${ CommonUtils.checked(info.visibility, "") }> Public</label>
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