<%--
  Created by IntelliJ IDEA.
  User: solist
  Date: 2019-07-02
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html lang="en" class="no-js">
<head>
    <title>登录</title>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Log in|Blog</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login_css/component.css" />
    <script type="text/javascript">


        function login() {
            var name = document.getElementById("username").value;
            var password=document.getElementById("password").value;
            if(name==""||password==""){
                alert("账号或密码不能为空！");
            }
            else{
                var form = document.forms[0];
                form.action = "${pageContext.request.contextPath}/user/login.do";
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
        <h1 id="logo">登录</h1>
        <h2 id="subheading">探索竞赛世界
        </h2>
    </div>
    <div class="signup_forms">
        <div id="signup_forms_container" class="signup_forms_container">
            <form class="signup_form_form" id="sign_form" method="post">
                <div class="signup_account" id="signup_account">
                    <div class="form_user"><input type="text" name="username" placeholder="Username" id="username" value="${user.username}"></div>
                    <div class="form_password"><input type="password" name="password" placeholder="Password" id="password" value="${user.password}"></div>
                </div>
                <button type="submit" id="signup_forms_submit" onclick="login()"><span><strong>进入</strong></span></button>
            </form>
        </div>
    </div>
    <div class="footer">
        <div class="footer_signup_link">
            <a class="signup_link" href="">注册</a>
            <a href=""  class="link unnamed_1">首页</a>
            <a href=""  class="link unnamed_2">联系我们</a>
        </div>
        <div class="design_show">
            <div class="designer_info">
                Designed by <a href="http://www.bootstrapmb.com/" title="bootstrapmb">Zijun</a>
                <a href="#" target="_blank" class="face"><img id="face" src="${pageContext.request.contextPath}/images/login_images/face.jpg" alt="designed by Zijun" /></a>
            </div>
        </div>
    </div>
    <span style="color: darkorange; font-size:18px; font-weight:bold; ">${msg}</span>


    <script src="${pageContext.request.contextPath}/js/login_js/demo-2.js"></script>
</div>
</body>
</html>
