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
<c:forEach var="question_title" items="${question_titles}" varStatus="status">
    <div class="article_title">
        <a href="<%=basePath%>question/detail.do?questionId=${question_title.id}">
            <h1>${question_title.title}</h1>
            <p><span>${question_title.authorName}</span>
                <span class="pub_time">${question_title.date}</span>
                <span class="read_number">
                    浏览量:<span>${question_title.browseNum}</span>
                </span>
            </p>
        </a>
    </div>
</c:forEach>
</div>
<c:if test="${haveNext == true}">
    <p class="pagination">
        <a class="pagination__next" href="<%=basePath%>question/list.do?pageIndex=${pageIndex+1}">下一页</a>
    </p>
</c:if>
</body>
</html>
