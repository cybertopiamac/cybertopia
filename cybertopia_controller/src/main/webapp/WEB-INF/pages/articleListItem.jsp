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
<a class=article style="display: block; padding:1em; margin:2em; box-shadow: 0 0 10px #ccc;"
   href="https:some2501.me">
    <h1>标题是什么，不知道的第${pageIndex}号选手</h1>
</a>
<c:if test="${haveNext == true}">
<p class="pagination">
    <a class="pagination__next" href="<%=basePath%>/article/list.do?pageIndex=${nextIndex}">Next page</a>
</p>
</c:if>
</body>
</html>
