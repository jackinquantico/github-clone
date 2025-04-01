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
            <a href="/auth/login">로그인</a>
            <a href="/auth/join">회원가입</a>
        </c:if>
        <c:if test="${ isAuthenticated }">
            <a href="/auth/logout">로그아웃</a>
        </c:if>
    </div>
</div>
