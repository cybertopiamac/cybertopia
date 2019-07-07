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
    <title>提问</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/main_css/public.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/main_css/jquery.bxslider.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/main_css/style.css"/>

    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/articles_css/articlesStyle.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/articles_css/markdown.css"/>

    <script type="text/javascript" src="<%=basePath%>/js/main_js/jquery1.11.3.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main_js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main_js/indexJS.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main_js/marked.min.js"></script>

    <script src="<%=basePath%>js/main_js/infinite-scroll.pkgd.min.js"></script>


    <script type="text/javascript">

        $(document).ready(function () {
            $("#input_title").focus(setDefault('#input_title'));
            $("#input_content").focus(setDefault('#input_content'));
        });

        function publish() {
            //获得文章标题
            var title = $('#input_title').val();
            var check_blank = true;
            if (title == "" && $.trim(title).length == 0) {
                $('#input_title').css('color', 'red').val("标题不能为空");
                check_blank = false;
            }
            var raw_content = $('#input_content').val();
            if (raw_content == "" && $.trim(raw_content).length == 0) {
                $('#input_content').css('color', 'red').val("内容不能为空");
                check_blank = false;
            }
            if (check_blank != false) {
                var r = confirm("确认发表吗?");
                if (r == true) {
                    //传入title和content
                    //向文章表写入数据
                    post_article();
                    return true;
                } else {
                    //不提交表单申请
                    alert("取消发表");
                    return false;
                }
            }
            return false;

        }

        function changeMarkdown(){
            document.getElementById("browser_tip").style.display="block";
            document.getElementById("previous_div").style.display="block";
            document.getElementById('previous_div').innerHTML =
                marked(document.getElementById('input_content').value);
        }
        function hiddenBrowser(){
            document.getElementById('input_content').style.height=document.getElementById('input_content').scrollHeight+'px';
            document.getElementById("browser_tip").style.display="none";
            document.getElementById("previous_div").style.display="none";
        }
        function setDefault(input_id) {
            return function () {
                var color = $(input_id).css('color');
                if (color == 'rgb(255, 0, 0)' || color == 'red') {
                    $(input_id).css('color', '#000').val("");
                }
            };
        }
        function post_article() {
            var article = {
                "title":$('#input_title').val(),
                "content":marked($('#input_content').val())
            };
            $.ajax({
                type: "POST",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                url: "<%=basePath%>question/post.do",
                data: JSON.stringify(article), // Note it is important
                success: function (data) {
                    console.log(data);
                   alert("发表成功！");
                    window.location = "<%=basePath%>question/all.do";
                },
                error: function() {
                    console.log("post error");
                    alert("发表失败！");
                }
            });
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
                <li>
                    <h2><a href="${pageContext.request.contextPath}/article/all.do">文章</a><span class="navBtn"></span></h2>
                    <div class="navDown">
                        <a href="${pageContext.request.contextPath}/article/write.do">写文章</a>
                        <a href="${pageContext.request.contextPath}/article/all.do">精选文章</a>
                    </div>
                </li>
                <li class="active">
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

<!--articleWrite-->
<div class="article-feed">


    <!--填充title-->
    <div class="article_title article_detail_title publish_title title_box">
        <div class="title_left"></div>
        <input type="text" name="input_title" id="input_title" placeholder="请输入标题..."></h1>
        <div class="title_right"></div>
    </div>
    <!--title-->

 <!--填充content-->
    <div class="article_content">
  <textarea placeholder="请输入内容..."  row="1"  id="input_content" oninput="hiddenBrowser()"></textarea>
    </div>

    <!--button-->
    <div class="publish_bar">

        <button type="button" class="publish_button" onclick="publish()">发表</button>

        <button type="button" class="previous_browser" onclick="changeMarkdown()">点击预览</button>
    </div>

    <!---->
    <!--content-->
    <p id="browser_tip" style="display:none;margin:10px;text-align:center;">
        <span style="background: #fff; font-family: sans-serif;font-size: 1.5em;padding: 5px;">预览内容如下</span>
    </p>
    <div class="markdown" id="previous_div" style="border:0.3em solid #66cccc;display:none;"></div>

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
</html>
