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
    <form id="saveForm" action="/group/${ groupName }/project/add" method="post">
        <table>
            <tr>
                <th>프로젝트 그룹</th>
                <td>
                    <select name="groupSeq">
                        <option value="">:: 선택하세요 ::</option>
                        <c:forEach var="item" items="${ groupList }">
                            <option value="${ item.seq }" data-group-name="${ item.groupName }" ${ CommonUtils.selected(item.groupName, groupName) }>${ item.groupName }</option>
                        </c:forEach>
                    </select>
                </td>
                <th>프로젝트 이름</th>
                <td>
                    <input type="text" name="projectName" placeholder="영문, - 만 사용 가능">
                </td>
            </tr>
            <tr>
                <th>프로젝트 설명</th>
                <td colspan="3">
                    <input type="text" name="description" placeholder="프로젝트 설명">
                </td>
            </tr>
            <tr>
                <th>공개 범위</th>
                <td colspan="3">
                    <label><input type="radio" name="visibility" value="Private"> Private</label>
                    <label><input type="radio" name="visibility" value="Internal"> Internal</label>
                    <label><input type="radio" name="visibility" value="Public"> Public</label>
                </td>
            </tr>
        </table>
        <button type="button" onclick="fnSave()">Save</button>
    </form>
</div>

<script>
    function fnSave() {
        const url = fnGetFormData('saveForm').getUrl();
        const data = fnGetFormData('saveForm').getData();
        data.groupName = $('select[name=groupSeq] option:selected').data('groupName');
        fnPost(url, JSON.stringify(data));
    }
</script>