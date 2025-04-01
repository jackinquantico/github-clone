<%--
  Created by IntelliJ IDEA.
  User: 서채영
  Date: 2025-03-25
  Time: 오후 4:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                <input type="text" name="memberId">
            </td>
        </tr>
        <tr>
            <th>PWD</th>
            <td>
                <input type="text" name="memberPassword">
            </td>
        </tr>
    </table>
    <button type="button" onclick="fnLogin();">Login</button>
    </form>
</div>

<script>
    function fnLogin() {
        const url = fnGetFormData('loginForm').getUrl();
        const data = fnGetFormData('loginForm').getData();
        fnPost(url, JSON.stringify(data));
    }
</script>