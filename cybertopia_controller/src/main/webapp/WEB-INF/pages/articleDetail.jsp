<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


            function checkLikeStatus(){
                //获得当前文章的收藏状态
                var collectionStatus=${collctionStatus};

                //已收藏，设置颜色
                if(collectionStatus > 0){
                    // $("#likebutt").toggleClass("like_click");
                    $("#likebutt").attr("class","like_click");
                }
            }
            checkLikeStatus();


            $("#likebutt").click(function(){

                // 检查用户登录状态
                checkUserStatus();

                //点击收藏
                if (this.className == "like_click") {
                    //删除已传入的文章
                    delete_like();
                    // $(this).toggleClass("like");
                    $(this).attr("class","like");
                    //取消了收藏
                }
                else{
                    //传入文章id和用户id,写入文章收藏表
                    like_article();
                    // $(this).toggleClass("like_click");
                    $(this).attr("class","like_click");
                }
            });

            function setDefault(input_id) {
                return function () {
                    var color = $(input_id).css('color');
                    if (color == 'rgb(255, 0, 0)' || color == 'red') {
                        $(input_id).css('color', '#000').val("");
                    }
                };
            }
            //评论框
            $("#comment_textarea").focus(setDefault('#comment_textarea'));
            //
        });
       //

        function checkUserStatus() {
            if (${userStatus}==0){
                window.location = "<%=basePath%>user/toLogin.do";
                // console.log("无用户");
                return;
            }
        }

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

        //处理评论

        function comment(){
            checkUserStatus();
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
                    post_comment();
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

        function post_comment() {
            var comment = {
                "articleId":${article.id},
                "content":$("#comment_textarea").val()
            };
            $.ajax({
                type: "POST",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                url: "<%=basePath%>/article/comment.do",
                data: JSON.stringify(comment), // Note it is important
                success: function (data) {
                    /*console.log(data);*/
                    alert("发表成功！");
                },
                error: function() {
                    /*console.log("post error");*/
                    alert("发表失败！");
                }
            });
        }

        function get_all_comment(){
            $(".all_comment_button").attr("disabled",true);//不可点击按钮
              var content={
                  "articleId":${article.id}
              };
              $.ajax({
                  type:"get",
                  dataType:'json',
                  url: "<%=basePath%>/article/comment.do",
                  data: content,
                  success: function (data) {
                     /* console.log(data);*/
                      if(data.length > 0){

                          //执行显示所有评论的函数
                          show_all_comment_full(data);
                      }
                      else{
                          //评论区显示空
                          /*console.log("kkkkkk empty")*/
                          show_all_comment_empty();
                      }

                  },
                  error: function() {
                      /*console.log("like error");*/
                  }
              });
        }

        function formatDate(date) {
            var d = new Date(date),
                month = '' + (d.getMonth() + 1),
                day = '' + d.getDate(),
                year = d.getFullYear();

            if (month.length < 2) month = '0' + month;
            if (day.length < 2) day = '0' + day;

            return [year, month, day].join('-');
        }

        //动态添加div,每条评论占一个div
        function insertComment(comment) {
            var brother=$("#comments");
            var div_content=$("<div class='comment_detail'></div>");
            var comment_data=$("<h3>"+comment.userName+"</h3>" +
                "<p class='content_p'>"+comment.content+"</p>" +
                "<p class='time_p'>发表于&nbsp;<span>"+formatDate(comment.date)+"</span></p>");
            div_content.html(comment_data);

            //插入节点
            brother.append(div_content);
        }

        function show_all_comment_full(data) {
            //显示评论区

            //添加数据
            data.forEach(function (elem) {
                insertComment(elem);
            });

            $(".article_comment").show();

        }

        function show_all_comment_empty() {
            //动态添加div,每条评论占一个div
            //显示评论区

            var div_content=$("<div class='comment_detail' style='text-align: center'>暂无评论...</div>");
            $("#comments").append(div_content);

            /*$(".all_comment_button").attr("disabled",false);//可点击按钮*/

            $(".article_comment").show();

        }


        function hidden_all_comment(){
           //隐藏评论区

            $(".all_comment_button").attr("disabled",false);//可点击按钮
            $("#comments").empty();
            $(".article_comment").hide();
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
                <li class="active">
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
        <span class="comment_bar_item">
            <!--<button onclick="showCommentDiv()"><span class="write_comment">&#9997;</span>发表评论</button>&nbsp;|-->
        <button type="button" class="all_comment_button" onclick="get_all_comment()"><span class="write_comment">&#9786;</span>显示所有评论</button>&nbsp;&nbsp;|

            <button type="button" class="hidden_comment_button" onclick="hidden_all_comment()"><span class="write_comment">&#9785;</span>隐藏所有评论</button>&nbsp;&nbsp;|
            <button type="button" id="likebutt" class="like"><span class="star" >&#9733;</span>收藏&nbsp;</button>
        </span>
    </div>

    <!--评论框-->
    <div  id="publish_comment_div">
    <div class="article_content">
        <textarea id="comment_textarea" style="width:100%;height:100px;overflow: auto;" placeholder="在此输入评论..." ></textarea>
    </div>
    <div class="publish_bar">
        <button type="button" class="publish_comment_button" onclick="comment()">发表评论</button>
    </div>
    </div>
    <!---->

    <!--显示所有评论-->

     <div class="article_comment">

         <div id="comment_title" style="background-color:#669999;color:#FFF;font-size:16px;height:40px;line-height: 40px">
             <span style="vertical-align: middle;height:40px;padding:5px;">所有评论</span>
         </div>

         <div id="comments"></div>
        <!-- <div class="comment_detail">
             <h3>用户名</h3>
             <p class="content_p">评论内容评论内容</p>
             <p class="time_p" >发表于&nbsp;<span>2019-7-7</span></p>
         </div>-->

     </div>
    <!---->

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
</div>
</body>
</html>
