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
        <h1 class="text-2xl font-semibold text-white">Update Member</h1>
    </div>
</div>

<hr class="border-github-border" />

<div class="space-y-4">
    <form id="saveForm" action="/member/update" method="post">
        <div class="flex flex-wrap gap-4">
            <div class="github-card w-full">
                <div class="flex justify-between items-start mb-2">
                    <div class="w-full">
                        <div class="flex items-center">Username or ID</div>
                        <input type="text" name="memberId" class="github-input w-64" value="${ info.memberId }">
                    </div>
                </div>
                <div class="flex justify-between items-start mb-2">
                    <div class="w-full">
                        <div class="flex items-center">Name</div>
                        <input type="text" name="memberName" class="github-input w-64" value="${ info.memberName }">
                    </div>
                </div>
                <div class="flex justify-between items-start mb-2">
                    <div class="w-full">
                        <div class="flex items-center">Email</div>
                        <input type="text" name="memberEmail" class="github-input w-64" value="${ info.memberEmail }">
                    </div>
                </div>
                <div class="flex justify-between items-start mb-4">
                    <div class="w-full">
                        <div class="flex items-center">Password</div>
                        <input type="password" name="memberPassword" class="github-input w-64">
                    </div>
                </div>
                <div class="flex gap-3">
                    <button type="button" class="github-btn-secondary flex-2" onclick="history.back();">
                        Back
                    </button>
                    <button type="button" class="github-btn-primary flex-1" onclick="fnSave();">
                        Update
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>

<script>
    function fnSave() {
        const url = CommonUtils.fnGetFormData('saveForm').getUrl();
        const data = CommonUtils.fnGetFormData('saveForm').getData();
        CommonUtils.fnPost(url, JSON.stringify(data));
    }
</script>