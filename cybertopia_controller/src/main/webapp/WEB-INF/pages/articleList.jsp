<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <title>文章列表</title>
    <script src="<%=basePath%>js/main_js/jquery1.11.3.min.js"></script>
    <script src="<%=basePath%>js/main_js/infinite-scroll.pkgd.min.js"></script>
</head>
<body>
<div class="article-list">
    <div class="article-feed">
    </div>
    <div class="scroller-status">
        <div class="loader-ellips infinite-scroll-request">
            <span class="loader-ellips__dot"></span>
            <span class="loader-ellips__dot"></span>
            <span class="loader-ellips__dot"></span>
            <span class="loader-ellips__dot"></span>
        </div>
        <p class="scroller-status__message infinite-scroll-last">End of content</p>
        <p class="scroller-status__message infinite-scroll-error">No more pages to load</p>
    </div>
    <p class="pagination">
        <a class="pagination__next" href="<%=basePath%>/article/list.do?pageIndex=1">Next page</a>
    </p>
    <script>
        var elem = document.querySelector('.article-feed');
        var infScroll = new InfiniteScroll( elem, {
            path: '.pagination__next',
            append: '.article',
            status: '.scroller-status',
            hideNav: '.pagination',
            prefill: true,
            history: false,
            scrollThreshold: 400
        });
    </script>
</div>

</body>
</html>
