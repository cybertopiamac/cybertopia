<%@ page import="com.macteam.cybertopia.entity.Competition" %><%--
  Created by IntelliJ IDEA.
  User: weilai
  Date: 2019-07-07
  Time: 01:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<html>
<head>
    <title>Cybertopia - 竞赛详情</title>

    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/main_css/public.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/main_css/jquery.bxslider.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/main_css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/comp_css/competition.css">

    <script type="text/javascript" src="<%=basePath%>/js/main_js/jquery1.11.3.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main_js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main_js/indexJS.js"></script>
    <script src="<%=basePath%>js/main_js/infinite-scroll.pkgd.min.js"></script>


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

<%--competition detail--%>
<div class="comp_detail">
    <div class="comp_img">
        <img src="${pageContext.request.contextPath}/images/competition_images/${comp.id}.png" alt="${comp.name}">
    </div>
    <div class="comp_header">
        <div class="comp_title comp_subtitle">${comp.name}</div>
        <div><span class="comp_tag">#${comp.type}</span></div>
    </div>
    <div class="comp_content">
        <div class="comp_subtitle">竞赛详情</div>
        <div class="comp_desc">
            ${comp.description}
        </div>
        <div class="comp_date comp_subtitle">报名截止日期：2019年${comp.date}月
            <%--<fmt:formatDate value="${comp.date}" pattern="yyyy-MM-dd" />--%>
        </div>
        <div class="comp_link comp_subtitle">
            竞赛官网：<a href="${comp.link}" target="_blank">${comp.link}</a>
        </div>
    </div>
</div>
<%--end of competition detail--%>

<%--homelink--%>
<div class="homeLink">
    <div class="wrap">
        <div class="homeTitle">
            <h2>友情链接</h2>
            <h3><span>friendly link</span></h3>
            <div class="line"></div>
        </div>
        <div class="homeLinkWrap">
            <a href="http://www.chinasofti.com" target="_blank">中软国际</a><a href="http://www.github.com" target="_blank">大型同性交友网站</a><a href="http://www.52jingsai.com/portal.php" target="_blank">我爱竞赛网</a> <a href="http://jsjds.ruc.edu.cn" target="_blank">中国大学生计算机设计大赛</a><a href="http://www.mcm.edu.cn" target="_blank">全国大学生数学建模竞赛</a><a href="http://www.cnccac.com/case3.php" target="_blank">全国大学生C语言设计大赛</a>
            <a href="http://www.saikr.com" target="_blank">赛氪</a>
        </div>
    </div>
</div>
<%--end of homelink--%>

</body>
</html>
