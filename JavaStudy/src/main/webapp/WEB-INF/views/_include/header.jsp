<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include/_taglib.jsp" %>

<div class="header">
    <div>
        <h1>2025</h1>
    </div>
    <div>
        <c:if test="${ empty loginMember }">
            <a href="/login">로그인</a>
            <a href="/auth/join">회원가입</a>
        </c:if>
        <c:if test="${ not empty loginMember }">
            <a href="/logout">로그아웃</a>
        </c:if>
    </div>
</div>
