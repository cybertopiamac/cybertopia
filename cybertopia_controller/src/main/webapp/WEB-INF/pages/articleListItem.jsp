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
<div class="article_titles">
<c:forEach var="article_title" items="${article_titles}" varStatus="status">
    <div class="article_title">
        <a href="<%=basePath%>/article/detail.do?articleId=${article_title.id}">
            <h1>${article_title.title}</h1>
            <p><span>${article_title.authorName}</span>
                <span class="pub_time">${article_title.date}</span>
                <span class="read_number">
                    浏览量:<span>${article_title.browseNum}</span>
                </span>
            </p>
        </a>
    </div>
</c:forEach>
</div>
<c:if test="${haveNext == true}">
    <p class="pagination">
        <c:if test="${not empty keyword}">
            <a class="pagination__next" href="<%=basePath%>/article/search.do?keyword=${keyword}&pageIndex=${pageIndex+1}">下一页</a>
        </c:if>
        <c:if test="${empty keyword}">
            <a class="pagination__next" href="<%=basePath%>/article/list.do?pageIndex=${pageIndex+1}">下一页</a>
        </c:if>
    </p>
</c:if>
</body>
</html>
