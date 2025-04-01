<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="${_csrf.token}"/>
    <title>2025-Java-Study</title>

    <script src="/js/libs/jquery-3.7.1.min.js"></script>
    <script src="/js/libs/jquery.serialize-object.js"></script>
    <script src="/js/libs/jquery-ui.min.js"></script>
    <script src="/js/libs/sweetalert2.all.min.js"></script>
    <script src="/js/libs/lucide.min.js"></script>

    <%-- Graph --%>
    <script src="https://cdn.jsdelivr.net/npm/mermaid@11.6.0/dist/mermaid.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@gitgraph/js"></script>

    <script src="/js/utils/core.js" type="module"></script>
    <script src="/js/utils/css.js"></script>

    <link href="/css/style.css" rel="stylesheet" type="text/css">
    <script src="https://cdn.jsdelivr.net/npm/lucide-static@latest/icons/github.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/lucide-static@latest/icons/bell.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/lucide-static@latest/icons/plus.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/lucide-static@latest/icons/search.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/lucide-static@latest/icons/menu.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/lucide-static@latest/icons/book.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/lucide-static@latest/icons/star.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/lucide-static@latest/icons/git-branch.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/lucide-static@latest/icons/git-pull-request.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/lucide-static@latest/icons/git-commit.js"></script>
</head>
