<%--
  Created by IntelliJ IDEA.
  User: 서채영
  Date: 2025-03-26
  Time: 오후 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include/_taglib.jsp" %>

<div>
    <ul>
        <li>Add Member</li>
    </ul>
</div>

<div>
    <form id="saveForm" action="/group/${ info.groupName }/add-member" method="post">
        <table>
            <thead>
            <tr>
                <th></th>
                <th>Id</th>
                <th>Name</th>
                <th>Email</th>
            </tr>
            </thead>
            <tbody id="member-list">
            <c:if test="${ not empty memberList }">
                <c:forEach var="item" items="${ memberList }">
                <tr>
                    <td>
                        <input type="checkbox" data-member-seq="${ item.seq }" data-group-seq="${ info.seq }">
                    </td>
                    <td>${ item.memberId }</td>
                    <td>${ item.memberName }</td>
                    <td>${ item.memberEmail }</td>
                </tr>
                </c:forEach>
            </c:if>
            <c:if test="${ empty memberList }">
                <tr>
                    <td colspan="4">추가할 수 있는 회원이 존재하지 않습니다.</td>
                </tr>
            </c:if>
            </tbody>
        </table>
        <button type="button" onclick="fnSave()">Add Member</button>
    </form>
</div>

<script>
    function fnSave() {
        const url = fnGetFormData('saveForm').getUrl();
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

        fnPost(url, JSON.stringify({memberList:memberList,}));
    }
</script>
