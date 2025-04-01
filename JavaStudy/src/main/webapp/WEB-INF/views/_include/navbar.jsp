<%--
  Created by IntelliJ IDEA.
  User: 서채영
  Date: 2025-03-28
  Time: 오후 6:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include/_taglib.jsp" %>

<nav class="bg-github-dark border-b border-github-border sticky top-0 z-50">
    <div class="max-w-[1280px] mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">
            <!-- Left section -->
            <div class="flex items-center">
                <a href="/">
                    <i data-lucide="git-pull-request" class="h-8 w-8 text-white"></i>
                </a>

                <!-- Desktop Navigation -->
                <div class="hidden md:ml-6 md:flex md:space-x-4">
                    <div class="github-input-container">
                        <input class="github-input w-64" placeholder="Search or jump to..." type="text">
                        <i data-lucide="search" class="h-4 w-4 ml-0"></i>
                    </div>
                    <a href="/group/list" class="text-github-text hover:text-white px-3 py-2 text-sm font-medium">
                        <i data-lucide="book" class="h-4 w-4"></i>
                        Group
                    </a>
                    <a href="/member/list" class="text-github-text hover:text-white px-3 py-2 text-sm font-medium">
                        <i data-lucide="user-search" class="h-4 w-4"></i>
                        Member
                    </a>
<%--                    <a href="#" class="text-github-text hover:text-white px-3 py-2 text-sm font-medium">--%>
<%--                        Marketplace--%>
<%--                    </a>--%>
<%--                    <a href="#" class="text-github-text hover:text-white px-3 py-2 text-sm font-medium">--%>
<%--                        Explore--%>
<%--                    </a>--%>
                </div>
            </div>

            <!-- Right section -->
            <div class="flex items-center">
                <div class="hidden md:flex md:items-center md:space-x-3 gap-3">
                    <i data-lucide="bell" class="h-5 w-5 text-github-text hover:text-white cursor-pointer"></i>

                    <div class="dropdown">
                        <i data-lucide="plus" class="h-5 w-5 text-github-text hover:text-white cursor-pointer"></i>
                        <div class="dropdown-content bg-github-dark border-github-border">
                            <c:if test="${ !isAuthenticated }">
                                <a href="/auth/login">Login</a>
                                <a href="/auth/join">Join</a>
                            </c:if>
                            <c:if test="${ isAuthenticated }">
                                <a href="/member/list">Member</a>
                                <a href="/group/list">Group</a>
                                <a href="/auth/logout">Logout</a>
                            </c:if>
                        </div>
                    </div>

                    <div class="h-6 w-6 rounded-full overflow-hidden">
                        <i data-lucide="user" class="h-5 w-5 text-github-text text-white cursor-pointer"></i>
                    </div>
                </div>

                <!-- Mobile menu button -->
<%--                <div class="md:hidden flex items-center">--%>
<%--                    <button id="mobile-menu-button" class="inline-flex items-center justify-center p-2 rounded-md text-github-text hover:text-white">--%>
<%--                        <i data-lucide="menu" class="h-6 w-6"></i>--%>
<%--                    </button>--%>
<%--                </div>--%>
            </div>
        </div>
    </div>

    <!-- Mobile menu -->
<%--    <div id="mobile-menu" class="md:hidden hidden p-2 border-t border-github-border">--%>
<%--        <div class="px-2 pt-2 pb-3 space-y-1">--%>
<%--            <div class="github-input-container w-full mb-2">--%>
<%--                <input class="github-input w-full" placeholder="Search or jump to..." type="text">--%>
<%--                <i data-lucide="search" class="h-4 w-4"></i>--%>
<%--            </div>--%>
<%--            <a href="#" class="text-github-text hover:text-white block px-3 py-2 text-base font-medium">--%>
<%--                Pull requests--%>
<%--            </a>--%>
<%--            <a href="#" class="text-github-text hover:text-white block px-3 py-2 text-base font-medium">--%>
<%--                Issues--%>
<%--            </a>--%>
<%--            <a href="#" class="text-github-text hover:text-white block px-3 py-2 text-base font-medium">--%>
<%--                Marketplace--%>
<%--            </a>--%>
<%--            <a href="#" class="text-github-text hover:text-white block px-3 py-2 text-base font-medium">--%>
<%--                Explore--%>
<%--            </a>--%>
<%--        </div>--%>
<%--    </div>--%>
</nav>
