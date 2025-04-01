<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html lang="ko">
<tiles:insertAttribute name="common-head" />

<body>
<tiles:insertAttribute name="header" />
<div id="container">
    <tiles:insertAttribute name="contents" />
</div>
</body>

<tiles:insertAttribute name="footer" />
</html>
