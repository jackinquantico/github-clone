<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include/_taglib.jsp" %>

<div class="header">
    <div>
        <h1>
            <a href="/">2025</a>
        </h1>
    </div>
    <div>
        <c:if test="${ !isAuthenticated }">
            <a href="/auth/login">Login</a>
            <a href="/auth/join">Join</a>
        </c:if>
        <c:if test="${ isAuthenticated }">
            <a href="/member/list">Member</a>
            <a href="/group/list">Group</a>
            <a href="/auth/logout">Logout</a>
        </c:if>
    </div>
</div>
