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

    <script type="text/javascript" src="<%=basePath%>/js/main_js/jquery1.11.3.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main_js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main_js/indexJS.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main_js/marked.min.js"></script>

    <script src="<%=basePath%>js/main_js/infinite-scroll.pkgd.min.js"></script>


    <script type="text/javascript">

        function isPublish() {
            //获得文章标题
            var title=document.getElementById("input_title").value;
            //获得文章内容
            //var content=document.getElementById("previous_div").value;
            //alert(title);
            //alert(content);
            //console.log(content);
            //

            var r = confirm("确认发表吗?");
            if (r == true) {
                //传入title和content
                //向文章表写入数据
                alert("发表成功！");
                return true;
            } else {
                //不提交表单申请
                alert("取消发表");
                return false;
            }

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

   <!--button-->
    <div class="publish_bar">

        <form action="" name="publishForm" method="post" onsubmit="return isPublish()">

        <button type="submit" class="publish_button" name="submit">发表</button>

        </form>

        <button type="button" class="previous_browser" onclick="changeMarkdown()">点击预览</button>
    </div>
    <!---->

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
    <!--content-->
    <p id="browser_tip" style="display:none;margin:10px;">预览内容如下：</p>
    <div id="previous_div" style="display:none;"></div>


</div>

</body>
</html>
