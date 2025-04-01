<%--
  Created by IntelliJ IDEA.
  User: 서채영
  Date: 2025-03-25
  Time: 오후 5:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include/_taglib.jsp" %>

<!-- Title -->
<div class="flex flex-col md:flex-row md:items-center justify-between gap-4 mb-6">
    <div>
        <h1 class="text-2xl font-semibold text-white">Group Information</h1>
    </div>

    <c:if test="${ loginId eq info.groupOwner }">
        <div class="flex gap-3">
            <button class="github-btn-primary flex-1 md:flex-none" onclick="location.href='/group/${info.groupName}/update';">
                Update Group
            </button>
            <button class="github-btn-secondary flex-1 md:flex-none" onclick="fnDelete()">
                Delete Group
            </button>
        </div>
    </c:if>
</div>
<hr class="border-github-border" />

<div class="space-y-4">
    <form id="saveForm" action="/group/${ info.groupName }/delete" method="post">
        <div class="flex flex-wrap gap- md:w-[calc(100%-0.5rem)]4">
            <div class="github-card w-full">
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <div class="flex items-center">Group Name</div>
                        <div class="flex items-center text-white">${ info.groupName }</div>
                    </div>
                </div>
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <div class="flex items-center">Group Description</div>
                        <div class="flex items-center text-white">${ info.groupDescription }</div>
                    </div>
                </div>
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <div class="flex items-center">Visibility</div>
                        <div class="github-radio-group">
                            <label class="github-radio-container">
                                Public repository
                                <input type="radio" name="visibility" value="Public" ${ CommonUtils.checked(info.visibility, "Public") } disabled>
                                <span class="github-radio-checkmark"></span>
                            </label>
                            <label class="github-radio-container">
                                Internal repository
                                <input type="radio" name="visibility" value="Internal" ${ CommonUtils.checked(info.visibility, "Internal") } disabled>
                                <span class="github-radio-checkmark"></span>
                            </label>
                            <label class="github-radio-container">
                                Private repository
                                <input type="radio" name="visibility" value="Private" ${ CommonUtils.checked(info.visibility, "Private") } disabled>
                                <span class="github-radio-checkmark"></span>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<%-- Member List --%>
<div id="member-list" class="space-y-4">
    <div class="flex justify-between items-center">
        <h2 class="text-xl font-semibold text-white">Joined Members</h2>
        <c:if test="${ loginId eq info.groupOwner }">
            <div class="flex gap-3">
                <button type="button" class="github-btn-primary flex-1 md:flex-none" onclick="fnAddMember('${ info.groupName }', '${ info.seq }');">
                    <i data-lucide="plus" class="h-4 w-4 mr-2"></i>
                    Add Member
                </button>
                <button type="button" class="github-btn-secondary flex-1 md:flex-none" onclick="fnDeleteMember('${ info.groupName }');">
                    <i data-lucide="minus" class="h-4 w-4 mr-2"></i>
                    Delete Member
                </button>
            </div>
        </c:if>
        <c:if test="${ loginId ne info.groupOwner }">
            <div class="flex gap-3">
                <button type="button" class="github-btn-secondary flex-1 md:flex-none" onclick="fnJoinMember('${ info.seq }');">
                    <i data-lucide="plus" class="h-4 w-4 mr-2"></i>
                    Join
                </button>
            </div>
        </c:if>
    </div>

    <div class="flex flex-wrap gap-4">
        <c:if test="${ not empty info.memberList }">
            <c:forEach var="item" items="${ info.memberList }">
                <div class="github-card w-full md:w-[calc(50%-0.5rem)]">
                    <div class="flex justify-between items-start mb-2">
                        <div>
                            <div class="flex items-center">
                                <label class="github-checkbox-container mb-2">
                                    <input type="checkbox" data-member-seq="${item.memberSeq}" data-group-seq="${item.groupSeq}">
                                    <span class="github-checkbox-checkmark"></span>
                                    ${ item.memberId }
                                </label>
                            </div>
                            <p class="text-github-text text-sm mt-2">${ item.memberEmail }</p>
                        </div>
                        <span class="text-xs bg-secondary py-0.5 px-1.5 rounded-full">${ item.role }</span>
                    </div>

                    <div class="flex items-center text-xs text-github-text mt-4">
                        <span>Joined at ${ item.createDate }</span>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${ empty info.memberList }">
            <div class="github-card w-full md:w-[calc(50%-0.5rem)]">
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <div class="flex items-center">
                            <i data-lucide="book" class="h-4 w-4 text-github-text mr-2"></i>
                            <a href="#" class="text-github-accent text-lg font-semibold hover:underline">
                                No Member yet
                            </a>
                        </div>
                        <p class="text-github-text text-sm mt-2"></p>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div><!-- Member list -->

<%-- Project List --%>
<div class="space-y-4">
    <div class="flex justify-between items-center">
        <h2 class="text-xl font-semibold text-white">Projects</h2>
        <div class="flex gap-3">
            <button type="button" class="github-btn-secondary flex-1 md:flex-none" onclick="location.href='/group/${info.groupName}/project/add';">
                <i data-lucide="plus" class="h-4 w-4 mr-2"></i>
                Add Project
            </button>
        </div>
    </div>

    <div class="flex flex-wrap gap-4">
        <c:if test="${ not empty info.projectList }">
            <c:forEach var="item" items="${ info.projectList }">
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
        <c:if test="${ empty info.projectList }">
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
</div><!-- Project list -->

<script>
    function fnDelete() {
        const url = CommonUtils.fnGetFormData('saveForm').getUrl();
        const data = CommonUtils.fnGetFormData('saveForm').getData();
        CommonUtils.fnPost(url, JSON.stringify(data));
    }

    function fnAddMember(groupName, groupSeq) {
        location.href = `/group/\${groupName}/add-member?seq=\${groupSeq}`;
    }

    function fnDeleteMember(groupName) {
        const url = `/group/\${groupName}/delete-member`;
        const memberList = $('#member-list input[type=checkbox]:checked')
            .map((i, el) => {
                return {
                    memberSeq: $(el).data('memberSeq'),
                    groupSeq: $(el).data('groupSeq'),
                }
            })
            .get();
        CommonUtils.fnPost(url, JSON.stringify({memberList: memberList,}));
    }

    function fnJoinMember(groupSeq) {
        const url = '/group/join-member';
        const data = {
            groupSeq: groupSeq,
            role: 'Member',
        }
        CommonUtils.fnPost(url, JSON.stringify(data));
    }
</script>