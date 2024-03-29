<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.macteam.cybertopia.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    User user = (User) session.getAttribute("user");
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
    <link rel="stylesheet" href="<%=basePath%>/css/personalCenter_css/newchange.css" type="text/css">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

    <script src="<%=basePath%>/js/personalCenter_js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"
            type="text/javascript"></script>
</head>

<body>
<%--back--%>
<div class="backToIndex">
    <a href="<%=basePath%>/main/index.do">
        <img src="<%=basePath%>/images/personalCenter_images/prev.png">返回</a>
</div>
<%--back--%>

<div class="sequence">
    <div class="seq-preloader">
        <svg width="39" height="16" viewBox="0 0 39 16" xmlns="http://www.w3.org/2000/svg"
             class="seq-preload-indicator">
            <g fill="#F96D38">
                <path class="seq-preload-circle seq-preload-circle-1"
                      d="M3.999 12.012c2.209 0 3.999-1.791 3.999-3.999s-1.79-3.999-3.999-3.999-3.999 1.791-3.999 3.999 1.79 3.999 3.999 3.999z"/>
                <path class="seq-preload-circle seq-preload-circle-2"
                      d="M15.996 13.468c3.018 0 5.465-2.447 5.465-5.466 0-3.018-2.447-5.465-5.465-5.465-3.019 0-5.466 2.447-5.466 5.465 0 3.019 2.447 5.466 5.466 5.466z"/>
                <path class="seq-preload-circle seq-preload-circle-3"
                      d="M31.322 15.334c4.049 0 7.332-3.282 7.332-7.332 0-4.049-3.282-7.332-7.332-7.332s-7.332 3.283-7.332 7.332c0 4.05 3.283 7.332 7.332 7.332z"/>
            </g>
        </svg>
    </div>
</div>


<nav>
    <div class="logo">
        <p style="color: #ffffff;font-size: 20px;">导&nbsp;航&nbsp;栏</p>
    </div>
    <ul>
        <li><a href="#1"><i class="fa fa-user"></i> <em>个人信息</em></a></li>
        <li><a href="#2" onclick="getArticleHistory()"><i class="fa fa-pencil"></i> <em>我的文章</em></a></li>
        <li><a href="#3" onclick="getArticleCollect()"><i class="fa fa-heart"></i> <em>我的收藏</em></a></li>
        <li><a href="#4" onclick="getCommentHistory()"><i class="fa fa-comment"></i> <em>我的评论</em></a></li>
        <li><a href="#5"><i class="fa fa-key"></i> <em>修改密码</em></a></li>
    </ul>
</nav>


<div class="slides">
    <div class="slide" id="1">
        <div class="content first-content">
            <form action="">
                <div class="container-fluid">
                    <div class="col-md-3">
                        <div class="author-image" style="height: 150px">
                            <img id="change_icon" src="<%=basePath%>/images/head_icon/<%=user.getPicture()%>">
                            <a class="file" id="show_word" style="visibility: hidden">
                                <center>
                                    修改头像<input type="file" id="file" accept="image/gif,image/jpeg,image/png,image/jpg"
                                               onchange="preImg('file','change_icon')">
                                </center>
                            </a>
                        </div>
                    </div>

                    <div class="col-md-9">
                        <h2><%=user.getNickname()%>
                        </h2>
                        <table>
                            <tr>
                                <td>
                                    <p><em>性别:</em>
                                        <select class="text-style" id="sex-select" disabled="true"
                                                style="background-color: transparent">
                                            <option<%if(user.getSex()==0){%> selected<%}%>>女</option>
                                            <option<%if(user.getSex()==1){%> selected<%}%>>男</option>
                                            <option<%if(user.getSex()==2){%> selected<%}%>>未知</option>
                                        </select>
                                    </p>
                                </td>
                                <td><p><em>学校:</em><input class="text-style" id="school-input" type="text"
                                                          value="<%=user.getSchool()%>" disabled="true"></p></td>
                            </tr>
                            <tr>
                                <td><p><em>专业:</em><input class="text-style" id="major-input" type="text"
                                                          value="<%=user.getMajor()%>" disabled="true"></p></td>
                                <td>
                                    <p><em>年级:</em>
                                        <select class="text-style" id="grade-select" disabled="true"
                                                style="background-color: transparent">
                                            <option<%if(user.getGrade()==0){%> selected<%}%>>未知</option>
                                            <option<%if(user.getGrade()==1){%> selected<%}%>>大一</option>
                                            <option<%if(user.getGrade()==2){%> selected<%}%>>大二</option>
                                            <option<%if(user.getGrade()==3){%> selected<%}%>>大三</option>
                                            <option<%if(user.getGrade()==4){%> selected<%}%>>大四</option>
                                            <option<%if(user.getGrade()==5){%> selected<%}%>>研一</option>
                                            <option<%if(user.getGrade()==6){%> selected<%}%>>研二</option>
                                            <option<%if(user.getGrade()==7){%> selected<%}%>>研三</option>
                                            <option<%if(user.getGrade()==8){%> selected<%}%>>博一</option>
                                            <option<%if(user.getGrade()==9){%> selected<%}%>>博二</option>
                                        </select>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td><p><em>电话:</em><input class="text-style" id="phone-input" type="text"
                                                          value="<%=user.getPhone()%>" disabled="true"></p></td>
                                <td><p><em>邮箱:</em><input class="text-style" id="email-input" style="width: 70%"
                                                          type="text" value="<%=user.getEmail()%>" disabled="true"></p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <p>
                                        <em>个人简介:</em>
                                        <textarea class="text-style" id="desc-input"
                                                  style="vertical-align:top;resize:none;" rows="3" cols="50"
                                                  disabled="true"><%=user.getDescription()%></textarea>
                                    </p>
                                </td>
                            </tr>
                        </table>
                        <div class="fb-btn"><input type="button" id="isEdit" value="编辑" onclick="changeState()"></div>
                        <div class="fb-btn"><input type="button" value="确认修改" onclick="changeInfo()"></div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="slide" id="2">
        <div class="content second-content">
            <div class="container-fluid">
                <div class="col-md-6" id="div1">
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
                                    <div class="col-md-6"
                                         style="border-right: 1px solid #ffffff;overflow:scroll;height: 100%"
                                         id="articlecollectdiv">
                                    </div>
                                    <div class="col-md-6" style="padding-left: 5px;overflow:scroll;height: 100%"
                                         id="competitioncollectdiv">
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
                <div class="col-md-6" id="commentdiv">
                </div>
            </div>
        </div>
    </div>

    <div class="slide" id="5">
        <div class="content fifth-content">
            <div class="container-fluid">
                <div class="new-style" style="padding-top: 60px">
                    <form id="passwordForm" action="">
                        <center>
                            <table>
                                <tr>
                                    <td><p><em>原密码：</em></p></td>
                                    <td><p><input type="password" name="oldPass" id="oldPass"></p></td>
                                </tr>
                                <tr>
                                    <td><p><em>新密码：</em></p></td>
                                    <td><p><input type="password" name="newPass" id="newPass"></p></td>
                                </tr>
                                <tr>
                                    <td><p><em>确认新密码：</em></p></td>
                                    <td><p><input type="password" name="againPass" id="againPass"></p></td>
                                </tr>
                            </table>
                            <input class="new-btn" type="button" onclick="return passwordChange()" value="确认修改">
                            <input class="new-btn" type="button" onclick="passwordReset()" value="清   空">
                        </center>
                    </form>
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
<script src="<%=basePath%>/js/personalCenter_js/getUserInfo.js"></script>


<script type="text/javascript">
    //修改密码
    function passwordChange() {
        var oldPass = document.getElementById("oldPass").value;
        var newPass = document.getElementById("newPass").value;
        var againPass = document.getElementById("againPass").value;
        //密码为空
        if ((oldPass == "") || (newPass == "") || (againPass == "")) {
            alert("密码不能为空");
        }
        //新密码不相同
        else if (newPass != againPass) {
            alert("新密码两次输入不一致");
        } else {
            getPassMsg(oldPass, newPass);
        }
        passwordReset();
    }

    <%--    ///////文章发表的ajax--%>

    function getArticleHistory() {
        let userid = {
            "id":<%= user.getId()%>
        };

        $.ajax(
            {
                url: 'articleHistory.do',
                type: 'GET',
                //contentType: 'application/json; charset=utf-8',
                datatype: "json",
                async: true,
                data: userid,
                success: function (data) {
                    // console.log(data)
                    var articleListHtml = "";
                    var div = "<div class=\"left-content\">";
                    var div3 = "<div class=\"main-btn\">";
                    var h2 = "<h2>";
                    var h22 = "</h2>";
                    var p = "<p>";
                    var p2 = "</p>";
                    var a = "<a style=\"color: #FFFFFF\">";
                    var DATE = "发表日期：";
                    var a2 = "</a>&ensp;&ensp;&ensp;\n";
                    var browse = "浏览量：";
                    var a3 = "</a>";

                    var button = "<input type=\"button\" style=\"margin-left: 20px\"\n onclick=\"window.location='<%=basePath%>article/detail.do?articleId=";
                    var button2 = "'\" value=\"更多\">\n";
                    var div2 = "</div>";
                    if (data == "[]") {
                        articleListHtml = div + h2 + "你还没有发表文章喔！" + h22 + div2;
                    } else {
                        var list = eval(data);
                        for (var i in list) {//拼接每个文章块的html代码
                            articleListHtml = articleListHtml + div +
                                h2 +
                                list[i].title +
                                h22 +
                                p +
                                "作者：" +
                                list[i].authorName +
                                p2 +
                                div3 +
                                a +
                                DATE +
                                list[i].date +
                                a2 +
                                a +
                                browse +
                                list[i].browseNum +
                                a3 +
                                button +
                                list[i].id +
                                button2 +
                                div2 +
                                div2;
                        }
                    }
                    $("#div1").html(articleListHtml);
                },
                error: function () {
                    $("#div1").html('<h2>出错啦.</h2>');
                    alert("error");
                }
            }
        )
    }

    // 收藏文章的ajax

    // 已经做过收藏文章的接口了，在/article/like.do
    // 详情查看源码注释
    function getArticleCollect() {
        let userid = {
            "id":<%= user.getId()%>
        };
        $.ajax(
            {
                url: 'myLike.do',
                type: 'GET',
                datatype: "json",
                async: true,
                data: userid,

                success: function (data) {
                    console.log(data);

                    if (data.isArticlesEmpty == 1) {
                        console.log("article is empty")
                        $("#articlecollectdiv").html("<h2>还没有收藏文章喔</h2>");
                    } else {
                        console.log(data)
                        var HtmlString = "<div style=\"float: top;position: fixed;\">" +
                            "<h2 style=\"height:26px;width:50px;border-bottom: none;background-color: rgba(0, 0, 0,0.75);\">" +
                            "文章" +
                            "</h2>" +
                            "</div>";
                        for (var i in data.articles) {
                            HtmlString = HtmlString +
                                "<div class=\"left-content\">" +
                                "<h2>" +
                                data.articles[i].title +
                                "</h2>" +
                                "<p> 热度：" +
                                data.articles[i].browseNum +
                                "</p>" +
                                "<div class=\"main-btn\">" +
                                "<input type=\"button\"" +
                                "onclick=\"window.location='<%=basePath%>article/detail.do?articleId=" +
                                data.articles[i].id +
                                "'\"value=\"查看详情\">" +
                                "</div>" +
                                "</div>";
                        }
                        $("#articlecollectdiv").html(HtmlString);
                    }
                    if (data.isCompetionEmpty == 1) {
                        console.log("competition is empty")
                        $("#competitioncollectdiv").html("<h2>还没有收藏竞赛喔</h2>");
                    } else {
                        var HtmlString = "<div style=\"float: top;position: fixed;\">" +
                            "<h2 style=\"height:26px;width:50px;border-bottom: none;background-color: rgba(0, 0, 0,0.75);\">" +
                            "竞赛"+
                            "</h2>" +
                            "</div>";;
                        for (var i in data.competitions) {
                            HtmlString = HtmlString +
                                "<div class=\"left-content\">" +
                                "<h2>" +
                                data.competitions[i].name +
                                "</h2>" +
                                "<p> 分类：" +
                                data.competitions[i].type +
                                "</p>" +
                                "<div class=\"main-btn\">" +
                                "<input type=\"button\"" +
                                "onclick=\"window.location='<%=basePath%>comp/compDetail.do?id=" +
                                data.competitions[i].id +
                                "'\"value=\"查看详情\">" +
                                "</div>" +
                                "</div>";
                        }
                        $("#competitioncollectdiv").html(HtmlString);
                    }
                },
                error: function () {
                    $("#competitioncollectdiv").html('<h2>出错啦.</h2>');
                    $("#articlecollectdiv").html('<h2>出错啦.</h2>');
                    alert("error");
                }
            }
        )
    }

    function getCommentHistory() {
        let userid = {
            "id":<%= user.getId()%>
        };
        $.ajax(
            {
                url: 'commentHistory.do',
                type: 'GET',
                datatype: "json",
                async: true,
                data: userid,
                success:function(data){
                    console.log(data);
                    if(data == "[]"){
                        $("#commentdiv").html("<h2>还没有评论喔</h2>");
                    }
                    else{
                        var list = eval(data);
                        var htmlString = "";
                        for(var i in list){
                            htmlString = htmlString+
                            "<div class=\"left-content\" >"+
                            "<a href=\"<%=basePath%>article/detail.do?articleId="+
                                list[i].articleId+
                                "\"><h3>"+
                            list[i].title+
                            "</h3></a><br>"+
                            "<p style=\"float: left\">"+
                            "我："+
                            list[i].content+
                            "</p><p style=\"float: right\">" +
                            "日期：" +
                            list[i].date +
                            "</p>"+
                            "</div>";
                            console.log(htmlString)
                        }
                        $("#commentdiv").html(htmlString);
                    }
                },
                error:function(){
                    $("#commentdiv").html('<h2>出错啦.</h2>');
                    alert("error");
                }
            }
        )
    }


</script>
</body>
</html>