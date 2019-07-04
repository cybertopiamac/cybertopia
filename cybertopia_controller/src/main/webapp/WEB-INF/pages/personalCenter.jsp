<%@ page import="com.macteam.cybertopia.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    User user= (User) session.getAttribute("user");
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>个人信息</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">

    <link rel="stylesheet" href="<%=basePath%>/css/personalCenter_css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>/css/personalCenter_css/bootstrap-theme.min.css" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>/css/personalCenter_css/fontAwesome.css" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>/css/personalCenter_css/light-box.css" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>/css/personalCenter_css/templatemo-main.css" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>/css/personalCenter_css/change.css" type="text/css">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/main_css/public.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/main_css/jquery.bxslider.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/main_css/style.css"/>
    <script type="text/javascript" src="<%=basePath%>/js/main_js/jquery1.11.3.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main_js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main_js/indexJS.js"></script>
    <script src="<%=basePath%>/js/personalCenter_js/vendor/modernizr-2.8.3-respond-1.4.2.min.js" type="text/javascript"></script>
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
                    <h2><a href="${pageContext.request.contextPath}/personalCenter/home.do">个人信息</a><span class="navBtn"></span></h2>
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
<%--<!--top-->--%>

<div class="sequence">
    <div class="seq-preloader">
        <svg width="39" height="16" viewBox="0 0 39 16" xmlns="http://www.w3.org/2000/svg" class="seq-preload-indicator"><g fill="#F96D38"><path class="seq-preload-circle seq-preload-circle-1" d="M3.999 12.012c2.209 0 3.999-1.791 3.999-3.999s-1.79-3.999-3.999-3.999-3.999 1.791-3.999 3.999 1.79 3.999 3.999 3.999z"/><path class="seq-preload-circle seq-preload-circle-2" d="M15.996 13.468c3.018 0 5.465-2.447 5.465-5.466 0-3.018-2.447-5.465-5.465-5.465-3.019 0-5.466 2.447-5.466 5.465 0 3.019 2.447 5.466 5.466 5.466z"/><path class="seq-preload-circle seq-preload-circle-3" d="M31.322 15.334c4.049 0 7.332-3.282 7.332-7.332 0-4.049-3.282-7.332-7.332-7.332s-7.332 3.283-7.332 7.332c0 4.05 3.283 7.332 7.332 7.332z"/></g></svg>
    </div>
</div>


<nav>
    <div class="logo">
        <p style="color: #ffffff;font-size: 20px;">导&nbsp;航&nbsp;栏</p>
    </div>
    <ul>
        <li><a href="#1"><i class="fa fa-user"></i> <em>个人信息</em></a></li>
        <li><a href="#2"><i class="fa fa-pencil"></i> <em>我的文章</em></a></li>
        <li><a href="#3"><i class="fa fa-heart"></i> <em>我的收藏</em></a></li>
        <li><a href="#4"><i class="fa fa-comment"></i> <em>我的评论</em></a></li>
    </ul>
</nav>

<div class="slides">
    <div class="slide" id="1">
        <div class="content first-content">
            <div class="container-fluid">
                <div class="col-md-3">
                    <div class="author-image"><img src="<%=basePath%>/images/personalCenter_images/author_image.png" alt=""></div>
                </div>

                <div class="col-md-9">
                    <h2><%=user.getNickName()%></h2>
                    <table>
                        <tr>
                            <td><p><em>姓名:</em><input class="text-style" type="text" value="<%=user.getName()%>" readonly="readonly"></p></td>
                            <td><p><em>性别:</em><input class="text-style" type="text" value="<%=user.getSex()%>" readonly="readonly"></p></td>
                        </tr>
                        <tr>
                            <td><p><em>学校:</em><input class="text-style" type="text" value="<%=user.getSchool()%>" readonly="readonly"></p></td>
                            <td><p><em>专业:</em><input class="text-style" type="text" value="<%=user.getMajor()%>" readonly="readonly"></p></td>
                        </tr>
                        <tr>
                            <td><p><em>年级:</em><input class="text-style" type="text" value="<%=user.getGrade()%>" readonly="readonly"></p></td>
                            <td><p><em>电话:</em><input class="text-style" type="text" value="<%=user.getPhone()%>" readonly="readonly"></p></td>
                        </tr>
                        <tr>
                            <td colspan="2"><p><em>邮箱:</em><input class="text-style" style="width: 70%" type="text" value="<%=user.getEmail()%>" readonly="readonly"></p></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <p>
                                    <em>个人简介:</em>
                                    <textarea class="text-style" style="vertical-align:top;resize:none;" rows="3" cols="50" readonly="readonly"><%=user.getDesc()%></textarea>
                                </p>
                            </td>
                        </tr>
                    </table>
                    <div class="fb-btn"><input type="button" onclick="changeState" value="修改个人信息"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="slide" id="2">
        <div class="content second-content">
            <div class="container-fluid">
                <div class="col-md-6">
                    <div class="left-content">
                        <h2>文章标题</h2>
                        <p>内容。。。。</p>
                        <div class="main-btn">
                            <input type="button" value="更多">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="slide" id="3">
        <div class="content third-content">
            <div class="container-fluid">
                <div class="col-md-12">
                    <div class="row">
                        <div class="first-section">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-6" style="border-right: 1px solid #ffffff;overflow:scroll;height: 100%">
                                        <div style="float: top;position: fixed;">
                                            <h2 style="height:26px;width:50px;border-bottom: none;background-color: rgba(101, 202, 193,0.75);">文章</h2>
                                        </div>
                                        <div class="left-content" >
                                            <h2>标题</h2>
                                            <p>内容</p>
                                            <div class="main-btn">
                                                <input type="button" value="查看详情">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6" style="padding-left: 5px;overflow:scroll;height: 100%">
                                        <div style="float:top;position: fixed">
                                            <h2 style="height:26px;width:50px;background-color: rgba(101, 202, 193,0.75);border-bottom: none">竞赛</h2>
                                        </div>
                                        <div class="right-content">
                                            <h2>标题</h2>
                                            <p>内容</p>
                                            <div class="main-btn">
                                                <input type="button" value="查看详情">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="slide" id="4">
        <div class="content second-content">
            <div class="container-fluid">
                <div class="col-md-6">
                    <div class="left-content">
                        <a href=""><h3>文章</h3></a>
                        <p>用户名：评论.....</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="<%=basePath%>/js/personalCenter_js/vendor/jquery-1.11.2.min.js"></script>

<script src="<%=basePath%>/js/personalCenter_js/vendor/bootstrap.min.js"></script>

<script src="<%=basePath%>/js/personalCenter_js/datepicker.js"></script>
<script src="<%=basePath%>/js/personalCenter_js/plugins.js"></script>
<script src="<%=basePath%>/js/personalCenter_js/main.js"></script>

<script type="text/javascript">
    $(document).ready(function() {



        // navigation click actions
        $('.scroll-link').on('click', function(event){
            event.preventDefault();
            var sectionID = $(this).attr("data-id");
            scrollToID('#' + sectionID, 750);
        });
        // scroll to top action
        $('.scroll-top').on('click', function(event) {
            event.preventDefault();
            $('html, body').animate({scrollTop:0}, 'slow');
        });
        // mobile nav toggle
        $('#nav-toggle').on('click', function (event) {
            event.preventDefault();
            $('#main-nav').toggleClass("open");
        });
    });
    // scroll function
    function scrollToID(id, speed){
        var offSet = 0;
        var targetOffset = $(id).offset().top - offSet;
        var mainNav = $('#main-nav');
        $('html,body').animate({scrollTop:targetOffset}, speed);
        if (mainNav.hasClass("open")) {
            mainNav.css("height", "1px").removeClass("in").addClass("collapse");
            mainNav.removeClass("open");
        }
    }
    if (typeof console === "undefined") {
        console = {
            log: function() { }
        };
    }
</script>
</body>
</html>