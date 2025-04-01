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
        <h1 class="text-2xl font-semibold text-white">Project Information</h1>
    </div>

    <c:if test="${ loginId eq info.projectOwner }">
        <div class="flex gap-3">
            <button class="github-btn-primary flex-1 md:flex-none" onclick="location.href='/group/${info.groupName}/project/${info.projectName}/update';">
                Update Project
            </button>
            <button class="github-btn-secondary flex-1 md:flex-none" onclick="fnDelete()">
                Delete Project
            </button>
        </div>
    </c:if>
</div>
<hr class="border-github-border" />

<div class="space-y-4">
    <form id="deleteForm" action="/group/${ info.groupName }/project/${ info.projectName }/delete" method="post">
        <input type="hidden" name="seq" value="${ info.seq }">
        <div class="flex flex-wrap gap-4 md:w-[calc(100%-0.5rem)]">
            <div class="github-card w-full">
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <div class="flex items-center">Group Name</div>
                        <div class="flex items-center text-white">
                            <input type="hidden" name="groupName" value="${ info.groupName }">
                            ${ info.groupName }
                        </div>
                    </div>
                </div>
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <div class="flex items-center">Project Name</div>
                        <div class="flex items-center text-white">
                            <input type="hidden" name="projectName" value="${ info.projectName }">
                            ${ info.projectName }
                        </div>
                    </div>
                </div>
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <div class="flex items-center">Project Description</div>
                        <div class="flex items-center text-white">
                            ${ info.description }
                        </div>
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

<div class="space-y-4">
    <div class="flex justify-between items-center">
        <h2 class="text-xl font-semibold text-white">Git Graph</h2>
    </div>
    <div class="flex flex-wrap gap-4">
        <div class="github-card w-full md:w-[calc(100%-0.5rem)]" style="height: 400px; overflow: auto;">
            <div id="gitGraph" style="transform: scale(0.7); transform-origin: top left;"></div>
        </div>
    </div>

    <%-- Mermaid.js Git Graph --%>
<%--    <div class="flex flex-wrap gap-4">--%>
<%--        <div class="github-card w-full md:w-[calc(100%-0.5rem)]">--%>
<%--            <pre class="mermaid"></pre>--%>
<%--        </div>--%>
<%--    </div>--%>
</div>

<%-- Branch List --%>
<div id="member-list" class="space-y-4">
    <div class="flex justify-between items-center">
        <h2 class="text-xl font-semibold text-white">Branches</h2>
        <div class="flex gap-3">
            <button type="button" class="github-btn-primary flex-1 md:flex-none" onclick="location.href='/group/${info.groupName}/project/${info.projectName}/branch/add';">
                <i data-lucide="plus" class="h-4 w-4 mr-2"></i>
                Create Branch
            </button>
        </div>
    </div>

    <div class="flex flex-wrap gap-4">
        <c:if test="${ not empty list }">
            <c:forEach var="item" items="${ list }">
                <div class="github-card w-full md:w-[calc(${ list.size() gt 1 ? 50 : 100 }%-0.5rem)]">
                    <div class="flex justify-between items-start mb-2">
                        <div>
                            <div class="flex items-center">
                                <c:if test="${ item.isDefault eq 'Y'}">
                                    <i data-lucide="check" class="h-4 w-4 text-github-text mr-2"></i>
                                </c:if>
                                <c:if test="${ item.isDefault ne 'Y'}">
                                    <i data-lucide="git-branch" class="h-4 w-4 text-github-text mr-2"></i>
                                </c:if>
                                <a href="/group/${item.groupName}/project/${item.projectName}/branch/${item.branchName}" class="text-github-accent text-lg font-semibold hover:underline">
                                    ${ item.groupName }/${ item.projectName }/${ item.branchName }
                                </a>
                            </div>
                            <p class="text-github-text text-sm mt-2">
                                ${ item.lastCommitMessage }
                            </p>
                        </div>
                    </div>

                    <div class="flex items-center text-xs text-github-text mt-4">
                        <a href="#" class="flex items-center mr-3 hover:text-github-accent">
                            <i data-lucide="git-commit" class="h-3 w-3 mr-1"></i>
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
                                No branch yet
                            </a>
                        </div>
                        <p class="text-github-text text-sm mt-2"></p>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div>

<script>
    $(() => {
        fnGenerateGraphByMermaid();
        fnGenerateGraphByGitGraph();
    });

    function fnDelete() {
        const url = CommonUtils.fnGetFormData('deleteForm').getUrl();
        const data = CommonUtils.fnGetFormData('deleteForm').getData();
        CommonUtils.fnPost(url, JSON.stringify(data));
    }

    function fnGenerateGraphByMermaid() {
        const groupName = $('[name=groupName]').val();
        const projectName = $('[name=projectName]').val();
        const url = `/group/\${groupName}/project/\${projectName}/commit-graph/mermaid`;
        const data = {
            groupName: groupName,
            projectName: projectName,
        }
        window.CallbackMap['fnDrawGraphByMermaid'] = fnDrawGraphByMermaid;
        CommonUtils.fnPost(url, JSON.stringify(data));
    }

    function fnDrawGraphByMermaid(data) {
        $('.mermaid').text(data)
        mermaid.init(undefined, ".mermaid");
    }

    function fnGenerateGraphByGitGraph() {
        const groupName = $('[name=groupName]').val();
        const projectName = $('[name=projectName]').val();
        const url = `/group/\${groupName}/project/\${projectName}/commit-graph/gitgraph`;
        const data = {
            groupName: groupName,
            projectName: projectName,
        }
        window.CallbackMap['fnDrawGraphByGirGraph'] = fnDrawGraphByGirGraph;
        CommonUtils.fnPost(url, JSON.stringify(data));
    }

    function fnDrawGraphByGirGraph(commitList) {
        GitGraphBuilder.draw({
            divId: "gitGraph",
            commitList: commitList,
            defaultBranch: "main",
            options: {
                orientation: "vertical-reverse",
                displayHash: false,
                displayAuthor: false,
                displayBranchLabel: true,
            }
        });
    }
</script>