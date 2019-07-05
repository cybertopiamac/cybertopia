<%@ page import="com.macteam.cybertopia.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: solist
  Date: 2019-07-04
  Time: 16:56
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

        function register() {


            if(document.getElementById("nickname").value==""||document.getElementById("school").value==""||document.getElementById("major").value==""||document.getElementById("phone").value==""||document.getElementById("email").value==""||document.getElementById("sex").value==""||document.getElementById("grade").value==""||document.getElementById("description").value==""){
                alert("请填写完所有内容");
            }
            else{
                alert("注册成功！")
                var form = document.forms[0];
                form.action = "${pageContext.request.contextPath}/newuser/toFinalRegister.do";
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

    <div class="signup_forms">
        <div id="signup_forms_container" class="signup_forms_container">
            <form class="signup_form_form" id="sign_form" method="post">
                <div class="signup_account" id="signup_account">
                    <div class="form_usernickname"><input type="text" name="nickname" placeholder="Nickname" id="nickname" value="${newuser.nickname}"></div>
                    <div class="form_school"><input type="text" name="school" placeholder="School" id="school" value="${newuser.school}"></div>
                    <div class="form_major"><input type="text" name="major" placeholder="Major" id="major" value="${newuser.major}"></div>
                    <div class="form_phone"><input type="text" name="phone" placeholder="Phone" id="phone" value="${newuser.phone}"></div>
                    <div class="form_email"><input type="text" name="email" placeholder="Email" id="email" value="${newuser.email}"></div>
                    <div class="form_sex" style="width: 260px;height:50px;font-size: 5px"  >
                        <select class="selectpicker" name="sex" placeholder="性别" id="sex" value="${newuser.sex}">
                            <option value ="1">男</option>
                            <option value ="0">女</option>
                        </select>
                    </div>
                    <div class="form_grade" style="width: 260px;height:50px;font-size: 5px"  >
                        <select class="selectpicker" name="grade" placeholder="年级" id="grade" value="${newuser.grade}">
                            <option value ="1">大一</option>
                            <option value ="2">大二</option>
                            <option value ="3">大三</option>
                            <option value ="4">大四</option>
                            <option value ="5">研究生</option>
                            <option value ="0">其他</option>
                        </select>
                    </div>
                    <div class="form_desc"><input type="text" name="description" placeholder="Describe yourself" id="description" value="${newuser.description}"></div>

                </div>
                <button type="submit" id="signup_forms_submit" onclick="register()"><span><strong>体验竞赛世界</strong></span></button>
            </form>
        </div>
    </div>
    <div class="footer">
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
