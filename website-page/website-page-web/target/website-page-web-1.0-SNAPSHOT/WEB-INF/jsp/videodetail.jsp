<%--
  Created by IntelliJ IDEA.
  User: aheng
  Date: 2018/3/11
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>视频详情</title>
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
    <link rel="stylesheet" href="/css/video/menu.css"/>
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
        <!-- Start of Header -->
        <jsp:include page="header.jsp"></jsp:include>
        <!-- End of Header -->


        <!--////////////////////////////////////Container-->
        <section id="container" class="index-page">
            <div class="wrap-container zerogrid">
                <div class="row">
                    <div id="main-content" class="col-2-3">
                        <div class="wrap-vid">
                            <div class="zoom-container" style="padding-top: 0px;">
                                <a href="/video/detail">
                                    <video width="550" height="400" controls>
                                        <source src="/${video.path}" type="video/mp4">
                                    </video>
                                </a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="share">
                                <div class="col-1-4">
                                    <div class="wrap-col">
                                        <div class="box-share">
                                            <a href="#">
                                                <i class="fa fa-comments"></i>
                                                <span>Comments</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-1-4">
                                    <div class="wrap-col">
                                        <div class="box-share">
                                            <a href="#">
                                                <i class="fa fa-twitter"></i>
                                                <span>Twitter </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-1-4">
                                    <div class="wrap-col">
                                        <div class="box-share">
                                            <a href="#">
                                                <i class="fa fa-thumbs-up"></i>
                                                <span>110</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <%--<div class="col-1-4">
                                    <div class="wrap-col">
                                        <div class="box-share">
                                            <a href="#">
                                                <i class="fa fa-plus"></i>
                                                <span>Add</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                        <h1 class="vid-name">${video.titleOrig}</h1>
                        <div class="info">
                            <h5>By <a href="#"></a></h5>
                            <span><i class="fa fa-calendar"></i>${video.uploadTime}</span>
                            <span><i class="fa fa-heart"></i>1,200</span>
                        </div>
                        <p>Aenean feugiat in ante et blandit. Vestibulum posuere molestie risus, ac interdum magna porta
                            non. Pellentesque rutrum fringilla elementum. Curabitur tincidunt porta lorem vitae
                            accumsan.
                            Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis
                            egestas.
                            Donec ac euismod turpis.</p>
                        <%--<div class="tags">
                            <a href="#">Animal</a>
                            <a href="#">Aenean</a>
                            <a href="#">Feugiat</a>
                            <a href="#">Risus</a>
                            <a href="#">Magna</a>
                        </div>--%>
                        <section class="vid-related">
                            <div class="header">
                                <h2>Comments</h2>
                            </div>
                            <input id="videoId" type="hidden" value="${video.ID}">
                            <div class="row"><!--Start Box-->
                                <div id="owl-demo-1" class="owl-carousel">
                                    <div class="layui-inline">
                                        <div class="layui-input-inline">
                                            <textarea class="layui-textarea" placeholder="在这里输入你的评论"
                                                      style="width: 800px;height: 200px"></textarea>
                                        </div>
                                        <div class="layui-input-inline" style="padding-top: 10px;">
                                            <button id="addCommentBtn" class="layui-btn" style="">发表评论</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                    <div id="sidebar" class="col-1-3">
                        <div class="widget wid-post">
                            <div class="wid-header">
                                <h5>Latest Posts</h5>
                            </div>
                            <div class="wid-content">
                                <c:forEach var="v" items="${videoList}">
                                    <div class="post wrap-vid">
                                        <div class="zoom-container">
                                            <a href="/video/detail/${v.id}">
                                                <video width="200" height="200" controls>
                                                    <source src="/${v.path}" type="video/mp4">
                                                </video>
                                            </a>
                                        </div>
                                        <div class="wrapper">
                                            <h5 class="vid-name"><a href="#">${v.titleOrig}</a></h5>
                                            <div class="info">
                                                <h6>By <a href="#">Kelvin</a></h6>
                                                <span><i class="fa fa-calendar"></i>${v.uploadTime}</span>
                                                <span><i class="fa fa-heart"></i>1,200</span>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--////////////////////////////////////Footer-->

        <!-- Slider -->
        <script src="/js/jquery-2.1.1.js"></script>
        <script src="/js/demo.js"></script>
        <!-- Search -->
        <script src="/js/modernizr.custom.js"></script>
        <script src="/js/classie.js"></script>
        <script src="/js/uisearch.js"></script>
        <script>
            new UISearch(document.getElementById('sb-search'));
        </script>
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

            });
        </script>

        <script type="text/javascript">
            $(document).ready(function () {

                $("#addCommentBtn").click(function () {
                    var videoId = $("#videoId").val();
                    var content = $("#content").val();

                    $.ajax({
                        type: "POST",
                        data: {
                            "questionId": questionId,
                            "content": content
                        },
                        async: true,
                        url: "/video/comment/add",
                        success: function (data) {
                            if (data.code == 200) {
                                layui.use(['layer'], function () {
                                    var layer = layui.layer;
                                    layer.msg("添加成功", {
                                        offset: '50%',
                                        icon: 1,
                                        time: 2000
                                    });
                                    setTimeout(function () {
                                        location.reload();
                                    }, 4000);
                                });
                            }
                            else {
                                layui.use(['layer'], function () {
                                    var layer = layui.layer;
                                    layer.msg("添加失败," + data.msg, {
                                        offset: '50%',
                                        icon: 2,
                                        time: 2000
                                    });
                                });
                            }
                        }
                    });
                });

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
    </div>
</div>
</body>
</html>
