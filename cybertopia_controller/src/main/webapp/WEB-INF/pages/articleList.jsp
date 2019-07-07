<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en" class="no-js">

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
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/main_css/public.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/main_css/jquery.bxslider.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/main_css/style.css"/>

    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/articles_css/articlesStyle.css"/>

    <script type="text/javascript" src="<%=basePath%>/js/main_js/jquery1.11.3.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main_js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main_js/indexJS.js"></script>

    <script src="<%=basePath%>js/main_js/jquery1.11.3.min.js"></script>
    <script src="<%=basePath%>js/main_js/infinite-scroll.pkgd.min.js"></script>
</head>

<body>
<!--top-->
<div class="top" id="top">
    <div class="wrap clearfloat">
        <div class="nav">
            <ul class="clearfloat">
                <li>
                    <h2><a href="${pageContext.request.contextPath}/main/index.do">首页</a></h2>
                </li>
                <li class="active">
                    <h2><a href="${pageContext.request.contextPath}/article/all.do">竞赛经验文章</a><span class="navBtn"></span></h2>
                    <div class="navDown">
                        <a href="">精选文章</a>
                        <a href="">教师经验</a>
                    </div>
                </li>
                <li>
                    <h2><a href="${pageContext.request.contextPath}/question/all.do">好问</a><span class="navBtn"></span></h2>
                    <div class="navDown">
                        <a href="">精选问题</a>
                        <a href="">热搜问题</a>
                    </div>
                </li>
                <li>
                    <c:choose>
                        <c:when test="${user!=null}">
                            <h2><a href="${pageContext.request.contextPath}/personalCenter/home.do">个人信息</a><span class="navBtn"></span></h2>
                            <div class="navDown">
                                <a href="${pageContext.request.contextPath}/user/toLogin.do">注销</a>
                                <a href="${pageContext.request.contextPath}/personalCenter/home.do">个人信息查看</a>
                            </div>
                        </c:when>
                        <c:when test="${user==null}">
                            <h2><a href="${pageContext.request.contextPath}/user/toLogin.do">个人信息</a><span class="navBtn"></span></h2>
                            <div class="navDown">
                                <a href="${pageContext.request.contextPath}/user/toLogin.do">登录</a>
                                <a href="${pageContext.request.contextPath}/user/toLogin.do">个人信息查看</a>
                            </div>
                        </c:when>
                    </c:choose>
                </li>
                <li>
                    <h2><a href="">关于我们</a><span class="navBtn"></span></h2>
                    <div class="navDown">
                        <a href="${pageContext.request.contextPath}/user/tofeedback.do">问题反馈</a>
                        <a href="${pageContext.request.contextPath}/user/tomodeinformation.do">技术支持404</a>
                    </div>
                </li>
            </ul>
        </div>

        <div class="topRight clearfloat">
            <div class="topLang">
                <span class="topLangBtn"></span>
                <a class="topLangEn" href="">English</a>
                <a class="topLangCh" href="">China</a>
            </div>
            <div class="topSearch">
                <span class="topSearchBtn"></span>
                <div class="topSearchWrap clearfloat">
                    <input type="text" name="" id="" value="请输入检索内容" placeholder=""/>
                    <button></button>
                </div>
            </div>
        </div>

    </div>
    <div class="muen">
        <span class="muenX"></span>
        <span class="muenY"></span>
        <span class="muenZ"></span>
    </div>
</div>
<!--top-->

<!--文章列表-->

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
        <p class="scroller-status__message infinite-scroll-last" style="text-align: center">没有文章了</p>
        <p class="scroller-status__message infinite-scroll-error" style="text-align: center">文章列表加载错误</p>
    </div>
    <p class="pagination">
        <a class="pagination__next" href="<%=basePath%>/article/list.do?pageIndex=0">Next page</a>
    </p>
    <script>
        var elem = document.querySelector('.article-feed');
        var infScroll = new InfiniteScroll( elem, {
            path: '.pagination__next',
            append: '.article_titles',
            status: '.scroller-status',
            hideNav: '.pagination',
            prefill: true,
            history: false,
            scrollThreshold: 400
        });
    </script>
</div>
</body>
