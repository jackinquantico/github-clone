<%--
  Created by IntelliJ IDEA.
  User: 서채영
  Date: 2025-03-25
  Time: 오후 6:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include/_taglib.jsp" %>

<!-- Title -->
<div class="flex flex-col md:flex-row md:items-center justify-between gap-4 mb-6">
    <div>
        <h1 class="text-2xl font-semibold text-white">Members</h1>
        <p class="text-github-text">Let's build something great together</p>
    </div>
</div>

<hr class="border-github-border" />


<!-- Repository list -->
<div id="memberTable" class="space-y-4">
    <div class="flex justify-between items-center">
        <h2 class="text-xl font-semibold text-white">All Members</h2>
        <div class="flex gap-3">
            <button class="github-btn-primary flex items-center" onclick="location.href='/member/add';">
                <i data-lucide="user-round-plus" class="h-4 w-4 mr-2"></i>
                New Member
            </button>
            <button class="github-btn-secondary flex items-center" onclick="fnUpdate();">
                <i data-lucide="user-round-pen" class="h-4 w-4 mr-2"></i>
                Update
            </button>
            <button class="github-btn-secondary flex items-center" onclick="fnDelete();">
                <i data-lucide="user-round-minus" class="h-4 w-4 mr-2"></i>
                Delete
            </button>
        </div>
    </div>

    <div class="flex flex-wrap gap-4">
        <c:if test="${ not empty list }">
            <c:forEach var="item" items="${ list }">
                <div class="github-card w-full md:w-[calc(50%-0.5rem)]">
                    <div class="flex justify-between items-start mb-2">
                        <div>
                            <div class="flex items-center">
                                <label class="github-checkbox-container mb-2">
                                    <input type="checkbox" data-seq="${ item.seq }">
                                    <span class="github-checkbox-checkmark"></span>
                                </label>
                                <div class="flex items-center text-white">
                                    ${ item.memberId } <span class="text-github-text">(${ item.memberEmail })</span>
                                </div>
                            </div>
                        </div>
                        <span class="text-xs bg-secondary py-0.5 px-1.5 rounded-full">${ item.memberName }</span>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${ empty list }">
            <div class="github-card w-full md:w-[calc(50%-0.5rem)]">
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <div class="flex items-center">
                            No Member yet
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div>

<script>
    function fnUpdate() {
        const selected = $('#memberTable input[type=checkbox]:checked');
        const seq = selected.data('seq');
        CommonUtils.fnRedirectUrl(`/member/update/\${seq}`);
    }

    function fnDelete() {
        const url = '/member/delete';
        const selected = $('#memberTable input[type=checkbox]:checked');
        const seq = selected.data('seq');
        const data = {
            seq: seq,
        }
        CommonUtils.fnPost(url, JSON.stringify(data));
    }
</script>