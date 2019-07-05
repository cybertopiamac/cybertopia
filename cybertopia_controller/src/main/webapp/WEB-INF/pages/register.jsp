<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.macteam.cybertopia.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: solist
  Date: 2019-07-04
  Time: 12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
    <title>注册</title>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Log in|Blog</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login_css/component.css" />

    <script type="text/javascript">

        function nextStep() {
            if(document.getElementById("password").value==""||document.getElementById("password2").value==""||document.getElementById("username").value==""){
                alert("请填写完所有内容");
                var form = document.forms[0];
                form.action = "${pageContext.request.contextPath}/newuser/toRegister.do";
                form.method = "post";
                form.submit();
            }
            else if(document.getElementById("password").value!=document.getElementById("password2").value){
                alert("两次密码不一致");
                var form = document.forms[0];
                form.action = "${pageContext.request.contextPath}/newuser/toRegister.do";
                form.method = "post";
                form.submit();
            }
            else{
                var form = document.forms[0];
                form.action = "${pageContext.request.contextPath}/newuser/toNextRegister.do";
                form.method = "post";
                form.submit();
            }
        }


    </script>

</head>
<body>
<div class="demo-2">
    <div class="">
        <div id="large-header" class="large-header">
            <canvas id="demo-canvas"></canvas>

        </div>
    </div>
</div>
<div class="container">
    <div class="login_header">
        <span></span>
    </div>



    <div class="form_header">
        <h1 id="logo">注册</h1>
        <h2 id="subheading">探索竞赛世界
        </h2>
    </div>

    <c:set var="username" value="" scope="session"></c:set>
    <c:set var="password" value="" scope="session"></c:set>

    <div class="signup_forms">
        <div id="signup_forms_container" class="signup_forms_container">
            <form class="signup_form_form" id="sign_form" method="post">
                <div class="signup_account" id="signup_account">
                    <%--                    <%request.getSession().setAttribute("newUser", new User()); %>--%>
                    <div class="form_user"><input type="text" name="username" placeholder="Username" id="username" value="${newuser.username}"></div>
                    <div class="form_password"><input type="password" name="password" placeholder="Password" id="password" value="${newuser.password}"></div>
                    <div class="form_password"><input type="password" name="password2" placeholder="Password" id="password2" value="${newuser.password}"></div>
                </div>
                <button type="submit" id="signup_forms_submit" onclick="nextStep()"><span><strong>下一步</strong></span></button>
            </form>
        </div>
    </div>
    <div class="footer">
        <div class="footer_signup_link">
            <a href="${pageContext.request.contextPath}/main/index.do"  class="link unnamed_1">首页</a>
            <a href=""  class="link unnamed_2">联系我们</a>
        </div>
        <div class="design_show">
            <div class="designer_info">
                Designed by <a href="http://www.bootstrapmb.com/" title="bootstrapmb">Zijun</a>
                <a href="#" target="_blank" class="face"><img id="face" src="${pageContext.request.contextPath}/images/login_images/face.jpg" alt="designed by Zijun" /></a>
            </div>
        </div>
    </div>
    <br><br><br>
    <span style="color: red; font-size:18px; font-weight:bold; ">${msg}</span>


    <script src="${pageContext.request.contextPath}/js/login_js/demo-2.js"></script>
</div>
</body>
</html>
