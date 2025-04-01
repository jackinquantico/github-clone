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
        <h1 class="text-2xl font-semibold text-white">Create a new Branch</h1>
    </div>
</div>
<hr class="border-github-border" />

<div class="space-y-4">
    <form id="saveForm" action="/group/${ info.groupName }/project/${ info.projectName }/branch/add" method="post">
        <div class="flex flex-wrap gap-4 w-80">
            <div class="github-card w-full">
                <div class="flex justify-between items-start mb-2 ">
                    <div>
                        <div class="flex items-center">Group / Project</div>
                        <input type="hidden" name="groupSeq" value="${ info.groupSeq }">
                        <input type="hidden" name="groupName" value="${ info.groupName }">
                        <input type="hidden" name="projectSeq" value="${ info.seq }">
                        <input type="hidden" name="projectName" value="${ info.projectName }">
                        <input type="hidden" name="fromBranchSeq" value="${ fromBranchSeq }">
                        <div class="flex items-center text-white">
                            ${ info.groupName } / ${ info.projectName }
                        </div>
                    </div>
                </div>
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <div class="flex items-center">Branch Name</div>
                        <input type="text"  name="branchName" class="github-input w-64">
                    </div>
                </div>
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <div class="flex items-center">Default Branch</div>
                        <div class="github-form-group">
                            <label class="github-checkbox-container mb-2">
                                is Default
                                <input type="checkbox" name="isDefault" value="Y">
                                <span class="github-checkbox-checkmark"></span>
                            </label>
                        </div>
                    </div>
                </div>
                <button type="button" class="github-btn-primary flex-1 md:flex-none w-full" onclick="fnSave();">
                    Create Branch
                </button>
            </div>
        </div>
    </form>
</div>

<script>
    function fnSave() {
        const url = CommonUtils.fnGetFormData('saveForm').getUrl();
        const data = CommonUtils.fnGetFormData('saveForm').getData();
        CommonUtils.fnPost(url, JSON.stringify(data));
    }
</script>