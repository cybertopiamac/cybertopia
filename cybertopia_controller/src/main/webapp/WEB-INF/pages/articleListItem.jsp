<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<body>
<div class="article_title">
    <a href="https://some2501.me">
        <h1>标题是什么，不知道的第${pageIndex}号选手</h1>
        <p><span>张三</span>
            <span class="pub_time">2019年7月3日</span>
            <span class="read_number"> 浏览量:<span>${pageIndex}</span></span>
        </p>
    </a>
</div>
<c:if test="${haveNext == true}">
<p class="pagination">
    <a class="pagination__next" href="<%=basePath%>/article/list.do?pageIndex=${nextIndex}">Next page</a>
</p>
</c:if>
</body>
</html>
