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
                <li>
                    <h2><a href="${pageContext.request.contextPath}/main/index.do">首页</a></h2>
                </li>
                <li>
                    <h2><a href="${pageContext.request.contextPath}/comp/compList.do">竞赛</a><span class="navBtn"></span></h2>
                    <div class="navDown">
                        <a href="${pageContext.request.contextPath}/comp/compList.do">热门竞赛</a>
                        <a href="${pageContext.request.contextPath}/comp/compList.do#search">竞赛库</a>
                    </div>
                </li>
                <li class="active">
                    <h2><a href="${pageContext.request.contextPath}/article/all.do">文章</a><span class="navBtn"></span></h2>
                    <div class="navDown">
                        <a href="${pageContext.request.contextPath}/article/write.do">写文章</a>
                        <a href="${pageContext.request.contextPath}/article/all.do">精选文章</a>
                    </div>
                </li>
                <li>
                    <h2><a href="${pageContext.request.contextPath}/question/all.do">好问</a><span class="navBtn"></span></h2>
                    <div class="navDown">
                        <a href="${pageContext.request.contextPath}/question/write.do">写问题</a>
                        <a href="${pageContext.request.contextPath}/question/all.do">精选问题</a>
                    </div>
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



    <%--signin/userinfo--%>
        <div class="topRight clearfloat" id="topRight">
            <c:choose>
                <c:when test="${user!=null}">
                    <div class="userInfo">
                        <a href="${pageContext.request.contextPath}/personalCenter/home.do">
                            <img src="${pageContext.request.contextPath}/images/head_icon/${user.picture}"/>
                            <span>${user.nickname}</span>
                        </a>
                        <div class="navDown">
                            <a href="${pageContext.request.contextPath}/personalCenter/home.do#1">个人信息</a>
                            <a href="${pageContext.request.contextPath}/personalCenter/home.do#2">我的文章</a>
                            <a href="${pageContext.request.contextPath}/personalCenter/home.do#3">我的收藏</a>
                            <a href="${pageContext.request.contextPath}/user/toLogin.do">退出登陆</a>
                        </div>
                    </div>
                </c:when>
                <c:when test="${user==null}">
                    <div class="signIn">
                        <a href="${pageContext.request.contextPath}/user/toLogin.do">登录</a>
                        <a href="${pageContext.request.contextPath}/newuser/toRegister.do">注册</a>
                    </div>
                </c:when>
            </c:choose>
        </div>
        <%--end of signin/userinfo--%>


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
           <form method="post" action="<%=basePath%>article/search.do" onsubmit="return isSearch()">

            <input type="text" name="keyword" id="input_key" placeholder="按关键字搜索"
                   onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5\.]/g,'')"
                   onpaste="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5\.]/g,'')"
                   oncontextmenu="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5\.]/g,'')"
                   style="background-color:#FFF;border-radius:25px;width:50%;height:30px;margin:0px;padding:20px;border:1px solid #CCC;outline:none;font-size:20px;" >
            <button type="submit" id="search_article_button"  style="background-color: #66CCCC;color:#FFF;font-size:20px;border:1px solid #66CCCC;padding:5px;border-radius:25px">搜索文章</button>

           </form>
        </div>
        <!---->

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
        <c:if test="${not empty keyword}">
            <a class="pagination__next" href="<%=basePath%>/article/search.do?keyword=${keyword}&pageIndex=0">下一页</a>
        </c:if>
        <c:if test="${empty keyword}">
            <a class="pagination__next" href="<%=basePath%>/article/list.do?pageIndex=0">下一页</a>
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

<%--footer--%>
<div style="margin-top: 50px">
    <div class="homeLink" style="background-color: #EBF0F1">
        <div class="wrap">
            <div class="homeTitle">
                <h2>关于我们</h2>
                <h3><span>about us</span></h3>
                <div class="line"></div>
            </div>
            <div class="homeLinkWrap">
                2019 © 武汉理工大学计算机科学与技术学院2016级 Mac组
                <br>
                All Rights Reserved.
            </div>
            <div class="homeTitle">
                <h2>友情链接</h2>
                <h3><span>friendly link</span></h3>
                <div class="line"></div>
            </div>
            <div class="homeLinkWrap">
                <a href="http://www.chinasofti.com" target="_blank">中软国际</a><a href="http://www.github.com" target="_blank">大型同性交友网站</a><a href="http://www.52jingsai.com/portal.php" target="_blank">我爱竞赛网</a> <a href="http://jsjds.ruc.edu.cn" target="_blank">中国大学生计算机设计大赛</a><a href="http://www.mcm.edu.cn" target="_blank">全国大学生数学建模竞赛</a><a href="http://www.cnccac.com/case3.php" target="_blank">全国大学生C语言设计大赛</a><a href="http://www.saikr.com" target="_blank">赛氪</a>
                <br>
                <a href="http://www.siemenscup-cimc.org.cn" target="_blank">“西门子杯”中国智能制造挑战赛</a><a href="http://univ.ciciec.com" target="_blank">全国大学生集成电路创新创业大赛</a><a href="http://www.dajiangsai.org" target="_blank">全国大学生“互联网+”创新大赛</a><a href="https://www.saikr.com/vse/37221" target="_blank">中国建设工程BIM大赛</a>
            </div>
        </div>
    </div>
</div>
<%--end of footer--%>



</body>
