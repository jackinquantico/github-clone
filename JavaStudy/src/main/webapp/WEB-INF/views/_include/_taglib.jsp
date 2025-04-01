<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page import="com.example.core.utils.*" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="requestUri"  value="${requestScope.get('javax.servlet.forward.request_uri')}"/>

<c:set var="isAuthenticated" value="false"/>
<sec:authorize access="isAuthenticated()">
    <c:set var="isAuthenticated" value="true"/>
</sec:authorize>

<sec:authentication property="principal" var="principal"/>
<c:if test="${isAuthenticated and !empty principal and principal.memberDto != null}">
    <c:set var="loginId" value="${CommonUtils.defaultString(principal.memberDto.memberId)}"/>
    <c:set var="loginName" value="${CommonUtils.defaultString(principal.memberDto.memberName)}"/>
</c:if>
