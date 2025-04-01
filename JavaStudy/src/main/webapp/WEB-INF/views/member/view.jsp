<%--
  Created by IntelliJ IDEA.
  User: 서채영
  Date: 2025-04-01
  Time: 오전 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include/_taglib.jsp" %>

<!-- Title -->
<div class="flex flex-col md:flex-row md:items-center justify-between gap-4 mb-6">
    <div>
        <h1 class="text-2xl font-semibold text-white">Member View</h1>
    </div>
    <div class="flex gap-3" style="flex-direction: column; align-items: flex-end;">
        <div>
            <button type="button" class="github-btn-secondary flex-1 md:flex-none" onclick="location.href='/member/list';">
                Back
            </button>
        </div>
    </div>
</div>

<hr class="border-github-border" />

<!-- Contribution graph -->
<div class="space-y-4">
    <div id="contribution-graph" class="github-card overflow-x-auto py-2">
        <h2 class="text-lg font-semibold text-white mb-2">365 contributions in the last year</h2>
        <div>
            <div>
                <div class="mb-1 flex text-xs text-github-text" style="width: 952px; justify-content: space-evenly">
                    <div class="flex-1 text-center" style="margin-left: 1.8rem;">Jan</div>
                    <div class="flex-1 text-center">Feb</div>
                    <div class="flex-1 text-center">Mar</div>
                    <div class="flex-1 text-center">Apr</div>
                    <div class="flex-1 text-center">May</div>
                    <div class="flex-1 text-center">Jun</div>
                    <div class="flex-1 text-center">Jul</div>
                    <div class="flex-1 text-center">Aug</div>
                    <div class="flex-1 text-center">Sep</div>
                    <div class="flex-1 text-center">Oct</div>
                    <div class="flex-1 text-center">Nov</div>
                    <div class="flex-1 text-center">Dec</div>
                </div>
            </div>
            <div class="flex">
                <div class="flex flex-col pr-2 text-xs text-github-text">
                    <div class="h-[11px] flex items-center" style="margin-top: 2px;">Sun</div>
                    <div class="h-[11px] flex items-center" style="margin-top: 5px;"></div>
                    <div class="h-[11px] flex items-center" style="margin-top: 5px;">Tue</div>
                    <div class="h-[11px] flex items-center" style="margin-top: 5px;"></div>
                    <div class="h-[11px] flex items-center" style="margin-top: 5px;">Thu</div>
                    <div class="h-[11px] flex items-center" style="margin-top: 5px;"></div>
                    <div class="h-[11px] flex items-center" style="margin-top: 5px;">Sat</div>
                </div>

                <div class="relative flex contribution-graph">
                    <c:if test="${ not empty list }">
                        <c:forEach var="item" items="${ list }" varStatus="varStatus">
                            <c:if test="${ varStatus.index % 7 eq 0 }">
                                <div class="flex flex-col">
                            </c:if>
                            <div class="contribution-cell ${ CommonUtils.getGraphLevel(item.commitCount) }"></div>
                            <c:if test="${ varStatus.index % 7 eq 6 }">
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>

    </div>
    <div class="flex items-center mt-2 text-xs text-github-text">
        <span class="mr-2">Less</span>
        <div class="flex">
            <div class="contribution-cell level0"></div>
            <div class="contribution-cell level1"></div>
            <div class="contribution-cell level2"></div>
            <div class="contribution-cell level3"></div>
            <div class="contribution-cell level4"></div>
        </div>
        <span class="ml-2">More</span>
</div>
</div>

<div class="space-y-4">
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
            </div>x
        </div>
    </div>
</div>

<script>
    $(() => {
        $('#contribution-graph').scrollLeft($('#contribution-graph')[0].scrollWidth);
    })
</script>