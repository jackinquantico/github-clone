<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html lang="ko">
<tiles:insertAttribute name="common-head" />

<body class="bg-github-dark text-github-text">
<tiles:insertAttribute name="navbar" />
<div class="min-h-screen flex flex-col">
    <div class="flex-1 max-w-[1280px] mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex flex-col lg:flex-row py-8 gap-8">
            <tiles:insertAttribute name="sidebar" />

            <div class="flex-1 order-1 lg:order-2 space-y-8" style="min-width: 450px;">
                <tiles:insertAttribute name="contents" />
            </div>
        </div>
    </div>
    <tiles:insertAttribute name="footer" />
</div>
</body>

</html>
