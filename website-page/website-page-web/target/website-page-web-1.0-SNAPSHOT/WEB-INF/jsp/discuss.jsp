<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/layui/css/layui.css">

    <!-- Style Sheet-->
    <link rel="stylesheet" href="/css/style.css"/>
    <link rel='stylesheet' id='bootstrap-css-css' href='/css/bootstrap5152.css?ver=1.0' type='text/css' media='all'/>
    <link rel='stylesheet' id='responsive-css-css' href='/css/responsive5152.css?ver=1.0' type='text/css' media='all'/>
    <link rel='stylesheet' id='pretty-photo-css-css' href='/js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4'
          type='text/css'
          media='all'/>
    <link rel='stylesheet' id='main-css-css' href='/css/main5152.css?ver=1.0' type='text/css' media='all'/>
    <link rel='stylesheet' id='custom-css-css' href='/css/custom5152.html?ver=1.0' type='text/css' media='all'/>
    <%--<link rel="stylesheet" href="/css/addPopup.css">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/detail.css">--%>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <%--header--%>
    <jsp:include page="header.jsp"/>


    <!-- Start of Search Wrapper -->
    <div class="search-area-wrapper">
        <div class="search-area container">
            <%-- <h3 class="search-header">Have a Question?&nbsp;&nbsp;&nbsp;
                 <input class="layui-btn" type="submit" value="点击提问"
                        style="height: 40px;background-color: #3f4b55"
                        onclick="document.getElementById('addquestion').style.display='block';document.getElementById('fade').style.display='block'"/>
             </h3>--%>
            <h3 class="search-header">Have a Question?&nbsp;&nbsp;&nbsp;
                <input class="layui-btn" type="submit" value="点击提问"
                       style="height: 40px;background-color: #3f4b55"
                       id="addQuestion"/>
            </h3>
            <p class="search-tag-line">If you have any question you can ask below or enter what you are looking
                for!</p>
            <form class="layui-form">
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <input type="text" name="" placeholder="Type your search terms here" autocomplete="off"
                               class="layui-input"
                               style="height: 40px;width: 800px;margin-top: 10px"/>&nbsp;&nbsp;&nbsp;
                        <input class="layui-btn" type="submit" value="Search"
                               style="height: 40px;background-color: #3f4b55"/>
                        <div id="search-error-container"></div>
                    </div>

                </div>
            </form>

        </div>
    </div>
    <%--End of Search Wrapper--%>
    <!-- Start of Page Container -->
    <div class="page-container">
        <div class="container">
            <div class="row">
                <!-- start of page content -->
                <div class="span8 page-content">

                    <!-- Basic Home Page Template -->
                    <div class="row separator">
                        <section class="span4 articles-list">
                            <h3>最新问题</h3>
                            <ul class="articles">
                                <c:forEach items="${questionList}" var="question">
                                    <li class="article-entry standard">
                                        <h4><a href="/discuss/question/detail/${question.id}">${question.title}</a></h4>
                                        <span>
                                                ${question.content}
                                        </span>
                                        <br>
                                        <span class="article-meta">${question.create_time}</span>
                                        <span class="like-count">${question.comment_count}</span>
                                    </li>
                                </c:forEach>
                            </ul>
                        </section>

                        <section class="span4 articles-list">
                            <h3>热门问题</h3>
                            <ul class="articles">
                                <li class="article-entry standard">
                                    <h4><a href="single.html">Integrating WordPress with Your Website</a></h4>
                                    <span class="article-meta">25 Feb, 2013 in <a href="#"
                                                                                  title="View all posts in Server &amp; Database">Server &amp; Database</a></span>
                                    <span class="like-count">66</span>
                                </li>
                            </ul>
                        </section>
                    </div>
                </div>
                <!-- end of page content -->

                <!-- start of sidebar -->
                <aside class="span4 page-sidebar">

                    <section class="widget">
                        <div class="support-widget">
                            <h3 class="title">Support</h3>
                            <p class="intro">Need more support? If you did not found an answer, contact us for further
                                help.</p>
                        </div>
                    </section>

                    <section class="widget">
                        <div class="quick-links-widget">
                            <h3 class="title">Quick Links</h3>
                            <ul id="menu-quick-links" class="menu clearfix">
                                <li>
                                    <a href="index-2.html">Home</a>
                                </li>
                                <li>
                                    <a href="articles-list.html">Articles List</a>
                                </li>
                                <li>
                                    <a href="faq.html">FAQs</a>
                                </li>
                                <li>
                                    <a href="contact.html">Contact</a>
                                </li>
                            </ul>
                        </div>
                    </section>

                    <section class="widget">
                        <h3 class="title">Tags</h3>
                        <div class="tagcloud">
                            <a href="#" class="btn btn-mini">basic</a>
                            <a href="#" class="btn btn-mini">beginner</a>
                            <a href="#" class="btn btn-mini">blogging</a>
                            <a href="#" class="btn btn-mini">colour</a>
                            <a href="#" class="btn btn-mini">css</a>
                            <a href="#" class="btn btn-mini">date</a>
                            <a href="#" class="btn btn-mini">design</a>
                            <a href="#" class="btn btn-mini">files</a>
                            <a href="#" class="btn btn-mini">format</a>
                            <a href="#" class="btn btn-mini">header</a>
                            <a href="#" class="btn btn-mini">images</a>
                            <a href="#" class="btn btn-mini">plugins</a>
                            <a href="#" class="btn btn-mini">setting</a>
                            <a href="#" class="btn btn-mini">templates</a>
                            <a href="#" class="btn btn-mini">theme</a>
                            <a href="#" class="btn btn-mini">time</a>
                            <a href="#" class="btn btn-mini">videos</a>
                            <a href="#" class="btn btn-mini">website</a>
                            <a href="#" class="btn btn-mini">wordpress</a>
                        </div>
                    </section>

                </aside>
                <!-- end of sidebar -->
            </div>
        </div>
    </div>
    <!-- End of Page Container -->

    <!-- Start of Footer -->
    <footer id="footer-wrapper">
        <div id="footer" class="container">
            <div class="row">

                <div class="span3">
                    <section class="widget">
                        <h3 class="title">How it works</h3>
                        <div class="textwidget">
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod
                                tincidunt ut laoreet dolore magna aliquam erat volutpat. </p>
                            <p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis
                                nisl
                                ut aliquip ex ea commodo consequat. </p>
                        </div>
                    </section>
                </div>

                <div class="span3">
                    <section class="widget">
                        <h3 class="title">Categories</h3>
                        <ul>
                            <li>
                                <a href="#" title="Lorem ipsum dolor sit amet,">Advanced Techniques</a>
                            </li>
                            <li>
                                <a href="#" title="Lorem ipsum dolor sit amet,">Designing in WordPress</a>
                            </li>
                            <li>
                                <a href="#" title="Lorem ipsum dolor sit amet,">Server &amp; Database</a>
                            </li>
                            <li>
                                <a href="#" title="Lorem ipsum dolor sit amet, ">Theme Development</a>
                            </li>
                            <li>
                                <a href="#" title="Lorem ipsum dolor sit amet,">Website Dev</a>
                            </li>
                            <li>
                                <a href="#" title="Lorem ipsum dolor sit amet,">WordPress for Beginners</a>
                            </li>
                            <li>
                                <a href="#" title="Lorem ipsum dolor sit amet, ">WordPress Plugins</a>
                            </li>
                        </ul>
                    </section>
                </div>

                <div class="span3">
                    <section class="widget">
                        <h3 class="title">Latest Tweets</h3>
                        <div id="twitter_update_list">
                            <ul>
                                <li>No Tweets loaded !</li>
                            </ul>
                        </div>

                    </section>
                </div>

                <div class="span3">
                    <section class="widget">
                        <h3 class="title">Flickr Photos</h3>
                        <div class="flickr-photos" id="basicuse">
                        </div>
                    </section>
                </div>

            </div>
        </div>
        <!-- end of #footer -->

        <!-- Footer Bottom -->
        <div id="footer-bottom-wrapper">
            <div id="footer-bottom" class="container">
                <div class="row">
                    <div class="span6">
                        <p class="copyright">
                            Copyright © 2013. All Rights Reserved by KnowledgeBase.Collect from
                            <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
                        </p>
                    </div>
                    <div class="span6">
                        <!-- Social Navigation -->
                        <ul class="social-nav clearfix">
                            <li class="linkedin">
                                <a target="_blank" href="#"></a>
                            </li>
                            <li class="stumble">
                                <a target="_blank" href="#"></a>
                            </li>
                            <li class="google">
                                <a target="_blank" href="#"></a>
                            </li>
                            <li class="deviantart">
                                <a target="_blank" href="#"></a>
                            </li>
                            <li class="flickr">
                                <a target="_blank" href="#"></a>
                            </li>
                            <li class="skype">
                                <a target="_blank" href="skype:#?call"></a>
                            </li>
                            <li class="rss">
                                <a target="_blank" href="#"></a>
                            </li>
                            <li class="twitter">
                                <a target="_blank" href="#"></a>
                            </li>
                            <li class="facebook">
                                <a target="_blank" href="#"></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End of Footer Bottom -->

    </footer>

    <!-- End of Footer -->

    <a href="#top" id="scroll-top"></a>

</div>
<!-- script -->
<script type='text/javascript' src='/js/jquery-1.8.3.min.js'></script>
<script type='text/javascript' src='/js/jquery.easing.1.3.js'></script>
<script type='text/javascript' src='/js/prettyphoto/jquery.prettyPhoto.js'></script>
<script type='text/javascript' src='/js/jflickrfeed.js'></script>
<script type='text/javascript' src='/js/jquery.liveSearch.js'></script>
<script type='text/javascript' src='/js/jquery.form.js'></script>
<script type='text/javascript' src='/js/jquery.validate.min.js'></script>
<script type='text/javascript' src='/js/custom.js'></script>

<script type="text/javascript" src="/framework/jquery.min.js"></script>
<script type="text/javascript" src="/layui/layui.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#addQuestion").click(function () {
            layui.use(['layer'], function () {
                var layer = layui.layer;
                layerIndex = layer.open({
                    title: "提问",
                    type:2,
                    content: "/discuss/toAddQuestion",
                    maxmin: false,
                    resize: false,
                    offset: '5%',
                    area: ["700px", "400px"]
                });
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
</body>
</html>
