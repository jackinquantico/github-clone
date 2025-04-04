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
        <h1 class="text-2xl font-semibold text-white">Groups</h1>
        <p class="text-github-text">Let's build something great together</p>
    </div>
</div>

<hr class="border-github-border" />


<!-- Repository list -->
<div class="space-y-4">
    <div class="flex justify-between items-center">
        <h2 class="text-xl font-semibold text-white">All Groups</h2>
        <button class="github-btn-primary flex items-center" onclick="location.href='/group/add';">
            <i data-lucide="book" class="h-4 w-4 mr-2"></i>
            New
        </button>
    </div>

    <div class="flex flex-wrap gap-4">
        <c:if test="${ not empty list }">
            <c:forEach var="item" items="${ list }">
                <div class="github-card w-full md:w-[calc(50%-0.5rem)]">
                    <div class="flex justify-between items-start mb-2">
                        <div>
                            <div class="flex items-center">
                                <i data-lucide="book" class="h-4 w-4 text-github-text mr-2"></i>
                                <a href="/group/${item.groupName}" class="text-github-accent text-lg font-semibold hover:underline">
                                    ${ item.groupName }
                                </a>
                            </div>
                        </div>
                        <span class="text-xs bg-secondary py-0.5 px-1.5 rounded-full">${ item.visibility }</span>
                    </div>

                    <div class="flex items-center text-xs text-github-text mt-4">
                        <span class="inline-block w-3 h-3 rounded-full mr-1" style="background-color: #3178c6"></span>
                        <span class="mr-3">${ item.groupOwner }</span>
                        <a href="#" class="flex items-center mr-3 hover:text-github-accent">
                            <i data-lucide="git-branch" class="h-3 w-3 mr-1"></i>
                            <span>${ item.projectCount }</span>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${ empty list }">
            <div class="github-card w-full md:w-[calc(50%-0.5rem)]">
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <div class="flex items-center">
                            No Group yet
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div>
