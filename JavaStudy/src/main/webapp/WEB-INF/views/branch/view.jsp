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
        <h1 class="text-2xl font-semibold text-white">View Branch</h1>
    </div>
    <div class="flex gap-3" style="flex-direction: column; align-items: flex-end;">
        <div>
        <button class="github-btn-primary flex-1 md:flex-none" onclick="location.href='/group/${ info.groupName }/project/${ info.projectName }/branch/${ info.branchName }/update';">
            Update Branch
        </button>
        <button class="github-btn-secondary flex-1 md:flex-none" onclick="fnDelete()">
            Delete Branch
        </button>
        </div>
        <div>
        <button class="github-btn-primary flex-1 md:flex-none" onclick="fnAddBranch('${ info.groupName }', '${ info.projectName }', '${ info.seq }')">
            New Branch From
        </button>
        <button class="github-btn-primary flex-1 md:flex-none" onclick="fnMerge('${ info.groupName }', '${ info.projectName }', '${ info.seq }')">
            Merge Branch
        </button>
        <button class="github-btn-primary flex-1 md:flex-none" onclick="fnRebase('${ info.groupName }', '${ info.projectName }', '${ info.seq }')">
            Rebase Branch
        </button>
        </div>
    </div>
</div>
<hr class="border-github-border" />

<div class="space-y-4">
    <form id="saveForm" action="/group/${ info.groupName }/project/${ info.projectName }/branch/${ info.branchName }/delete" method="post">
        <input type="hidden" name="seq" value="${ info.seq }">
        <div class="flex flex-wrap gap-4 md:w-[calc(100%-0.5rem)]">
            <div class="github-card w-full">
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <div class="flex items-center">Group / Project</div>
                        <div class="flex items-center text-white">
                            ${ info.groupName } / ${ info.projectName }
                        </div>
                    </div>
                </div>
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <div class="flex items-center">Branch Name</div>
                        <div class="flex items-center text-white">
                            ${ info.branchName }
                        </div>
                    </div>
                </div>
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <div class="flex items-center">Default Branch</div>
                        <div class="github-form-group">
                            <label class="github-checkbox-container mb-2">
                                is Default
                                <input type="checkbox" name="isDefault" value="Y" ${ CommonUtils.checked(info.isDefault, 'Y') } disabled>
                                <span class="github-checkbox-checkmark"></span>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<!-- Add commit -->
<div id="add-commit" class="space-y-4">
    <div class="flex flex-wrap gap-4">
        <div class="github-card w-full md:w-[calc(100%-0.5rem)]">
            <div class="flex justify-between items-start mb-2" style="flex-direction: column;">
                <div class="flex items-center">
                    <i data-lucide="git-commit" class="h-4 w-4 text-github-text mr-2"></i>
                    <div class="flex items-center text-white">${ loginId }</div>
                    <input type="hidden" name="committerId" value="${ loginId }">
                </div>
                <div class="github-textarea-container">
                    <textarea name="commitMessage" class="github-textarea" rows="6" placeholder="What changes did you make and why?" maxlength="500"></textarea>
                </div>
            </div>
            <button type="button" class="github-btn-primary flex-1 md:flex-none w-full" onclick="fnCommit();">
                Commit
            </button>
        </div>
    </div>
</div><!-- Add commit -->

<%-- Commits List --%>
<div  class="space-y-4">
    <div id="commit-area" class="flex flex-wrap gap-4">
        <c:if test="${ not empty list }">
            <c:forEach var="item" items="${ list }">
                <div class="github-card w-full md:w-[calc(100%-0.5rem)]">
                    <div class="flex justify-between items-start mb-2">
                        <div>
                            <div class="flex items-center">
                                <i data-lucide="git-commit" class="h-4 w-4 text-github-text mr-2"></i>
                                <input type="hidden" name="commitSeq" value="${ item.seq }">
                                <div class="flex items-center text-white">${ item.commitMessage }</div>
                            </div>
                            <p class="text-github-text text-sm mt-2">
                                ${ item.committerId }
                            </p>
                        </div>
                    </div>

                    <div class="flex items-center text-xs text-github-text mt-4">
                        <span>${ item.commitYmd } ${ item.commitHm }</span>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
</div>

<script>
    $(() => {
        fnGetList();
    })

    function fnGetList() {
        const url = "/commit/list";
        const branchSeq = $('[name=seq]').val();
        CommonUtils.fnPost(url, JSON.stringify({
            branchSeq: branchSeq,
        }));
    }

    function fnRefreshList(data) {
        const tableId = '#commit-area';
        const targetArea = $(tableId);
        const html = _generateList(data);
        targetArea.empty().append(html);

        function _generateList(data) {
            let html = '';
            data.forEach((el, i) => {
                html += `
                <div class="github-card w-full md:w-[calc(100%-0.5rem)]">
                    <div class="flex justify-between items-start mb-2">
                        <div>
                            <div class="flex items-center">
                                <i data-lucide="git-commit" class="h-4 w-4 text-github-text mr-2"></i>
                                <input type="hidden" name="commitSeq" value="\${el.seq}">
                                <div class="flex items-center text-white">\${el.commitMessage}</div>
                            </div>
                            <p class="text-github-text text-sm mt-2">
                                \${el.committerId}
                            </p>
                        </div>
                    </div>

                    <div class="flex items-center text-xs text-github-text mt-4">
                        <span>\${el.commitYmd} \${el.commitHm}</span>
                    </div>
                </div>`;
            });
            return html;
        }
    }

    function fnCommit() {
        const url = '/commit/add';
        const targetArea = $('#add-commit');
        const branchSeq = $('[name=seq]').val();
        const parentCommitSeq = $('#commit-area tr:first').find('[name=commitSeq]');
        const committerId = targetArea.find('[name=committerId]');
        const commitMessage = targetArea.find('[name=commitMessage]');
        CommonUtils.fnPost(url, JSON.stringify({
            branchSeq: branchSeq,
            parentCommitSeq: parentCommitSeq.val(),
            committerId: committerId.val(),
            commitMessage: commitMessage.val(),
        }))
        committerId.val('');
        commitMessage.val('');
    }

    /** 브랜치 삭제 */
    function fnDelete() {
        const url = CommonUtils.fnGetFormData('saveForm').getUrl();
        const data = CommonUtils.fnGetFormData('saveForm').getData();
        CommonUtils.fnPost(url, JSON.stringify(data));
    }

    /** 브랜치 생성 */
    function fnAddBranch(groupName, projectName, branchSeq) {
        location.href = `/group/\${groupName}/project/\${projectName}/branch/add?branchSeq=\${branchSeq}`;
    }

    /** 브랜치 merge */
    function fnMerge(groupName, projectName, branchSeq) {
        location.href = `/group/\${groupName}/project/\${projectName}/branch/merge?seq=\${branchSeq}`;
    }

    /** 브랜치 Rebase */
    function fnRebase(groupName, projectName, branchSeq) {
        location.href = `/group/\${groupName}/project/\${projectName}/branch/rebase?seq=\${branchSeq}`;
    }
</script>