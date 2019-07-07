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
                <li>
                    <h2><a href="${pageContext.request.contextPath}/main/index.do">首页</a></h2>
                </li>
                <li class="active">
                    <h2><a href="${pageContext.request.contextPath}/comp/compList.do">竞赛</a><span class="navBtn"></span></h2>
                    <div class="navDown">
                        <a href="${pageContext.request.contextPath}/comp/compList.do">热门竞赛</a>
                        <a href="${pageContext.request.contextPath}/comp/compList.do#search">竞赛库</a>
                    </div>
                </li>
                <li>
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
</html>
