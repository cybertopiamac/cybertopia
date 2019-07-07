<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    String toDetailBase = basePath+"main/compDetail.do?id=";
%>

<html lang="en" class="no-js">
<html>
<head>

    <!--以下三个用于搜索栏css-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main_css/others/style-en.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main_css/others/css-assets.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main_css/style.css"/>


    <link rel="stylesheet" href="bootstrap.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main_css/public.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main_css/jquery.bxslider.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main_js/jquery1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main_js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main_js/indexJS.js"></script>


    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--<link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.6/css/bootstrap.min.css" /><!--CSS RESET-->--%>

    <style>
        .pagination-outer {
            text-align: center;
        }

        .pagination {
            font-family: 'Oxygen', sans-serif;
            display: inline-flex;
            position: relative;
        }

        .pagination li a.page-link {
            color: #e44251;
            background-color: transparent;
            font-size: 25px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
            line-height: 200%;
            height: 45px;
            width: 45px;
            margin: 0 15px 0 0;
            border: 1px solid #e44251;
            border-radius: 0;
            position: relative;
            z-index: 1;
            transition: all 0.4s ease 0s;
        }

        .pagination li.active a.page-link,
        .pagination li a.page-link:hover,
        .pagination li.active a.page-link:hover {
            color: #fff;
            background-color: #e44251;
            border-color: #e44251;
        }

        .pagination li a.page-link:before,
        .pagination li a.page-link:after {
            content: '';
            background-color: #e44251;
            height: 100%;
            width: 100%;
            border-radius: 50%;
            transform: scale(0) rotateX(360deg);
            position: absolute;
            left: 0;
            top: 0;
            z-index: -1;
            transition: all 0.3s;
        }

        .pagination li a.page-link:after {
            background-color: transparent;
            border-radius: 0;
            transform: scale(0.7);
            transition-delay: 0.1s;
        }

        .pagination li a.page-link:hover:before {
            border-radius: 0;
            transform: scale(1) rotateX(0);
        }

        .pagination li a.page-link:hover:after {
            background-color: #e44251;
            opacity: 0;
            transform: scale(1.5);
        }

        @media only screen and (max-width: 480px) {
            .pagination {
                display: block;
                border-radius: 20px;
            }

            .pagination li {
                margin: 5px 2px;
                display: inline-block;
            }

            .pagination li a.page-link {
                margin: 0;
            }
        }
    </style>

    <script type="text/javascript">


        function getcompetition() {
            var form = document.forms[0];
            form.action = "${pageContext.request.contextPath}/comp/compList.do";
            form.method = "post";
            form.submit();
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
                <li class="active">
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


<div class="homeBox homeIdear"  align="center">
    <div class="wrap">
        <div class="homeTitle">
            <h2 id="hot">热门竞赛</h2>
            <h3><span>The hottest spot</span></h3>
            <div class="line"></div>
        </div>
        <div class="homeIdearWrap">
            <ul class="slideHomeIdear clearfloat">
                <li>
                    <h3>中国大学生计算机设计大赛</h3>
                    <div class="line"></div>
                    <div class="pic"><img src="${pageContext.request.contextPath}/temp/home.idear.img1.jpg"/></div>
                    <p>
                        大赛是创新创业人才培养计算机教育实践平台的具体举措，目的是提高大学生综合素质，具体落实、进一步推动高校本科面向21世纪的计算机教学的知识体系、课程体系、教学内容和教学……
                    </p>
                    <a href="http://jsjds.ruc.edu.cn" target="_blank">进入官网</a>
                </li>
                <li>
                    <h3>华为软件精英挑战赛</h3>
                    <div class="line"></div>
                    <div class="pic"><img src="${pageContext.request.contextPath}/temp/home.idear.img2.jpg"/></div>
                    <p>
                        华为软件精英挑战赛是华为公司面向在校大学生举办的大型软件竞赛，从2015年至今已成功举办四届。在软件精英挑战赛的舞台上，我们相信您可以充分展示软件设计与编程的能力、享受……
                    </p>
                    <a href="https://codecraft.huawei.com" target="_blank">进入官网</a>
                </li>
                <li>
                    <h3>全国并行应用挑战赛</h3>
                    <div class="line"></div>
                    <div class="pic"><img src="${pageContext.request.contextPath}/temp/home.idear.img3.jpg"/></div>
                    <p>
                        竞赛定位于中国的戈登贝尔奖，并于2014年开办“竞赛集训营”——为参赛者助跑，为从业者加速，共享平台，共赢未来。从第一届到第七届，PAC始终坚持初心，为寻找行业最佳应用、培养……
                    </p>
                    <a href="http://www.pac-hpc.com" target="_blank">进入官网</a>
                </li>
            </ul>
        </div>
    </div>
</div>

<!--搜索栏-->
<div class="search-products" id="search">
    <form id="form-search-products" class="form-inline">
        <div class="form-group">
            <div class="list-select-category">
                <select name="selectedType" id="selectedType">
                    <option  selected="selected" value="">所有种类</option>
                    <option value="计算机与互联网">计算机与互联网</option>
                    <option value="创业大赛">创业大赛</option>
                    <option value="营销策划">营销策划</option>
                    <option value="金融比赛">金融比赛</option>
                    <option value="广告创意">广告创意</option>
                    <option value="设计大赛">设计大赛</option>
                    <option value="文学演讲">文学演讲</option>
                    <option value="播音主持">播音主持</option>
                    <option value="动漫书画">动漫书画</option>
                    <option value="影视摄影">影视摄影</option>
                    <option value="学科学术">学科学术</option>
                    <option value="科技大赛">科技大赛</option>
                    <option value="公益大赛">公益大赛</option>
                </select>
            </div><!-- .list-select-category end -->
        </div><!-- .form-group end -->
        <div class="form-group">
            <input type="text" value="${keywords}" name="keywords" id="keywords" class="form-control" placeholder="全国高校智能交通创新与创业大赛" data-alt-placeholder="Search for ...">
        </div><!-- .form-group end -->
        <div class="form-group">
            <button type="submit" class="form-control" onclick="getcompetition()">Go</button>
        </div><!-- .form-group end -->
    </form><!-- #form-search-products end -->
</div>
<!-- .search-products end -->

<div class="homeBox homeJoin">
    <div class="wrap">
        <div class="homeTitle">
            <h2>竞赛库</h2>
            <h3><span>Competition Treasury</span></h3>
            <div class="line"></div>
        </div>

        <div class="homeCamWrap">
            <%--            <c:set var="i" value="${-1}" scope="session"/>--%>
            <c:forEach begin="1" end="${12}" var="pageNum" step="3">
                <ul class="homeCamList clearfloat">
                        <%--                    <c:set var="i" value="${i+1}" scope="session"/>--%>
                    <c:if test="${(pageInfo.pageNum-1)*12+pageNum<=pageInfo.total}">
                        <li>
                            <div class="pic"><a href="<%=toDetailBase%>${comps[pageNum-1].id}"><img src="${pageContext.request.contextPath}/images/competition_images/${comps[pageNum-1].id}.png"/></a></div>
                            <div class="homeCamCont">
                                <h3 class="single-line"><a href="<%=toDetailBase%>${comps[pageNum-1].id}">${comps[pageNum-1].name}</a></h3>
                                <h4>2019-${comps[pageNum].date}</h4>
                                <div class="line"></div>
                                <p class="multi-line">
                                        ${comps[pageNum].description.substring(0,50)}${'...'}
                                </p>
                                <a class="more" href="<%=toDetailBase%>${comps[pageNum-1].id}">MORE+</a>
                            </div>
                        </li>
                    </c:if>
                        <%--                    <c:set var="i" value="${i+1}" scope="session"/>--%>
                    <c:if test="${(pageInfo.pageNum-1)*12+pageNum+1<=pageInfo.total}">
                        <li>
                            <div class="pic"><a href="<%=toDetailBase%>${comps[pageNum].id}"><img src="${pageContext.request.contextPath}/images/competition_images/${comps[pageNum].id}.png"/></a></div>
                            <div class="homeCamCont">
                                <h3 class="single-line"><a href="<%=toDetailBase%>${comps[pageNum].id}"${pageContext.request.contextPath}">${comps[pageNum].name}</a></h3>
                                <h4>2019-${comps[pageNum].date}</h4>
                                <div class="line"></div>
                                <p class="multi-line">
                                        ${comps[pageNum].description.substring(0,50)}${'...'}
                                </p>
                                <a class="more" href="<%=toDetailBase%>${comps[pageNum].id}">MORE+</a>
                            </div>
                        </li>
                    </c:if>
                        <%--                    <c:set var="i" value="${i+1}" scope="session"/>--%>
                    <c:if test="${(pageInfo.pageNum-1)*12+pageNum+2<=pageInfo.total}">
                        <li>
                            <div class="pic"><a href="<%=toDetailBase%>${comps[pageNum+1].id}"><img src="${pageContext.request.contextPath}/images/competition_images/${comps[pageNum+1].id}.png"/></a></div>
                            <div class="homeCamCont">
                                <h3 class="single-line"><a href="<%=toDetailBase%>${comps[pageNum+1].id}">${comps[pageNum+1].name}</a></h3>
                                <h4>2019-${comps[pageNum+1].date}</h4>
                                <div class="line"></div>
                                <p class="multi-line">
                                        ${comps[pageNum+1].description.substring(0,50)}${'...'}
                                </p>
                                <a class="more" href="<%=basePath%>comp/compDetail.do?id=${comps[pageNum+1].id}">MORE+</a>
                            </div>
                        </li>
                    </c:if>
                </ul>
            </c:forEach>

            <div class="demo" style="min-height: 100px;">
                <div class="container">
                    <div class="row pad-15">
                        <div class="col-md-12">
                            <nav class="pagination-outer" aria-label="Page navigation">
                                <ul class="pagination">
                                    <c:if test="${pageInfo.pageNum>=2}">
                                        <c:if test="${pageInfo.pageNum-4>=1}">
                                            <li class="page-item">
                                                <a onclick="nextPage(${pageInfo.pageNum-3})" class="page-link" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${pageInfo.pageNum-4<1}">
                                            <li class="page-item">
                                                <a onclick="nextPage(1)" class="page-link" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </c:if>

                                    <c:if test="${pageInfo.pageNum>=3}">
                                        <li class="page-item"><a class="page-link" onclick="nextPage(${pageInfo.pageNum-2})">${pageInfo.pageNum-2}</a></li>
                                        <li class="page-item"><a class="page-link" onclick="nextPage(${pageInfo.pageNum-1})">${pageInfo.pageNum-1}</a></li>
                                    </c:if>
                                    <c:if test="${pageInfo.pageNum==2}">
                                        <li class="page-item"><a class="page-link" onclick="nextPage(1)">1</a></li>
                                    </c:if>

                                    <li class="page-item active"><a class="page-link" onclick="nextPage(${pageInfo.pageNum})">${pageInfo.pageNum}</a></li>

                                    <c:if test="${pageInfo.pageNum<=pageInfo.pages-2}">
                                        <li class="page-item"><a class="page-link" onclick="nextPage(${pageInfo.pageNum+1})" >${pageInfo.pageNum+1}</a></li>
                                        <li class="page-item"><a class="page-link" onclick="nextPage(${pageInfo.pageNum+2})">${pageInfo.pageNum+2}</a></li>
                                    </c:if>
                                    <c:if test="${pageInfo.pageNum==pageInfo.lastPage-1}">
                                        <li class="page-item"><a class="page-link" onclick="nextPage(${pageInfo.lastPage})">${pageInfo.lastPage}</a></li>
                                    </c:if>


                                    <c:if test="${pageInfo.pageNum<=pageInfo.lastPage-1}">
                                        <c:if test="${pageInfo.pageNum<=pageInfo.pages-4}">
                                            <li class="page-item">
                                                <a onclick="nextPage(${pageInfo.pageNum+3})" class="page-link" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${pageInfo.pageNum>pageInfo.pages-4}">
                                            <li class="page-item">
                                                <a onclick="nextPage(${pageInfo.lastPage})" class="page-link" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </c:if>
                                    <%--                            </c:forEach>--%>

                                </ul>


                            </nav>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>



<div class="homeLink">
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




</body>


<script type="text/javascript">
    $('.sliderBanner').bxSlider({
        'auto':true,
        'controls':true,
        'touchEnabled':true,
        'pager':true,
        'speed':1000,
        'pause':4000,
        'pagerType': 'full',

    })
</script>

<script type="text/javascript">
    //"${pageContext.request.contextPath}/main/index.do?page=${pageInfo.pageNum-3}&selectedType=${selectedType}&keywords=${keywords}"
    function nextPage(pageN){
        var tmp_selectedType="${selectedType}";
        var tmp_keywords="${keywords}";
        var url= "${pageContext.request.contextPath}/comp/compList.do?page="+pageN+"&selectedType="+encodeURI(encodeURI(tmp_selectedType))+"&keywords="+encodeURI(encodeURI(tmp_keywords))+"#search";


        window.location.href =url;
    }
</script>
</html>
