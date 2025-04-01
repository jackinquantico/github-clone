<%--
  Created by IntelliJ IDEA.
  User: 서채영
  Date: 2025-03-25
  Time: 오전 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include/_taglib.jsp" %>

<!-- Title -->
<div class="flex flex-col md:flex-row md:items-center justify-between gap-4 mb-6">
    <div>
        <h1 class="text-2xl font-semibold text-white">Welcome to GitHub</h1>
        <p class="text-github-text">Let's build something great together</p>
    </div>
    <div class="flex gap-3">
        <button class="github-btn-primary flex-1 md:flex-none" onclick="location.href='/group/add';">
            Start a new Group
        </button>
        <button class="github-btn-secondary flex-1 md:flex-none">
            Explore repositories
        </button>
    </div>
</div>

<hr class="border-github-border" />

<!-- Repository list -->
<div class="space-y-4">
    <div class="flex justify-between items-center">
        <h2 class="text-xl font-semibold text-white">Popular Repositories</h2>
        <button class="github-btn-primary flex items-center">
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
                                <a href="/group/${item.groupName}/project/${item.projectName}" class="text-github-accent text-lg font-semibold hover:underline">
                                    ${ item.groupName }/${ item.projectName }
                                </a>
                            </div>
                            <p class="text-github-text text-sm mt-2">${ item.description }</p>
                        </div>
                        <span class="text-xs bg-secondary py-0.5 px-1.5 rounded-full">${ item.visibility }</span>
                    </div>

                    <div class="flex items-center text-xs text-github-text mt-4">
                        <span class="inline-block w-3 h-3 rounded-full mr-1" style="background-color: #3178c6"></span>
                        <span class="mr-3">${ item.projectOwner }</span>
                        <a href="#" class="flex items-center mr-3 hover:text-github-accent">
                            <i data-lucide="git-branch" class="h-3 w-3 mr-1"></i>
                            <span>${ item.commitCount }</span>
                        </a>
                        <span>${ item.lastCommitYmd } ${ item.lastCommitHm }</span>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${ empty list }">
            <div class="github-card w-full md:w-[calc(50%-0.5rem)]">
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <div class="flex items-center">
                            <i data-lucide="book" class="h-4 w-4 text-github-text mr-2"></i>
                            <a href="#" class="text-github-accent text-lg font-semibold hover:underline">
                                No project yet
                            </a>
                        </div>
                        <p class="text-github-text text-sm mt-2"></p>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div><!-- Repository list -->

<script>
    $(() => {
        $('.list-area td').on('click', (event) => {
            const target = $(event.currentTarget).parents('tr');
            const groupName = target.data('groupName');
            const projectName = target.data('projectName');
            location.href = ``;
        })
    });
</script>