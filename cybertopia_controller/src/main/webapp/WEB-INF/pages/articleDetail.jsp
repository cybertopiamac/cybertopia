<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/articles_css/markdown.css"/>


    <script type="text/javascript" src="<%=basePath%>/js/main_js/jquery1.11.3.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main_js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main_js/indexJS.js"></script>

    <script src="<%=basePath%>js/main_js/infinite-scroll.pkgd.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function(){
            $(".like").click(function(){

                $(this).toggleClass("like_click");

                //获得点击后的颜色
                var color=$('#like_star').css('color');
                //alert(color);
                //点击收藏
                if (color == 'rgb(255, 0, 0)' || color == 'red') {
                    //传入文章id和用户id,写入文章收藏表
                    //like_article()
                    alert("已收藏");
                }
                //取消了收藏
                else{
                    //删除已传入的文章
                    //delete_like();
                    alert("已取消收藏");
                }



            });

            //评论框
            $("#comment_textarea").focus(setDefault('#comment_textarea'));
            //
        });
       //
        function send_like(playload) {
            $.ajax({
                type: "POST",
                // contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                url: "<%=basePath%>/article/like.do",
                data: playload,
                success: function (data) {
                    console.log(data);
                },
                error: function() {
                    console.log("like error")
                }
            });
        }

        //收藏文章
        function like_article(){

            var like_article = {
                "articleId":${article.id},
                "action":"set"
            };
            send_like(like_article);
        }

        //取消收藏
        function delete_like(){

            var dislike_article = {
                "articleId":${article.id},
                "action":"unset"
            };
            send_like(dislike_article);
        }

        function showCommentDiv(){
             $("#publish_comment_div").show();
        }
        //
        //处理评论
        function comment(){

            var check_blank = true;
            var comment_content=$("#comment_textarea").val();
           //评论为空
            if (comment_content == "" && $.trim(comment_content).length == 0) {

                $('#comment_textarea').css('color', 'red').val("评论内容不能为空");
                check_blank=false;
            }

            if (check_blank != false) {
                var r = confirm("确认发表吗?");
                if (r == true) {
                    //传入评论content
                    //向评论表写入数据
                    //post_comment();
                    alert("发表成功！");
                    $('#comment_textarea').val("");
                    return true;
                } else {
                    //不提交表单申请
                    alert("取消发表");
                    return false;
                }
            }
            return false;

        }


        function setDefault(input_id) {
            return function () {
                var color = $(input_id).css('color');
                if (color == 'rgb(255, 0, 0)' || color == 'red') {
                    $(input_id).css('color', '#000').val("");
                }
            };
        }


        function post_comment() {
            var comment = {
                "articleId":$(article.id),
                "content":$("#comment_textarea").val()
            };
            $.ajax({
                type: "POST",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                url: "<%=basePath%>/article/comment.do",
                data: JSON.stringify(comment), // Note it is important
                success: function (data) {
                    console.log(data);
                },
                error: function() {
                    console.log("post error")
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
            <h1>${article.title}</h1>
            <p><span>${author_name}</span>
                <span class="pub_time">发表于
                    <fmt:formatDate value="${article.date}" pattern="yyyy-MM-dd" />
                </span>
                <span class="read_number">浏览量 ${article.browseNum}</span>
            </p>
    </div>
    <div class="article_content markdown">
        ${article.content}
    </div>
    <div class="comment_bar">
        <p class="comment_bar_p">
            <button class="like"><span class="star" id="like_star">&#9733;</span>收藏&nbsp;</button>|
            <button onclick="showCommentDiv()"><span class="write_comment">&#9997;</span>发表评论</button>
        </p>
    </div>
    <!--评论框-->
    <div  id="publish_comment_div" style="display: none">
    <div class="article_content">
        <textarea id="comment_textarea" style="width:100%;height:100px;overflow: auto;" placeholder="在此输入评论..." ></textarea>
    </div>
    <div class="publish_bar">
        <button type="button" class="publish_comment_button" onclick="comment()">确认发表</button>
    </div>
    </div>：
    <!---->
</div>
</body>
</html>
