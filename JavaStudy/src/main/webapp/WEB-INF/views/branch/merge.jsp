<%--
  Created by IntelliJ IDEA.
  User: 서채영
  Date: 2025-03-27
  Time: 오후 3:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include/_taglib.jsp" %>

<!-- Title -->
<div class="flex flex-col md:flex-row md:items-center justify-between gap-4 mb-6">
    <div>
        <h1 class="text-2xl font-semibold text-white">Merge Branch</h1>
    </div>
</div>
<hr class="border-github-border" />

<div class="space-y-4">
    <form id="saveForm" action="/group/${ info.groupName }/project/${ info.projectName }/branch/merge" method="post">
        <div class="flex flex-wrap gap-4">
            <div class="github-card w-full">
                <div class="flex justify-between items-start mb-2">
                    <div class="w-full">
                        <div class="flex items-center">Group / Project</div>
                        <div class="flex items-center text-white">
                            ${ info.groupName } / ${ info.projectName }
                        </div>
                    </div>
                </div>
                <div class="flex justify-between items-start mb-2">
                    <div class="w-full">
                        <div class="flex items-center">Current Branch</div>
                        <input type="hidden" name="fromBranchSeq" value="${ info.seq }">
                        <input type="hidden" name="fromBranchName" value="${ info.branchName }">
                        <input type="hidden" name="lastCommitSeq" value="${ info.lastCommitSeq }">
                        ${ info.branchName }
                    </div>
                </div>
                <div class="flex justify-between items-start mb-2">
                    <div class="w-full">
                        <div class="flex items-center">Current Branch</div>
                        <div class="github-select-container">
                            <select name="seq" class="github-select">
                                <option value="">:: 선택 ::</option>
                                <c:forEach var="item" items="${ list }">
                                    <option value="${ item.seq }" data-last-commit-seq="${ item.lastCommitSeq }" data-branch-name="${ item.branchName }">${ item.branchName }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <button type="button" class="github-btn-primary flex-1 md:flex-none w-full" onclick="fnMerge();">
                    Merge Branch
                </button>
            </div>
        </div>
    </form>
</div>

<script>
    function fnMerge() {
        const url = CommonUtils.fnGetFormData('saveForm').getUrl();
        const data = CommonUtils.fnGetFormData('saveForm').getData();
        if (data.fromBranchSeq === data.seq) {
            alert('타겟 브랜치는 현재 브랜치가 될 수 없습니다.');
            return false;
        }
        data.fromBranchLastCommitSeq = $('select[name=seq] option:selected').data('lastCommitSeq');
        data.branchName = $('select[name=seq] option:selected').data('branchName');
        CommonUtils.fnPost(url, JSON.stringify(data));
    }
</script>