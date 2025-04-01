<%--
  Created by IntelliJ IDEA.
  User: 서채영
  Date: 2025-03-25
  Time: 오후 4:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include/_taglib.jsp" %>

<c:set var="loginId" value="admin" />
<c:set var="loginPwd" value="1234" />

<div>
    <ul>
        <li>Login</li>
    </ul>
</div>

<div>
    <form id="loginForm" action="/auth/login" method="post">
    <table>
        <tr>
            <th>ID</th>
            <td>
                <input type="text" name="memberId" value="${ loginId }">
            </td>
        </tr>
        <tr>
            <th>PWD</th>
            <td>
                <input type="text" name="memberPassword" value="${ loginPwd }">
            </td>
        </tr>
    </table>
    <button type="button" onclick="fnLogin();">Login</button>
    </form>
</div>

<script>
    function fnLogin() {
        const url = CommonUtils.fnGetFormData('loginForm').getUrl();
        const data = CommonUtils.fnGetFormData('loginForm').getData();
        CommonUtils.fnPost(url, JSON.stringify(data));
    }
</script>