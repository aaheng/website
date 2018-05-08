<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>首页</title>
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
    <link rel="stylesheet" href="/css/index.css">
    <style>
        .zm-item-answer-author-info a.collapse {
            margin-top: 0
        }
    </style>
</head>

<body>
<div class="layui-layout layui-layout-admin">
    <%--header--%>
    <jsp:include page="header.jsp"/>


    <div class="zu-global-notify" id="zh-global-message" style="display:none">
        <div class="zg-wrap">
            <div class="zu-global-nitify-inner">
                <a class="zu-global-notify-close" href="javascript:;" title="关闭" name="close">x</a>
                <span class="zu-global-notify-icon"></span>
                <span class="zu-global-notify-msg"></span>
            </div>
        </div>
    </div>
    <div class="zg-wrap zu-main clearfix " role="main">
        <div class="zu-main-content">
            <div class="zu-main-content-inner">
                <div class="zg-section" id="zh-home-list-title">
                    <i class="zg-icon zg-icon-feedlist"></i>最新动态
                    <input type="hidden" id="is-topstory">
                    <span class="zg-right zm-noti-cleaner-setting" style="list-style:none">
                        <a href="https://nowcoder.com/settings/filter" class="zg-link-gray-normal">
                            <i class="zg-icon zg-icon-settings"></i>设置</a></span>
                </div>
                <div class="zu-main-feed-con navigable" data-feedtype="topstory" id="zh-question-list"
                     data-widget="navigable"
                     data-navigable-options="{&quot;items&quot;:&quot;&gt; .zh-general-list .feed-content&quot;,&quot;offsetTop&quot;:-82}">
                    <a href="javascript:;" class="zu-main-feed-fresh-button" id="zh-main-feed-fresh-button"
                       style="display:none"></a>
                    <div id="js-home-feed-list" class="zh-general-list topstory clearfix">
                        <c:forEach items="${vos}" var="vo">
                            <div class="feed-item folding feed-item-hook feed-item-1">

                                <div class="feed-item-inner">
                                    <div class="avatar">
                                        <a title="赵永峰" data-tip="p$t$zhao-yong-feng" class="zm-item-link-avatar"
                                           target="_blank"
                                           href="/user/${vo.get('user').id}">
                                            <img src="/images/res/b3aadf89405941b05a5ce00fb06f8281_m.jpg"
                                                 class="zm-item-img-avatar"></a>
                                    </div>
                                    <div class="feed-main">
                                        <div class="feed-content" data-za-module="PostItem">
                                            <meta itemprop="post-id" content="113477">
                                            <meta itemprop="post-url-token" content="19831487">
                                            <h5 class="feed-title">
                                                <a target="_blank" class="post-link"
                                                   href="/discuss/question/detail/${vo.get('question').id}"></a>${vo.get('question').title}
                                            </h5>
                                            <div class="entry-body post-body js-collapse-body">
                                                <div class="zm-item-vote">
                                                    <a class="zm-item-vote-count js-expand js-vote-count" href="#"
                                                       data-bind-votecount="">1082</a></div>
                                                <div class="zm-votebar" data-za-module="VoteBar">
                                                    <button class="up" aria-pressed="false" title="赞同">
                                                        <i class="icon vote-arrow"></i>
                                                        <span class="count">1082</span>
                                                        <span class="label sr-only">赞同</span></button>
                                                </div>
                                                <div class="author-info">
                                                    <a href="/user/${vo.get("user").id}"
                                                       data-tip="p$t$zhao-yong-feng"
                                                       class="name">${vo.get("user").username}</a>
                                                </div>
                                                <div class="zm-item-vote-info" data-votecount="1082"
                                                     data-za-module="VoteInfo">
                                                <span class="voters text">
                                                    <a href="#" class="more text">
                                                        <span class="js-voteCount">1082</span>&nbsp;人赞</a></span>
                                                </div>
                                                <div class="post-content">
                                                    <div class="zh-summary summary clearfix">
                                                            ${vo.get("question").content}
                                                    </div>
                                                    <p>
                                                        <a class="post-link entry-link" target="_blank"
                                                           href="javascript:void(0);">
                                                            ${vo.get('question').create_time}
                                                        </a>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="feed-meta">
                                                <div class="zm-item-meta meta clearfix js-contentActions">
                                                    <div class="zm-meta-panel">
                                                        <a data-follow="c:link" class="zg-follow meta-item" href="#"
                                                           id="cl-2180">

                                                        <a href="/discuss/question/detail/${vo.get('question').id}"
                                                           class="meta-item toggle-comment js-toggleCommentBox">
                                                            <i class="z-icon-comment"></i>${vo.get('question').comment_count}
                                                            条评论</a>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="undo-dislike-options" data-item_id="1">此内容将不会在动态中再次显示
                                    <span class="zg-bull">•</span>
                                    <a href="#" class="meta-item revert">撤销</a>
                                    <a href="#" class="ignore zu-autohide close"></a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Start of Page Container -->
    <%--<div class="page-container">
        <div class="container">
            <div class="row">
                <!-- start of page content -->
                <div class="span8 page-content">

                    <!-- Basic Home Page Template -->
                    <div class="row separator">
                        <section class="span4 articles-list">
                            <h3>最新问题</h3>
                            <ul class="articles">
                                <c:forEach items="${vos}" var="vo">

                                    <li class="article-entry standard">
                                        <h4>
                                            <a href="/discuss/question/detail/${vo.get('question').id}">${vo.get('question').title}</a>
                                        </h4>
                                        <span>
                                                ${vo.get('question').content}
                                        </span>
                                        <br>
                                        <span class="article-meta">${vo.get('question').create_time}</span>
                                        <span class="like-count">${vo.get('question').comment_count}</span>
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
    </div>--%>
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