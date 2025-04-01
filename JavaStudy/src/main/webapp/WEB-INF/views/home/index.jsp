<%--
  Created by IntelliJ IDEA.
  User: 서채영
  Date: 2025-03-25
  Time: 오전 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include/_taglib.jsp" %>

<div>
    <h2>main</h2>
</div>

<div>
    <table>
        <thead>
        <tr>
            <th></th>
            <th>ID</th>
            <th>이름</th>
            <th>이메일</th>
        </tr>
        </thead>
        <tbody id="memberTable">
        <c:if test="${ not empty list }">
        <c:forEach var="item" items="${ list }">
            <tr>
                <td>
                    <input type="checkbox" data-seq="${ item.seq }">
                </td>
                <td>${ item.memberId }</td>
                <td>${ item.memberName }</td>
                <td>${ item.memberEmail }</td>
            </tr>
        </c:forEach>
        </c:if>
        <c:if test="${ empty list }">
            <tr>
                <td colspan="4">아직 가입한 회원이 없습니다.</td>
            </tr>
        </c:if>
        </tbody>
    </table>
    <button type="button" onclick="location.href='/member/add';">회원 추가</button>
    <button type="button" onclick="fnUpdate();">회원 수정</button>
    <button type="button" onclick="fnDelete();">회원 삭제</button>
</div>

<script>
    function fnUpdate() {
        const selected = $('#memberTable input[type=checkbox]:checked');
        const seq = selected.data('seq');
        fnRedirectUrl(`/member/update/\${seq}`);
    }

    function fnDelete() {
        const url = '/member/delete';
        const selected = $('#memberTable input[type=checkbox]:checked');
        const seq = selected.data('seq');
        const data = {
            seq: seq,
        }
        fnPost(url, JSON.stringify(data));
    }
</script>