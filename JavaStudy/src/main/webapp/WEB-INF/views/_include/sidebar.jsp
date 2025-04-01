<%--
  Created by IntelliJ IDEA.
  User: 서채영
  Date: 2025-03-28
  Time: 오후 6:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include/_taglib.jsp" %>

<!-- Sidebar -->
<div class="lg:w-80 w-full order-2 lg:order-1">
    <div class="w-full lg:w-80 py-6 px-3">
        <div class="space-y-8">
            <div>
                <h2 class="text-github-text text-sm font-medium mb-2">Top Repositories</h2>
                <button class="github-btn-secondary w-full flex justify-between items-center">
                    <span>Find a repository...</span>
                </button>
            </div>

            <div>
                <div class="flex justify-between items-center mb-2">
                    <h2 class="text-github-text text-sm font-medium">Recent Repositories</h2>
                </div>

                <div class="space-y-1">
                    <c:if test="${ not empty recentList }">
                        <c:forEach var="item" items="${ recentList }">
                        <div class="p-2 rounded-md hover:bg-secondary transition-colors duration-200">
                            <div class="flex items-start">
                                <div class="flex-shrink-0 mr-2 mt-0.5">
                                    <i data-lucide="book" class="h-4 w-4 text-github-text"></i>
                                </div>
                                <div>
                                    <div class="flex items-center mb-1">
                                        <span class="text-github-accent text-sm font-medium mr-2">${ item.groupName }/${ item.projectName }</span>
                                        <span class="text-xs bg-secondary py-0.5 px-1.5 rounded-full">${ item.visibility }</span>
                                    </div>
                                    <p class="text-github-text text-xs">${ item.lastCommitYmd } ${ item.lastCommitHm }</p>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>

            <div>
                <h2 class="text-github-text text-sm font-medium mb-2">Popular Repositories</h2>
                <div class="space-y-2">
                    <c:if test="${ not empty popularList }">
                        <c:forEach var="item" items="${ popularList }">
                        <div class="p-2 rounded-md hover:bg-secondary transition-colors duration-200">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 mr-2">
                                    <i data-lucide="book" class="h-4 w-4 text-github-text"></i>
                                </div>
                                <span class="text-github-accent text-sm font-medium mr-auto">${ item.groupName }/${ item.projectName }</span>
                                <div class="flex items-center text-xs text-github-text">
                                    <i data-lucide="git-commit" class="h-3 w-3 mr-1"></i>
                                    <span class="mr-2">${ item.commitCount }</span>
                                    <i data-lucide="git-branch" class="h-3 w-3 mr-1"></i>
                                    <span>${ item.branchCount }</span>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>

<%--            <div>--%>
<%--                <h2 class="text-github-text text-sm font-medium mb-2">Recent Activity</h2>--%>
<%--                <div class="github-card">--%>
<%--                    <p class="text-sm text-github-text">--%>
<%--                        When you take actions across GitHub, we'll provide links to that activity here.--%>
<%--                    </p>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
    </div>
</div>