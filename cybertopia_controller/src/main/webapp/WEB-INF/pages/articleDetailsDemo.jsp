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
    <title>文章详情页面</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/main_css/public.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/main_css/jquery.bxslider.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/main_css/style.css"/>

    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/articles_css/articlesStyle.css"/>


    <script type="text/javascript" src="<%=basePath%>/js/main_js/jquery1.11.3.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main_js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main_js/indexJS.js"></script>


    <script type="text/javascript">


        $(document).ready(function(){
            $("button").onclick(function(){
                $(".like").style.color="red";

            });
        });
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

<!--articleDetails-->
<div class="article-feed">
    <div class="article_title article_detail_title">
            <h1>文章文章文章文章文章文章文章文章文章文章文章文章articals articals articals什么东西word 我们不一样啊啊啊你好吗</h1>
            <p><span>张三</span> <span class="pub_time">发表于&nbsp;&nbsp;2019年7月3日&nbsp;20:12</span><span class="read_number">浏览量:2</span></p>
        <hr/>

    </div>
    <div class="article_content">
         <p>内容</p>
         <h2>标题2222222222word成绩单</h2>
         <p>内容</p>
         <ul>
             <li>
                 我们呢饭积分年纪
             </li>
             <br/>

             <li>
                word nej nasj出假大空
             </li>
             <br/>
             <li>
                 陈纳德愁眉苦脸
             </li>
         </ul>
         <code>hello world</code>
        <p>cbonvfbonf</p>
        <pre>
            int a=1;
            int b=4;
            System.out.println(a+b）;
        </pre>
       <p>初步欧式保持合订本逊尼派初步殴打年长江口不错多级哦女儿家偶发cnfdojnvskkbl jcl bsoufn sojbf ab ohdjna 初步欧式差别动薄弱传播点击
           cnjc xbsi bcjsndapobvjzmkcjosb cnaj cc sjkc zall fjsrfbqianzlkxnKClsnnfac 出鸟兽散snocdon</p>
        <p>cbdujcfdn</p>
        <p>xsbiocjkmla</p>
        <p> bxnkxsbocjnkma需哦刹那间</p>
        <p>cdbocsdcsd写小便斗</p>
        <p>dcbson小便斗斯诺克崇明岛</p>
        <p>小波手机电池年</p>
        <p>xzbcojkdfvnpos传播界女裤疲惫vj</p>

    </div>

    <div class="comment_bar">
        <p class="comment_bar_p">
            <a href="#"  title="点击收藏此文章"><span class="like">&#9733;</span>收藏&nbsp;</a>|
            <a href="#"  title="点击发表评论"><span class="write_comment">&#9997;</span>发表评论</a>
        </p>
    </div>

</div>


</body>
</html>



