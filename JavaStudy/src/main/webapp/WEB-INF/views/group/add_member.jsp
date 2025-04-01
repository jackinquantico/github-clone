<%--
  Created by IntelliJ IDEA.
  User: 서채영
  Date: 2025-03-26
  Time: 오후 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include/_taglib.jsp" %>

<!-- Title -->
<div class="flex flex-col md:flex-row md:items-center justify-between gap-4 mb-6">
    <div>
        <h1 class="text-2xl font-semibold text-white">Add Group Members</h1>
    </div>
</div>
<hr class="border-github-border" />


<!-- Members list -->
<div id="member-list" class="space-y-4">
    <div class="flex flex-wrap gap-4">
        <c:if test="${ not empty memberList }">
            <c:forEach var="item" items="${ memberList }">
                <div class="github-card w-full md:w-[calc(100%-0.5rem)]">
                    <div class="flex justify-between items-start mb-2">
                        <div>
                            <div class="flex items-center">
                                <label class="github-checkbox-container mb-2">
                                    <input type="checkbox" data-member-seq="${ item.seq }" data-group-seq="${ info.seq }">
                                    <span class="github-checkbox-checkmark"></span>
                                    ${ item.memberId }
                                </label>
                            </div>
                            <p class="text-github-text text-sm mt-2">${ item.memberEmail }</p>
                        </div>
                        <span class="text-xs bg-secondary py-0.5 px-1.5 rounded-full">${ item.memberName }</span>
                    </div>

                    <div class="flex items-center text-xs text-github-text mt-4">
                        <span>Joined at ${ item.createDate }</span>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${ empty memberList }">
            <div class="github-card w-full md:w-[calc(100%-0.5rem)]">
                Unable to Add New Members
            </div>
        </c:if>
        <button type="button" class="github-btn-primary flex-1 md:flex-none w-full" onclick="fnSave();">
            Add Members
        </button>
    </div>
</div><!-- Member list -->

<script>
    function fnSave() {
        const url = CommonUtils.fnGetFormData('saveForm').getUrl();
        const memberList = $('#member-list input[type=checkbox]:checked')
            .map((i, el) => {
                return {
                    memberSeq: $(el).data('memberSeq'),
                    groupSeq: $(el).data('groupSeq'),
                    role: 'Member',
                }
            })
            .get();

        if (memberList.length === 0) {
            return false;
        }

        CommonUtils.fnPost(url, JSON.stringify({memberList:memberList,}));
    }
</script>
