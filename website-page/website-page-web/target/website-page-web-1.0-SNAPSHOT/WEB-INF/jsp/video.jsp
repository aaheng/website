<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs
================================================== -->
    <meta charset="utf-8">
    <title>教学视频</title>
    <meta name="description" content="Free Responsive Html5 Css3 Templates | zerotheme.com">
    <meta name="author" content="www.zerotheme.com">

    <!-- Mobile Specific Metas
================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
================================================== -->

    <link rel="stylesheet" href="/css/video/zerogrid.css">
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/css/video/style.css">
    <!-- Owl Carousel Assets -->
    <link href="/css/video/owl.carousel.css" rel="stylesheet">
    <link href="/css/video/owl.theme.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>

</head>
<body id="wrapper">
<div class="layui-layout layui-layout-admin">
    <div class="wrap-body">
        <!--////////////////////////////////////Header-->
        <jsp:include page="header.jsp"/>
        <!--////////////////////////////////////Container-->
        <section id="container" class="index-page">
            <div class="wrap-container zerogrid">
                <!------------------------------------->
                <div class="row">
                    <div class="header">
                        <h2>Most Viewed Videos</h2>
                        <a href="javascript:void(0);" onclick="uploadVideo()">
                            <span style="width: 600px"><i class="fa fa-cloud-upload"
                                                          style="font-size: 30px;">上传</i></span>
                        </a>
                    </div>
                    <div class="row">
                        <div class="most-viewed">
                            <div class="col-2-4">
                                <div class="wrap-col">
                                    <div class="zoom-container" style="padding-top: 0px;">
                                        <a href="/video/detail">
                                            <video width="550" height="400" controls>
                                                <source src="/video/test.mp4" type="video/mp4">
                                            </video>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="extra">
                            <div class="col-1-4">
                                <div class="wrap-col">
                                    <div class="zoom-container">
                                        <a href="single.html">
									<span class="zoom-caption">
										<i class="icon-play fa fa-play"></i>
									</span>
                                            <img src="/images/1.jpg"/>
                                        </a>
                                    </div>
                                    <div class="zoom-container">
                                        <a href="single.html">
									<span class="zoom-caption">
										<i class="icon-play fa fa-play"></i>
									</span>
                                            <img src="/images/2.jpg"/>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-1-4">
                                <div class="wrap-col">
                                    <div class="zoom-container">
                                        <a href="single.html">
									<span class="zoom-caption">
										<i class="icon-play fa fa-play"></i>
									</span>
                                            <img src="/images/5.jpg"/>
                                        </a>
                                    </div>
                                    <div class="zoom-container">
                                        <a href="single.html">
									<span class="zoom-caption">
										<i class="icon-play fa fa-play"></i>
									</span>
                                            <img src="/images/14.jpg"/>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div id="main-content" class="col-2-3">
                        <div class="wrap-content">
                            <h2>视频列表</h2>
                            <section class="vid-tv">
                                <div>
                                    <c:forEach var="video" items="${videoList}">

                                        <div class="zoom-container"
                                             style="width: 260px;height: 300px;padding-left: 10px">
                                            <a href="/video/detail/${video.id}">
                                                <video width="200" height="200" controls>
                                                    <source src="/${video.path}" type="video/mp4">
                                                </video>
                                            </a>
                                            <h3 class="vid-name"><a href="#">${video.titleOrig}</a></h3>
                                            <div class="info">
                                                <h5>By <a href="#">Kelvin</a></h5>
                                                <span><i class="fa fa-calendar"></i>${video.uploadTime}</span>
                                                <span><i class="fa fa-heart"></i>1,200</span>
                                            </div>
                                        </div>


                                    </c:forEach>
                                </div>
                            </section>
                        </div>
                    </div>
                    <%-- <div id="sidebar" class="col-1-3">
                         <form id="form-container" action="">
                             <!--<input type="submit" id="searchsubmit" value="" />-->
                             <a class="search-submit-button" href="javascript:void(0)">
                                 <i class="fa fa-search"></i>
                             </a>
                             <div id="searchtext">
                                 <input type="text" id="s" name="s" placeholder="Search Something...">
                             </div>
                         </form>
                         <!---- Start Widget ---->
                         <div class="widget wid-post">
                             <div class="wid-header">
                                 <h5>Latest Posts</h5>
                             </div>
                             <div class="wid-content">
                                 <div class="post wrap-vid">
                                     <div class="zoom-container">
                                         <a href="single.html">
                                         <span class="zoom-caption">
                                             <i class="icon-play fa fa-play"></i>
                                         </span>
                                             <img src="/images/4.jpg"/>
                                         </a>
                                     </div>
                                     <div class="wrapper">
                                         <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                         <div class="info">
                                             <h6>By <a href="#">Kelvin</a></h6>
                                             <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                             <span><i class="fa fa-heart"></i>1,200</span>
                                         </div>
                                     </div>
                                 </div>
                                 <div class="post wrap-vid">
                                     <div class="zoom-container">
                                         <a href="single.html">
                                         <span class="zoom-caption">
                                             <i class="icon-play fa fa-play"></i>
                                         </span>
                                             <img src="/images/14.jpg"/>
                                         </a>
                                     </div>
                                     <div class="wrapper">
                                         <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                         <div class="info">
                                             <h6>By <a href="#">Kelvin</a></h6>
                                             <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                             <span><i class="fa fa-heart"></i>1,200</span>
                                         </div>
                                     </div>
                                 </div>
                                 <div class="post wrap-vid">
                                     <div class="zoom-container">
                                         <a href="single.html">
                                         <span class="zoom-caption">
                                             <i class="icon-play fa fa-play"></i>
                                         </span>
                                             <img src="/images/3.jpg"/>
                                         </a>
                                     </div>
                                     <div class="wrapper">
                                         <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                         <div class="info">
                                             <h6>By <a href="#">Kelvin</a></h6>
                                             <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                             <span><i class="fa fa-heart"></i>1,200</span>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <!---- Start Widget ---->
                         <div class="widget wid-news">
                             <div class="wid-header">
                                 <h5>Top News</h5>
                             </div>
                             <div class="wid-content">
                                 <div class="row">
                                     <div class="wrap-vid">
                                         <div class="zoom-container">
                                             <a href="single.html">
                                             <span class="zoom-caption">
                                                 <i class="icon-play fa fa-play"></i>
                                             </span>
                                                 <img src="/images/1.jpg"/>
                                             </a>
                                         </div>
                                         <h3 class="vid-name">Video's Name</h3>
                                         <div class="info">
                                             <h5>By <a href="#">Kelvin</a></h5>
                                             <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                             <span><i class="fa fa-heart"></i>1,200</span>
                                         </div>
                                     </div>
                                 </div>
                                 <div class="row">
                                     <div class="wrap-vid">
                                         <div class="zoom-container">
                                             <a href="single.html">
                                             <span class="zoom-caption">
                                                 <i class="icon-play fa fa-play"></i>
                                             </span>
                                                 <img src="/images/2.jpg"/>
                                             </a>
                                         </div>
                                         <h3 class="vid-name">Video's Name</h3>
                                         <div class="info">
                                             <h5>By <a href="#">Kelvin</a></h5>
                                             <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                             <span><i class="fa fa-heart"></i>1,200</span>
                                         </div>
                                     </div>
                                 </div>
                                 <div class="row">
                                     <div class="wrap-vid">
                                         <div class="zoom-container">
                                             <a href="single.html">
                                             <span class="zoom-caption">
                                                 <i class="icon-play fa fa-play"></i>
                                             </span>
                                                 <img src="/images/4.jpg"/>
                                             </a>
                                         </div>
                                         <h3 class="vid-name">Video's Name</h3>
                                         <div class="info">
                                             <h5>By <a href="#">Kelvin</a></h5>
                                             <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                             <span><i class="fa fa-heart"></i>1,200</span>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>--%>
                </div>
            </div>
        </section>

        <!--////////////////////////////////////Footer-->
        <footer>
            <div class="zerogrid top-footer">
                <div class="row">
                    <div class="col-1-5">
                        <a href="#"><img src="/images/15.jpg"/></a>
                    </div>
                    <div class="col-1-5">
                        <a href="#"><img src="/images/16.jpg"/></a>
                    </div>
                    <div class="col-1-5">
                        <a href="#"><img src="/images/17.jpg"/></a>
                    </div>
                    <div class="col-1-5">
                        <a href="#"><img src="/images/18.jpg"/></a>
                    </div>
                    <div class="col-1-5">
                        <a href="#"><img src="/images/19.jpg"/></a>
                    </div>
                </div>
            </div>
            <div class="zerogrid wrap-footer">
                <div class="row">
                    <div class="col-1-4 col-footer-1">
                        <div class="wrap-col">
                            <a href="index.html" class="logo"><img src="/images/logo.png"/></a>
                            <p>Ut volutpat consectetur aliquam. Curabitur auctor in nis ulum ornare. Sed consequat,
                                augue
                                condimentum fermentum gravida, metus elit vehicula dui.</p>
                        </div>
                    </div>
                    <div class="col-1-4 col-footer-2">
                        <div class="wrap-col">
                            <h3>Categories</h3>
                            <ul>
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Romantic</a></li>
                                <li><a href="#">Cartoon</a></li>
                                <li><a href="#">Zombies</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-1-4 col-footer-3">
                        <div class="wrap-col">
                            <h3>Recent Posts</h3>
                            <ul>
                                <li><a href="#">New Videos</a></li>
                                <li><a href="#">Featured Videos</a></li>
                                <li><a href="#">Most Viewed Videos</a></li>
                                <li><a href="#">Sports Videos</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-1-4 col-footer-4">
                        <div class="wrap-col">
                            <h3>Flickr Photos</h3>
                            <div class="row">
                                <div class="col-1-4">
                                    <div class="wrap-col">
                                        <a href="#"><img src="/images/6.jpg"/></a>
                                        <a href="#"><img src="/images/10.jpg"/></a>
                                        <a href="#"><img src="/images/13.jpg"/></a>
                                    </div>
                                </div>
                                <div class="col-1-4">
                                    <div class="wrap-col">
                                        <a href="#"><img src="/images/7.jpg"/></a>
                                        <a href="#"><img src="/images/11.jpg"/></a>
                                        <a href="#"><img src="/images/6.jpg"/></a>
                                    </div>
                                </div>
                                <div class="col-1-4">
                                    <div class="wrap-col">
                                        <a href="#"><img src="/images/8.jpg"/></a>
                                        <a href="#"><img src="/images/12.jpg"/></a>
                                        <a href="#"><img src="/images/10.jpg"/></a>
                                    </div>
                                </div>
                                <div class="col-1-4">
                                    <div class="wrap-col">
                                        <a href="#"><img src="/images/9.jpg"/></a>
                                        <a href="#"><img src="/images/13.jpg"/></a>
                                        <a href="#"><img src="/images/8.jpg"/></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Slider -->
        <script src="/js/jquery-2.1.1.js"></script>
        <script src="/js/demo.js"></script>
        <script src="/js/classie.js"></script>
        <!-- Carousel -->
        <script src="/js/owl.carousel.js"></script>
        <script>
            $(document).ready(function () {

                $("#owl-demo-1").owlCarousel({
                    items: 4,
                    lazyLoad: true,
                    navigation: true
                });
                $("#owl-demo-2").owlCarousel({
                    items: 4,
                    lazyLoad: true,
                    navigation: true
                });
                $("#owl-demo-3").owlCarousel({
                    items: 4,
                    lazyLoad: true,
                    navigation: true
                });
            });
        </script>
    </div>

</div>
<script type="text/javascript" src="/framework/jquery.min.js"></script>
<script type="text/javascript" src="/layui/layui.js"></script>

<script type="text/javascript">
    function uploadVideo() {
        layui.use(['layer'], function () {
            var layer = layui.layer;
            layerIndex = layer.open({
                title: "上传视频",
                type: 2,
                content: "/video/toAddVideo",
                maxmin: false,
                resize: true,
                offset: '5%',
                area: ["300px", "100px"]
            });
        });
    }

    $(document).ready(function () {
    });


</script>
<script>
    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
</body>

</html>