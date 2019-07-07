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
    <title>问题列表</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/main_css/public.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/main_css/jquery.bxslider.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/main_css/style.css"/>

    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/articles_css/articlesStyle.css"/>

    <script type="text/javascript" src="<%=basePath%>/js/main_js/jquery1.11.3.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main_js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main_js/indexJS.js"></script>

    <script src="<%=basePath%>js/main_js/jquery1.11.3.min.js"></script>
    <script src="<%=basePath%>js/main_js/infinite-scroll.pkgd.min.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            $("#input_key").focus(setDefault('#input_key'));
        });

        function isSearch(){
            //获取输入内容
            var input=$('#input_key').val();
            if (input == "" && $.trim(input).length == 0) {
                $('#input_key').css('color', 'red').val("搜索内容不能为空");
                return false;
            }
            else{
                console.log(input);
                return true;
            }
        }
        function setDefault(input_id) {
            return function () {
                var color = $(input_id).css('color');
                if (color == 'rgb(255, 0, 0)' || color == 'red') {
                    $(input_id).css('color', '#000').val("");
                }
            };
        }
    </script>
</head>

<body>
<!--top-->
<div class="top" id="top">
    <div class="wrap clearfloat">
        <div class="nav">
            <ul class="clearfloat">
                <li class="active">
                    <h2><a href="${pageContext.request.contextPath}/user/main.do">首页</a></h2>
                </li>
                <li>
                    <h2><a href="${pageContext.request.contextPath}/这里写竞赛经验文章跳转界面";>竞赛经验文章</a><span class="navBtn"></span></h2>
                    <div class="navDown">
                        <a href="">精选文章</a>
                        <a href="">教师经验</a>
                    </div>
                </li>
                <li>
                    <h2><a href="${pageContext.request.contextPath}/这里写好问界面">好问</a><span class="navBtn"></span></h2>
                    <div class="navDown">
                        <a href="">精选问题</a>
                        <a href="">热搜问题</a>
                    </div>
                </li>
                <li>
                    <h2><a href="${pageContext.request.contextPath}/这里写个人信息界面">个人信息</a><span class="navBtn"></span></h2>
                    <div class="navDown">
                        <a href="">登录</a>
                        <a href="">个人信息查看</a>
                    </div>
                </li>
                <li>
                    <h2><a href="">加入我们</a><span class="navBtn"></span></h2>
                    <div class="navDown">
                        <a href="">常见问题</a>
                        <a href="">在线视频</a>
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
        <!--search button-->
        <div style="text-align:right;margin:5px;">
            <form method="post" action="<%=basePath%>question/search.do" onsubmit="return isSearch()">

                <input type="text" name="keyword" id="input_key" placeholder="按关键字搜索"
                       onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5\.]/g,'')"
                       onpaste="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5\.]/g,'')"
                       oncontextmenu="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5\.]/g,'')"
                       style="background-color:#FFF;border-radius:25px;width:50%;height:30px;margin:0px;padding:20px;border:1px solid #CCC;outline:none;font-size:20px;" >
                <button type="submit" id="search_article_button"  style="background-color: #66CCCC;color:#FFF;font-size:20px;border:1px solid #66CCCC;padding:5px;border-radius:25px">搜索文章</button>

            </form>
        </div>
        <!---->
        <!-- 填充目标 -->

    </div>
    <div class="scroller-status">
        <div class="loader-ellips infinite-scroll-request">
            <span class="loader-ellips__dot"></span>
            <span class="loader-ellips__dot"></span>
            <span class="loader-ellips__dot"></span>
            <span class="loader-ellips__dot"></span>
        </div>
        <p class="scroller-status__message infinite-scroll-last" style="text-align: center">没有问题了</p>
        <p class="scroller-status__message infinite-scroll-error" style="text-align: center">问题列表加载错误</p>
    </div>
    <p class="pagination">
        <c:if test="${not empty keyword}">
            <a class="pagination__next" href="<%=basePath%>/question/search.do?keyword=${keyword}&pageIndex=0">下一页</a>
        </c:if>
        <c:if test="${empty keyword}">
            <a class="pagination__next" href="<%=basePath%>/question/list.do?pageIndex=0">下一页</a>
        </c:if>
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
