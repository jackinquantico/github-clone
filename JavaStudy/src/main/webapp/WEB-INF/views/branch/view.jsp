<%--
  Created by IntelliJ IDEA.
  User: 서채영
  Date: 2025-03-25
  Time: 오후 5:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include/_taglib.jsp" %>

<div>
    <ul>
        <li>View</li>
    </ul>
</div>

<div>
    <form id="saveForm" action="/group/${ info.groupName }/project/${ info.projectName }/branch/${ info.branchName }/delete" method="post">
        <input type="hidden" name="seq" value="${ info.seq }">
        <table>
            <tr>
                <th>그룹 / 프로젝트</th>
                <td colspan="3">
                    ${ info.groupName } / ${ info.projectName }
                </td>
            </tr>
            <tr>
                <th>브랜치 이름</th>
                <td>${ info.branchName }
                </td>
                <th>기본 브랜치 여부</th>
                <td>
                    <label><input type="checkbox" name="isDefault" value="Y" ${ CommonUtils.checked(info.isDefault, 'Y') } disabled> 기본 브랜치</label>
                </td>
            </tr>
        </table>
        <button type="button" onclick="location.href='/group/${ info.groupName }/project/${ info.projectName }/branch/${ info.branchName }/update';">Update</button>
        <button type="button" onclick="fnDelete()">Delete</button>
        <button type="button" onclick="fnAddBranch('${ info.groupName }', '${ info.projectName }', '${ info.seq }')">New Branch From</button>
        <button type="button" onclick="fnMerge('${ info.groupName }', '${ info.projectName }', '${ info.seq }')">Merge</button>
    </form>
    <table>
        <thead>
        <tr>
            <th>Commit Message</th>
            <th>Commiter</th>
            <th>Commited At</th>
        </tr>
        </thead>
        <tbody id="commit-area">
        <c:if test="${ not empty list }">
            <c:forEach var="item" items="${ list }">
            <tr>
                <td>
                    <input type="hidden" name="commitSeq" value="${ item.seq }">
                    ${ item.commitMessage }
                </td>
                <td>${ item.committerId }</td>
                <td>${ item.commitYmd } ${ item.commitHm }</td>
            </tr>
            </c:forEach>
        </c:if>
        <c:if test="${ empty list }">
        <tr>
            <td colspan="3">아직 커밋이 존재하지 않습니다.</td>
        </tr>
        </c:if>
        </tbody>
    </table>
    <table id="add-commit">
        <tr>
            <th>
                ${ loginId }
                <input type="hidden" name="committerId" value="${ loginId }">
            </th>
            <td>
                <textarea name="commitMessage"></textarea>
            </td>
            <td>
                <button type="button" onclick="fnCommit()">Commit</button>
            </td>
        </tr>
    </table>
</div>

<script>
    $(() => {
        fnGetList();
    })

    function fnGetList() {
        const url = "/commit/list";
        const branchSeq = $('[name=seq]').val();
        fnPost(url, JSON.stringify({
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
                html += `<tr>`
                      +     `<td>`
                      +         `<input type="hidden" name="commitSeq" value="\${el.seq}">`
                      +         `\${el.commitMessage}`
                      +     `</td>`
                      +     `<td>\${el.committerId}</td>`
                      +     `<td>\${el.commitYmd} \${el.commitHm}</td>`
                      + `</tr>`
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
        fnPost(url, JSON.stringify({
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
        const url = fnGetFormData('saveForm').getUrl();
        const data = fnGetFormData('saveForm').getData();
        fnPost(url, JSON.stringify(data));
    }

    /** 브랜치 생성 */
    function fnAddBranch(groupName, projectName, branchSeq) {
        location.href = `/group/\${groupName}/project/\${projectName}/branch/add?branchSeq=\${branchSeq}`;
    }

    /** 브랜치 merge */
    function fnMerge(groupName, projectName, branchSeq) {
        location.href = `/group/\${groupName}/project/\${projectName}/branch/merge?seq=\${branchSeq}`;
    }
</script>