<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    String toDetailBase = basePath+"main/compDetail.do?id=";
%>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Contact Us - Drubo</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/css/main_css/others1/images/icon/favicon.ico">
    <!-- Place favicon.ico in the root directory -->

    <!-- All css files are included here. -->
    <!-- Bootstrap fremwork main css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_css/others1/bootstrap.min.css">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_css/others1/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_css/others1/shortcodes.css">
    <!-- Nivo Slider -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_css/others1/nivo-slider.css">
    <!-- Magnific Popup Css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_css/others1/magnific-popup.css">
    <!-- Material design iconic font Css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_css/others1/material-design-iconic-font.min.css">
    <!-- Venubox Css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_css/others1/venobox.css">
    <!-- Owl carsoul Css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_css/others1/owl.carousel.css">
    <!-- Mean Menu Css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_css/others1/meanmenu.min.css">
    <!-- Theme main style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_css/others1/style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_css/others1/responsive.css">
    <!-- User style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_css/others1/custom.css">
    <!-- Style customizer Css -->
    <link href="#" data-style="styles" rel="stylesheet">
    <!-- Modernizr JS -->
    <script src="${pageContext.request.contextPath}/js/main_js/modernizr-2.8.3.min.js"></script>

</head>

<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

<!-- Body main wrapper start -->
<div class="wrapper">
    <!-- Start of header area -->
    <header class="header-wrapper">
        <!-- Header Top Area Start -->
        <div class="header-top-area">
            <div class="container">
                <div class="row">
                    <!-- Header Top Left Start -->
                    <div class="col-md-6 col-sm-7 col-xs-12">
                        <div class="header-left ptb-15">
                            <ul>
                                <li><span><i class="zmdi zmdi-phone"></i></span><a href="#">(+880) 01725911643</a></li>
                                <li><span><i class="zmdi zmdi-email"></i></span><a href="#">breed@gmail.com</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Header Top Left End -->
                    <!-- Header Top Right Start -->
                    <div class="col-md-6 col-sm-5 col-xs-12">
                        <div class="header-right social-icon pull-right">
                            <ul>
                                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                                <li class="search-active">
                                    <a href="#"><i class="zmdi zmdi-search"></i></a>
                                    <div class="search-form">
                                        <form action="#" method="get">
                                            <input name="search" id="search" placeholder="Search" type="text">
                                        </form>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- Header Top Right End -->
                </div>
            </div>
        </div>
        <!-- Header Top Area End -->

        <!-- Header Menu Area End -->
    </header>
    <!-- End of header area -->
    <!-- Banner Area Start -->
    <div class="banner-area pt-130 pb-120 bg-7 overlay-2">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="banner-page text-center text-white text-uppercase">
                        <h1>CONTACt US</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner Area End -->
    <!-- Breadcrumb Area Start -->
    <div class="breadcrumb-area ptb-25 broder-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-list text-center text-uppercase">
                        <ul>
                            <li><a href="index.html">home</a><span class="divider"> // </span></li>
                            <li class="active">Contact Us</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Area End -->
    <!-- Google Map Area Start -->
    <section class="map-area-main two">
        <div class="container-fluid">
            <div class="map-area">
                <div id="googleMap" style="width:100%;height:500px;"></div>
            </div>
        </div>
        <div class="container">
            <div class="row pb-100">
                <!-- Contact Left Area Start -->
                <div class="col-md-6">
                    <div class="help-contact-area white-bg shadow ptb-100">
                        <div class="section-title text-center">
                            <h4>Leave a Massage</h4>
                        </div>
                        <form id="contact-form" class="form-group" method="POST" action="mail.php">
                            <div class="form-single">
                                <input type="text" name="name" required id="name" placeholder="Name *" class="form-control">
                            </div>
                            <div class="form-single">
                                <input type="text" name="email" required id="email" placeholder="E-mail *" class="form-control">
                            </div>
                            <div class="form-textarea">
                                <textarea name="message" required id="message" placeholder="Massage *" rows="6" class="form-control"></textarea>
                            </div>
                            <div class="contact-button">
                                <button class="contact-submit" type="submit">send message</button>
                                <p class="form-messege"></p>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- Contact Left Area Start -->
                <!-- Contact Right Area Start -->
                <div class="col-md-6">
                    <div class="cntct-right-adrs pl-80 pt-90">
                        <div class="section-title text-left">
                            <h4>Contact Us</h4>
                        </div>
                        <div class="adrs-details mt-60">
                            <ul>
                                <li>
                                    <a href="#"><i class="zmdi zmdi-pin"></i></a>
                                    <p>John Bin, Main Road, Holl Town,  USA 8005</p>
                                </li>
                                <li>
                                    <a href="#"><i class="zmdi zmdi-email"></i></a>
                                    <p>(+008) 340 - 985 - 3125 (+008) 304 - 985 - 3125</p>
                                </li>
                                <li>
                                    <a href="#"><i class="zmdi zmdi-phone"></i></a>
                                    <p>admin@hastech.company bestcareerbd@gmail.com</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Contact Right Area End -->
            </div>
        </div>
    </section>
    <!-- Google Map Area End -->
    <!-- Start footer area -->
    <footer class="footer-area ptb-100 black-half-bg">
        <div class="container">
            <div class="row">
                <!-- Fotter Single Area  -->
                <div class="col-md-3 col-sm-4 col-xs-12 res-pb-xs-30">
                    <div class="footer-menu text-white">
                        <h6>Contact us</h6>
                        <div class="contact-details text-white">
                            <ul>
                                <li>
                                    <a href="#"><i class="zmdi zmdi-pin"></i></a>
                                    <p>House No 08, Road No 08,Din Bari, Dhaka, Bangladesh</p>
                                </li>
                                <li>
                                    <a href="#"><i class="zmdi zmdi-email"></i></a>
                                    <p>Username@gmail.com Damo@gmail.com</p>
                                </li>
                                <li>
                                    <a href="#"><i class="zmdi zmdi-phone"></i></a>
                                    <p>(+660 256 24857)(+660 256 24857)</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Fotter Single Area  -->
                <!-- Fotter Single Area  -->
                <div class="col-md-3 col-sm-4 col-xs-12 res-pb-xs-30">
                    <div class="footer-menu">
                        <h6>Recent post</h6>
                        <div class="recent-post">
                            <ul>
                                <li>
                                    <img src="${pageContext.request.contextPath}/css/main_css/others1/images/post/1.png" alt="" />
                                    <h5><a href="#">Ut enim</a> ad minim nostrud</h5>
                                    <span>Oct 3, 2016 7 Comments</span>
                                </li>
                                <li>
                                    <img src="${pageContext.request.contextPath}/css/main_css/others1/images/post/2.png" alt="" />
                                    <h5>Ut enim ad <a href="#">minim</a> nostrud</h5>
                                    <span>Oct 3, 2016 7 Comments</span>
                                </li>
                                <li>
                                    <img src="${pageContext.request.contextPath}/css/main_css/others1/images/post/3.png" alt="" />
                                    <h5><a href="#">Ut enim</a> ad minim nostrud</h5>
                                    <span>Oct 3, 2016 7 Comments</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Fotter Single Area  -->
                <!-- Fotter Single Area  -->
                <div class="col-md-3 hidden-sm hidden-xs">
                    <div class="footer-menu pl-60">
                        <h6>QUICK LINKS</h6>
                        <div class="quick-link">
                            <ul>
                                <li>
                                    <a href="#">Home</a>
                                </li>
                                <li>
                                    <a href="#">About</a>
                                </li>
                                <li>
                                    <a href="#">Team</a>
                                </li>
                                <li>
                                    <a href="#">Services</a>
                                </li>
                                <li>
                                    <a href="#">Portfolio</a>
                                </li>
                                <li>
                                    <a href="#">Contact Us</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Fotter Single Area  -->
                <!-- Fotter Single Area  -->
                <div class="col-md-3 col-sm-4 col-xs-12">
                    <div class="footer-menu">
                        <h6>NEWSLETTER</h6>
                        <div class="newsletter">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor </p>
                            <form id="mc-form" class="mc-form">
                                <div class="newsletter-form">
                                    <input type="email" autocomplete="off" id="mc-email" placeholder="Enter your mail" class="form-control">
                                    <button class="mc-submit" type="submit">SEND MESSAEGE</button>
                                    <!-- mailchimp-alerts Start -->
                                    <div class="mailchimp-alerts text-centre">
                                        <div class="mailchimp-submitting"></div><!-- mailchimp-submitting end -->
                                        <div class="mailchimp-success"></div><!-- mailchimp-success end -->
                                        <div class="mailchimp-error"></div><!-- mailchimp-error end -->
                                    </div>
                                    <!-- mailchimp-alerts end -->
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Fotter Single Area  -->
            </div>
        </div>
    </footer>
    <!-- End footer area -->
    <!-- Footer Bottom Area Start -->
    <div class="footer-bottom ptb-20 black-bg">
        <div class="container">
            <div class="row">
                <div class="footer-copyright text-center text-white">
                    <p>©<a href="#"> HasTech </a>2016. All Rights Reserved.</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer Bottom Area End -->

</div>
<!-- Body main wrapper end -->

<!-- Placed js at the end of the document so the pages load faster -->

<!-- jquery latest version -->
<script src="${pageContext.request.contextPath}/js/main_js/others/vendor/jquery-1.12.4.min.js"></script>
<!-- Bootstrap framework js -->
<script src="${pageContext.request.contextPath}/js/main_js/others/bootstrap.min.js"></script>
<!-- All js plugins included in this file. -->
<script src="${pageContext.request.contextPath}/js/main_js/others/plugins.js"></script>
<!-- Nivo Slider -->
<script src="${pageContext.request.contextPath}/js/main_js/others/jquery.nivo.slider.pack.js"></script>
<!-- Magnific Popup -->
<script src="${pageContext.request.contextPath}/js/main_js/others/jquery.magnific-popup.min.js"></script>
<!-- Isotope js -->
<script src="${pageContext.request.contextPath}/js/main_js/others/isotope.pkgd.min.js"></script>
<!-- Venobox js -->
<script src="${pageContext.request.contextPath}/js/main_js/others/venobox.min.js"></script>
<!-- Owl Carosel js -->
<script src="${pageContext.request.contextPath}/js/main_js/others/owl.carousel.min.js"></script>
<!-- Mean Menu js -->
<script src="${pageContext.request.contextPath}/js/main_js/others/jquery.meanmenu.js"></script>
<!-- Imageloaded js -->
<script src="${pageContext.request.contextPath}/js/main_js/others/imagesloaded.pkgd.min.js"></script>
<!-- Counter Up -->
<script src="${pageContext.request.contextPath}/js/main_js/others/jquery.counterup.min.js"></script>
<!-- Circular Progress Knob js -->
<script src="${pageContext.request.contextPath}/js/main_js/others/jquery.knob.js"></script>
<!-- Circular Progress Appear js -->
<script src="${pageContext.request.contextPath}/js/main_js/others/jquery.appear.js"></script>
<!-- ajax mail js  -->
<script src="${pageContext.request.contextPath}/js/main_js/others/ajax-mail.js"></script>
<!-- mail Chimp  -->
<script src="${pageContext.request.contextPath}/js/main_js/others/jquery.ajaxchimp.min.js"></script>
<!-- Waypoints js -->
<script src="${pageContext.request.contextPath}/js/main_js/others/jquery.waypoints.min.js"></script>
<!-- Google Map js -->
<script src="http://ditu.google.cn/maps/api/js"></script>
<script>
    function initialize() {
        var mapOptions = {
            zoom: 16,
            scrollwheel: false,
            center: new google.maps.LatLng(34.073781, -84.302295)
        };

        var map = new google.maps.Map(document.getElementById('googleMap'),
            mapOptions);


        var marker = new google.maps.Marker({
            position: map.getCenter(),
            animation:google.maps.Animation.BOUNCE,
            icon: '${pageContext.request.contextPath}/css/main_css/others1/images/icon/map-icon.png',
            map: map
        });

    }

    google.maps.event.addDomListener(window, 'load', initialize);
</script>
<!-- Main js file that contents all jQuery plugins activation. -->
<script src="js/main.js"></script>

</body>

</html>
