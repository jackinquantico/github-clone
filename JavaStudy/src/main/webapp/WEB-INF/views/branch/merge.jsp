<%--
  Created by IntelliJ IDEA.
  User: 서채영
  Date: 2025-03-27
  Time: 오후 3:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include/_taglib.jsp" %>

<div>
    <ul>
        <li>Merge</li>
    </ul>
</div>

<div>
    <form id="saveForm" action="/group/${ info.groupName }/project/${ info.projectName }/branch/merge" method="post">
        <table>
            <tr>
                <th>그룹 / 프로젝트</th>
                <td colspan="3">
                    ${ info.groupName } / ${ info.projectName }
                </td>
            </tr>
            <tr>
                <th>현재 브랜치</th>
                <td>
                    <input type="hidden" name="fromBranchSeq" value="${ info.seq }">
                    <input type="hidden" name="fromBranchName" value="${ info.branchName }">
                    <input type="hidden" name="lastCommitSeq" value="${ info.lastCommitSeq }">
                    ${ info.branchName }
                </td>
                <th>타겟 브랜치</th>
                <td>
                    <select name="seq">
                        <option value="">:: 선택 ::</option>
                        <c:forEach var="item" items="${ list }">
                            <option value="${ item.seq }" data-last-commit-seq="${ item.lastCommitSeq }" data-branch-name="${ item.branchName }">${ item.branchName }</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
        </table>
        <button type="button" onclick="fnMerge();">Merge</button>
    </form>
</div>

<script>
    function fnMerge() {
        const url = fnGetFormData('saveForm').getUrl();
        const data = fnGetFormData('saveForm').getData();
        if (data.fromBranchSeq === data.seq) {
            alert('타겟 브랜치는 현재 브랜치가 될 수 없습니다.');
            return false;
        }
        data.fromBranchLastCommitSeq = $('select[name=seq] option:selected').data('lastCommitSeq');
        data.branchName = $('select[name=seq] option:selected').data('branchName');
        fnPost(url, JSON.stringify(data));
    }
</script>