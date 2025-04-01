<%--
  Created by IntelliJ IDEA.
  User: 서채영
  Date: 2025-03-25
  Time: 오후 2:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include/_taglib.jsp" %>

<!-- Title -->
<div class="flex flex-col md:flex-row md:items-center justify-between gap-4 mb-6">
    <div>
        <h1 class="text-2xl font-semibold text-white">Add Member to GitHub</h1>
    </div>
</div>

<hr class="border-github-border" />

<div class="space-y-4">
    <form id="addForm" action="/member/add" method="post">
        <div class="flex flex-wrap gap-4">
            <div class="github-card w-full">
                <div class="flex justify-between items-start mb-2">
                    <div class="w-full">
                        <div class="flex items-center">Username or ID</div>
                        <input type="text" name="memberId" class="github-input w-64">
                    </div>
                </div>
                <div class="flex justify-between items-start mb-2">
                    <div class="w-full">
                        <div class="flex items-center">Name</div>
                        <input type="text" name="memberName" class="github-input w-64">
                    </div>
                </div>
                <div class="flex justify-between items-start mb-2">
                    <div class="w-full">
                        <div class="flex items-center">Email</div>
                        <input type="text" name="memberEmail" class="github-input w-64">
                    </div>
                </div>
                <div class="flex justify-between items-start mb-4">
                    <div class="w-full">
                        <div class="flex items-center">Password</div>
                        <input type="password" name="memberPassword" class="github-input w-64">
                    </div>
                </div>
                <button type="button" class="github-btn-primary flex-1 md:flex-none w-full" onclick="fnSave();">
                    Add Member
                </button>
            </div>
        </div>
    </form>
</div>

<script>
    function fnSave() {
        const url = CommonUtils.fnGetFormData('addForm').getUrl();
        const data = CommonUtils.fnGetFormData('addForm').getData();
        CommonUtils.fnPost(url, JSON.stringify(data));
    }
</script>