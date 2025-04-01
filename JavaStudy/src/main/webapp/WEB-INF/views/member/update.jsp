<%--
  Created by IntelliJ IDEA.
  User: 서채영
  Date: 2025-03-25
  Time: 오후 2:01
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
    <form action="/member/update" method="post">
        <table>
            <tr>
                <th>ID</th>
                <td>
                    <input type="text" name="memberId" value="${ info.memberId }" placeholder="ID">
                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td>
                    <input type="text" name="memberName" value="${ info.memberName }" placeholder="이름">
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="text" name="memberEmail" value="${ info.memberEmail }" placeholder="이메일">
                </td>
            </tr>
            <tr>
                <th>PWD</th>
                <td>
                    <input type="password" name="memberPassword" placeholder="PWD">
                </td>
            </tr>
        </table>
        <button type="button" onclick="fnSave();">Save</button>
    </form>
</div>

<script>
    function fnSave() {
        const url = fnGetFormData().getUrl();
        const data = fnGetFormData().getData();
        fnPost(url, JSON.stringify(data));
    }
</script>