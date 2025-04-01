function draw({
                  divId,
                  commitList,
                  defaultBranch = "main",
                  options = {}
              }) {
    const template = GitgraphJS.templateExtend(GitgraphJS.TemplateName[options.templateName || "Metro"], {
        commit: {
            message: {
                displayHash: options.displayHash ?? false,
                displayAuthor: options.displayAuthor ?? false,
            },
        },
        branch: {
            label: options.displayBranchLabel ?? true,
        }
    });

    const canvas = document.getElementById(divId);
    const gitgraph = GitgraphJS.createGitgraph(canvas, {
        orientation: options.orientation || "vertical-reverse",
        template: template,
    });

    const branchMap = {};
    branchMap[defaultBranch] = gitgraph.branch(defaultBranch);

    commitList.forEach(commit => {
        const branchName = commit.branchName;
        const parentCommitSeq = commit.parentCommitSeq;

        if (!branchMap[branchName]) {
            const parentBranchName = _findParentBranch(commitList, parentCommitSeq);
            if (parentBranchName && branchMap[parentBranchName]) {
                branchMap[branchName] = branchMap[parentBranchName].branch(branchName);
            } else {
                branchMap[branchName] = gitgraph.branch(branchName);
            }
        }

        branchMap[branchName].commit({
            subject: commit.commitMessage,
            tag: commit.rebaseOriginSeq ? "rebase" : (commit.mergeFromCommitSeq ? "merge" : undefined),
        });

        if (commit.mergeFromCommitSeq) {
            const mergeBranchName = _findParentBranch(commitList, commit.mergeFromCommitSeq);
            if (mergeBranchName && branchMap[mergeBranchName]) {
                branchMap[branchName].merge(branchMap[mergeBranchName]);
            }
        }
    });

    function _findParentBranch(commitList, parentSeq) {
        const parentCommit = commitList.find(c => c.seq === parentSeq);
        return parentCommit ? parentCommit.branchName : null;
    }
}

export {
    draw,
}