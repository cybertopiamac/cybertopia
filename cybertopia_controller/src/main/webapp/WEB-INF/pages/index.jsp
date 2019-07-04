<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html lang="en" class="no-js">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main_css/public.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main_css/jquery.bxslider.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main_css/style.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main_js/jquery1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main_js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main_js/indexJS.js"></script>
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

<!--banner-->
<div class="banner" id="banner">
    <ul class="sliderBanner">
        <li>
            <a href="https://job.bytedance.com/campus/position"><img src="${pageContext.request.contextPath}/temp/banner.img.jpg"/></a>
        </li>
        <li>
            <a href="https://job.alibaba.com"><img src="${pageContext.request.contextPath}/temp/banner1.img.jpg"/></a>
        </li>
        <li>
            <a href=""><img src="${pageContext.request.contextPath}/temp/banner0.img.jpg"/></a>
        </li>
    </ul>
</div>
<!--/banner-->

<div class="homeBox homeIdear">
    <div class="wrap">
        <div class="homeTitle">
            <h2>当前热门</h2>
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
                    <a href="">+</a>
                </li>
                <li>
                    <h3>华为软件精英挑战赛</h3>
                    <div class="line"></div>
                    <div class="pic"><img src="${pageContext.request.contextPath}/temp/home.idear.img2.jpg"/></div>
                    <p>
                        华为软件精英挑战赛是华为公司面向在校大学生举办的大型软件竞赛，从2015年至今已成功举办四届。在软件精英挑战赛的舞台上，我们相信您可以充分展示软件设计与编程的能力、享受……
                    </p>
                    <a href="">+</a>
                </li>
                <li>
                    <h3>全国并行应用挑战赛</h3>
                    <div class="line"></div>
                    <div class="pic"><img src="${pageContext.request.contextPath}/temp/home.idear.img3.jpg"/></div>
                    <p>
                        竞赛定位于中国的戈登贝尔奖，并于2014年开办“竞赛集训营”——为参赛者助跑，为从业者加速，共享平台，共赢未来。从第一届到第七届，PAC始终坚持初心，为寻找行业最佳应用、培养……
                    </p>
                    <a href="">+</a>
                </li>
            </ul>
        </div>
    </div>
</div>

<%--<div class="homeBox homeCour">--%>
<%--    <div class="wrap">--%>
<%--        <div class="homeTitle">--%>
<%--            <h2>课程介绍</h2>--%>
<%--            <h3><span>Course introduction</span></h3>--%>
<%--            <div class="line"></div>--%>
<%--        </div>--%>
<%--        <div class="homeCourWrap">--%>
<%--            <ul class="homeCourList clearfloat">--%>
<%--                <li><a href="">--%>
<%--                    <div class="homeCourInner">--%>
<%--                        <div class="pic"><img src="${pageContext.request.contextPath}/images/main_images/home.cour.img1.png"/></div>--%>
<%--                        <h3>雪地课程</h3>--%>
<%--                        <h4>SNOW COURSE</h4>--%>
<%--                    </div>--%>
<%--                    <div class="homeCourTxt">--%>
<%--                        <h3>雪地课程</h3>--%>
<%--                        <h4>SNOW COURSE</h4>--%>
<%--                        <p>--%>
<%--                            主营帆船培训和航海夏、冬令营，--%>
<%--                            致力于青少年帆船运动的推广和航海--%>
<%--                            文化的传播。是中国大陆唯一获得英国皇家--%>
<%--                            游艇协会RYA认证的中心，并使用其--%>
<%--                            证教练团队。--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                </a></li>--%>
<%--                <li><a href="">--%>
<%--                    <div class="homeCourInner">--%>
<%--                        <div class="pic"><img src="${pageContext.request.contextPath}/images/main_images/home.cour.img2.png"/></div>--%>
<%--                        <h3>海洋课程</h3>--%>
<%--                        <h4>MARINE CURRICULUM</h4>--%>
<%--                    </div>--%>
<%--                    <div class="homeCourTxt">--%>
<%--                        <h3>海洋课程</h3>--%>
<%--                        <h4>MARINE CURRICULUM</h4>--%>
<%--                        <p>--%>
<%--                            主营帆船培训和航海夏、冬令营，--%>
<%--                            致力于青少年帆船运动的推广和航海--%>
<%--                            文化的传播。是中国大陆唯一获得英国皇家--%>
<%--                            游艇协会RYA认证的中心，并使用其--%>
<%--                            证教练团队。--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                </a></li>--%>
<%--                <li><a href="">--%>
<%--                    <div class="homeCourInner">--%>
<%--                        <div class="pic"><img src="${pageContext.request.contextPath}/images/main_images/home.cour.img3.png"/></div>--%>
<%--                        <h3>语言课程</h3>--%>
<%--                        <h4>LANGUAGE COURSE</h4>--%>
<%--                    </div>--%>
<%--                    <div class="homeCourTxt">--%>
<%--                        <h3>语言课程</h3>--%>
<%--                        <h4>LANGUAGE COURSE</h4>--%>
<%--                        <p>--%>
<%--                            主营帆船培训和航海夏、冬令营，--%>
<%--                            致力于青少年帆船运动的推广和航海--%>
<%--                            文化的传播。是中国大陆唯一获得英国皇家--%>
<%--                            游艇协会RYA认证的中心，并使用其--%>
<%--                            证教练团队。--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                </a></li>--%>
<%--                <li><a href="">--%>
<%--                    <div class="homeCourInner">--%>
<%--                        <div class="pic"><img src="${pageContext.request.contextPath}/images/main_images/home.cour.img4.png"/></div>--%>
<%--                        <h3>综合课程</h3>--%>
<%--                        <h4>INTERATED COURSE</h4>--%>
<%--                    </div>--%>
<%--                    <div class="homeCourTxt">--%>
<%--                        <h3>综合课程</h3>--%>
<%--                        <h4>INTERATED COURSE</h4>--%>
<%--                        <p>--%>
<%--                            主营帆船培训和航海夏、冬令营，--%>
<%--                            致力于青少年帆船运动的推广和航海--%>
<%--                            文化的传播。是中国大陆唯一获得英国皇家--%>
<%--                            游艇协会RYA认证的中心，并使用其--%>
<%--                            证教练团队。--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                </a></li>--%>
<%--            </ul>--%>

<%--        </div>--%>

<%--    </div>--%>
<%--</div>--%>

<div class="homeBox homeJoin">
    <div class="wrap">
<%--        <div class="homeTitle">--%>
<%--            <h2>加入我们</h2>--%>
<%--            <h3><span>Join us</span></h3>--%>
<%--            <div class="line"></div>--%>
<%--        </div>--%>
<%--        <div class="homeJoinWrap">--%>
<%--            <ul class="homeJoinList clearfloat">--%>
<%--                <li>--%>
<%--                    <div class="pic"><img src="${pageContext.request.contextPath}/temp/home.join.img1.jpg"/></div>--%>
<%--                    <a href="" class="homeJoinBg">--%>
<%--                        <div class="homeJoinBgInner">--%>
<%--                            <h3>招生专区</h3>--%>
<%--                            <h4>ENROLMENT AREA<span></span></h4>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <div class="pic"><img src="${pageContext.request.contextPath}/temp/home.join.img2.jpg"/></div>--%>
<%--                    <a href="" class="homeJoinBg">--%>
<%--                        <div class="homeJoinBgInner">--%>
<%--                            <h3>招聘专区</h3>--%>
<%--                            <h4>RECRUITMENT AREA<span></span></h4>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--            </ul>--%>

<%--        </div>--%>

        <div class="homeTitle">
            <h2>校园动态</h2>
            <h3><span>Campus dynamics</span></h3>
            <div class="line"></div>
        </div>

        <div class="homeCamWrap">
            <ul class="homeCamList clearfloat">
                <li>
                    <div class="pic"><a href=""><img src="${pageContext.request.contextPath}/temp/home.cum.img1.jpg"/></a></div>
                    <div class="homeCamCont">
                        <h3 class="single-line"><a href="">会员收费活动 | 英语思维之桌游系列</a></h3>
                        <h4>2018-07-10</h4>
                        <div class="line"></div>
                        <p class="multi-line">
                            我们为您准备了 30-500 人的各类活动专用场地，并配备了音箱、投影、桌椅、茶歇等增值服务。我们撤掉…
                        </p>
                        <a class="more" href="">MORE+</a>
                    </div>
                </li>
                <li>
                    <div class="pic"><a href=""><img src="${pageContext.request.contextPath}/temp/home.cum.img2.jpg"/></a></div>
                    <div class="homeCamCont">
                        <h3 class="single-line"><a href="">会员收费活动 | 英语思维之桌游系列</a></h3>
                        <h4>2018-07-10</h4>
                        <div class="line"></div>
                        <p class="multi-line">
                            我们为您准备了 30-500 人的各类活动专用场地，并配备了音箱、投影、桌椅、茶歇等增值服务。我们撤掉…
                        </p>
                        <a class="more" href="">MORE+</a>
                    </div>
                </li>
                <li>
                    <div class="pic"><a href=""><img src="${pageContext.request.contextPath}/temp/home.cum.img3.jpg"/></a></div>
                    <div class="homeCamCont">
                        <h3 class="single-line"><a href="">会员收费活动 | 英语思维之桌游系列</a></h3>
                        <h4>2018-07-10</h4>
                        <div class="line"></div>
                        <p class="multi-line">
                            我们为您准备了 30-500 人的各类活动专用场地，并配备了音箱、投影、桌椅、茶歇等增值动专用场地，并配备了音箱、投影、桌椅、茶歇等增值服务。我们撤掉…
                        </p>
                        <a class="more" href="">MORE+</a>
                    </div>
                </li>
            </ul>
            <ul class="homeCamList clearfloat">
                <li>
                    <div class="pic"><a href=""><img src="${pageContext.request.contextPath}/temp/home.cum.img1.jpg"/></a></div>
                    <div class="homeCamCont">
                        <h3 class="single-line"><a href="">会员收费活动 | 英语思维之桌游系列</a></h3>
                        <h4>2018-07-10</h4>
                        <div class="line"></div>
                        <p class="multi-line">
                            我们为您准备了 30-500 人的各类活动专用场地，并配备了音箱、投影、桌椅、茶歇等增值服务。我们撤掉…
                        </p>
                        <a class="more" href="">MORE+</a>
                    </div>
                </li>
                <li>
                    <div class="pic"><a href=""><img src="${pageContext.request.contextPath}/temp/home.cum.img2.jpg"/></a></div>
                    <div class="homeCamCont">
                        <h3 class="single-line"><a href="">会员收费活动 | 英语思维之桌游系列</a></h3>
                        <h4>2018-07-10</h4>
                        <div class="line"></div>
                        <p class="multi-line">
                            我们为您准备了 30-500 人的各类活动专用场地，并配备了音箱、投影、桌椅、茶歇等增值服务。我们撤掉…
                        </p>
                        <a class="more" href="">MORE+</a>
                    </div>
                </li>
                <li>
                    <div class="pic"><a href=""><img src="${pageContext.request.contextPath}/temp/home.cum.img3.jpg"/></a></div>
                    <div class="homeCamCont">
                        <h3 class="single-line"><a href="">会员收费活动 | 英语思维之桌游系列</a></h3>
                        <h4>2018-07-10</h4>
                        <div class="line"></div>
                        <p class="multi-line">
                            我们为您准备了 30-500 人的各类活动专用场地，并配备了音箱、投影、桌椅、茶歇等增值动专用场地，并配备了音箱、投影、桌椅、茶歇等增值服务。我们撤掉…
                        </p>
                        <a class="more" href="">MORE+</a>
                    </div>
                </li>
            </ul>
            <ul class="homeCamList clearfloat">
                <li>
                    <div class="pic"><a href=""><img src="${pageContext.request.contextPath}/temp/home.cum.img1.jpg"/></a></div>
                    <div class="homeCamCont">
                        <h3 class="single-line"><a href="">会员收费活动 | 英语思维之桌游系列</a></h3>
                        <h4>2018-07-10</h4>
                        <div class="line"></div>
                        <p class="multi-line">
                            我们为您准备了 30-500 人的各类活动专用场地，并配备了音箱、投影、桌椅、茶歇等增值服务。我们撤掉…
                        </p>
                        <a class="more" href="">MORE+</a>
                    </div>
                </li>
                <li>
                    <div class="pic"><a href=""><img src="${pageContext.request.contextPath}/temp/home.cum.img2.jpg"/></a></div>
                    <div class="homeCamCont">
                        <h3 class="single-line"><a href="">会员收费活动 | 英语思维之桌游系列</a></h3>
                        <h4>2018-07-10</h4>
                        <div class="line"></div>
                        <p class="multi-line">
                            我们为您准备了 30-500 人的各类活动专用场地，并配备了音箱、投影、桌椅、茶歇等增值服务。我们撤掉…
                        </p>
                        <a class="more" href="">MORE+</a>
                    </div>
                </li>
                <li>
                    <div class="pic"><a href=""><img src="${pageContext.request.contextPath}/temp/home.cum.img3.jpg"/></a></div>
                    <div class="homeCamCont">
                        <h3 class="single-line"><a href="">会员收费活动 | 英语思维之桌游系列</a></h3>
                        <h4>2018-07-10</h4>
                        <div class="line"></div>
                        <p class="multi-line">
                            我们为您准备了 30-500 人的各类活动专用场地，并配备了音箱、投影、桌椅、茶歇等增值动专用场地，并配备了音箱、投影、桌椅、茶歇等增值服务。我们撤掉…
                        </p>
                        <a class="more" href="">MORE+</a>
                    </div>
                </li>
            </ul>
        </div>

    </div>
</div>

<div class="homeLink">
    <div class="wrap">
        <div class="homeTitle">
            <h2>友情链接</h2>
            <h3><span>friendly link</span></h3>
            <div class="line"></div>
        </div>
        <div class="homeLinkWrap">
            <a href="http://www.saikr.com">赛氪</a><a href="http://www.52jingsai.com/portal.php">我爱竞赛网</a> <a href="http://jsjds.ruc.edu.cn">中国大学生计算机设计大赛</a><a href="http://www.mcm.edu.cn">全国大学生数学建模竞赛</a><a href="http://www.cnccac.com/case3.php">全国大学生C语言设计大赛</a>
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
</html>
