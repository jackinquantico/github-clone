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
        <h1 class="text-2xl font-semibold text-white">Create a new Project</h1>
    </div>
</div>
<hr class="border-github-border" />

<div class="space-y-4">
    <form id="saveForm" action="/group/${ groupName }/project/add" method="post">
        <div class="flex flex-wrap gap-4 md:w-[calc(100%-0.5rem)]">
            <div class="github-card w-full">
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <div class="flex items-center">Group Name</div>
                        <div class="github-select-container">
                            <select name="groupSeq" class="github-select">
                                <option value="">:: 선택하세요 ::</option>
                                <c:forEach var="item" items="${ groupList }">
                                    <option value="${ item.seq }" data-group-name="${ item.groupName }" ${ CommonUtils.selected(item.groupName, groupName) }>${ item.groupName }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <div class="flex items-center">Project Name</div>
                        <input type="text"  name="projectName" class="github-input w-64">
                    </div>
                </div>
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <div class="flex items-center">Project Description</div>
                        <input type="text"  name="description" class="github-input w-64">
                    </div>
                </div>
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <div class="flex items-center">Visibility</div>
                        <div class="github-radio-group">
                            <label class="github-radio-container">
                                Public repository
                                <input type="radio" name="visibility" value="Public" checked>
                                <span class="github-radio-checkmark"></span>
                            </label>
                            <label class="github-radio-container">
                                Internal repository
                                <input type="radio" name="visibility" value="Internal">
                                <span class="github-radio-checkmark"></span>
                            </label>
                            <label class="github-radio-container">
                                Private repository
                                <input type="radio" name="visibility" value="Private">
                                <span class="github-radio-checkmark"></span>
                            </label>
                        </div>
                    </div>
                </div>
                <button type="button" class="github-btn-primary flex-1 md:flex-none w-full" onclick="fnSave();">
                    Create Group
                </button>
            </div>
        </div>
    </form>
</div>

<script>
    function fnSave() {
        const url = CommonUtils.fnGetFormData('saveForm').getUrl();
        const data = CommonUtils.fnGetFormData('saveForm').getData();
        data.groupName = $('select[name=groupSeq] option:selected').data('groupName');
        CommonUtils.fnPost(url, JSON.stringify(data));
    }
</script>