<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>发表文章页面</title>
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
        })

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
                    alert("发表成功！");
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
                url: "<%=basePath%>/article/post.do",
                data: JSON.stringify(article), // Note it is important
                success: function (data) {
                    console.log(data);
                },
                error: function() {
                    console.log("post error")
                }
            });
        }

        // contentType: 'application/json; charset=utf-8',

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

</body>
</html>
