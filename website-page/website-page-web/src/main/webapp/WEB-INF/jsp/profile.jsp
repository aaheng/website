<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>个人中心</title>
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
    <link rel="stylesheet" href="/css/detail.css">
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

    <div class="zg-wrap zu-main clearfix " role="main">
        <div class="zm-profile-section-wrap zm-profile-followee-page">
            <div class="zm-profile-section-list">
                <div id="zh-profile-follows-list">
                    <div class="zh-general-list clearfix">
                        <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                            <div class="zg-right">
                                <c:choose>
                                    <c:when test="${profileUser.followed}">
                                        <button class="zg-btn zg-btn-unfollow zm-rich-follow-btn small nth-0
                                    js-follow-user" data-status="1" data-id="$profileUser.user.id">取消关注
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0
                                    js-follow-user" data-id="$profileUser.user.id">关注
                                        </button>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <a title="Barty" class="zm-item-link-avatar" href="/user/${profileUser.user.id}">
                                <img src="${profileUser.user.headUrl}" class="zm-item-img-avatar">
                            </a>
                            <div class="zm-list-content-medium">
                                <h2 class="zm-list-content-title"><a data-tip="p$t$buaabarty"
                                                                     href="/user/${profileUser.user.id}"
                                                                     class="zg-link">${profileUser.user.name}</a></h2>

                                <!-- <div class="zg-big-gray">计蒜客教研首席打杂</div> -->
                                <div class="details zg-gray">
                                    <a target="_blank" href="/user/${profileUser.user.id}/followers"
                                       class="zg-link-gray-normal">${profileUser.followerCount}粉丝</a>
                                    /
                                    <a target="_blank" href="/user/${profileUser.user.id}/followees"
                                       class="zg-link-gray-normal">${profileUser.followeeCount}关注</a>
                                    /
                                    <a target="_blank" href="#" class="zg-link-gray-normal">${profileUser.commentCount}
                                        回答</a>
                                    /
                                    <a target="_blank" href="#" class="zg-link-gray-normal">548 赞同</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="zu-main-content">
            <div class="zu-main-content-inner">
                <div class="zg-section" id="zh-home-list-title">
                    <i class="zg-icon zg-icon-feedlist"></i>最新动态
                    <span class="zg-right zm-noti-cleaner-setting" style="list-style:none">
                        <a href="https://nowcoder.com/settings/filter" class="zg-link-gray-normal">
                            <i class="zg-icon zg-icon-settings"></i>设置
                        </a>
                    </span>
                </div>
                <div class="zu-main-feed-con navigable" data-feedtype="topstory" id="zh-question-list">
                    <div id="js-home-feed-list" class="zh-general-list topstory clearfix">
                        <c:forEach items="${vos}" var="vo">
                            <div class="feed-item folding feed-item-hook feed-item-2
                        " feed-item-a="" data-type="a" id="feed-2" data-za-module="FeedItem" data-za-index="">
                                <meta itemprop="ZReactor" data-id="389034" data-meta="">
                                <div class="feed-item-inner">
                                    <div class="avatar">
                                        <a title="$!{vo.user.name}" data-tip="p$t$amuro1230" class="zm-item-link-avatar"
                                           target="_blank" href="https://nowcoder.com/people/amuro1230">
                                            <img src="$!{vo.user.headUrl}" class="zm-item-img-avatar"></a>
                                    </div>
                                    <div class="feed-main">
                                        <div class="feed-content" data-za-module="AnswerItem">
                                            <meta itemprop="answer-id" content="389034">
                                            <meta itemprop="answer-url-token" content="13174385">
                                            <h2 class="feed-title">
                                                <a class="question_link" target="_blank"
                                                   href="/question/$!{vo.question.id}">$!{vo.question.title}</a></h2>
                                            <div class="feed-question-detail-item">
                                                <div class="question-description-plain zm-editable-content"></div>
                                            </div>
                                            <div class="expandable entry-body">
                                                <div class="zm-item-vote">
                                                    <a class="zm-item-vote-count js-expand js-vote-count"
                                                       href="javascript:;" data-bind-votecount="">${vo.followCount}</a>
                                                </div>
                                                <div class="zm-item-answer-author-info">
                                                    <a class="author-link" data-tip="p$b$amuro1230" target="_blank"
                                                       href="/user/$!{vo.user.id}">$!{vo.user.name}</a>
                                                    ，$data.format('yyyy-MM-dd HH:mm:ss', $!{vo.question.createdDate})
                                                </div>
                                                <div class="zm-item-vote-info" data-votecount="4168"
                                                     data-za-module="VoteInfo">
                                                <span class="voters text">
                                                    <a href="#" class="more text">
                                                        <span class="js-voteCount"></span>&nbsp;人赞同</a></span>
                                                </div>
                                                <div class="zm-item-rich-text expandable js-collapse-body"
                                                     data-resourceid="123114" data-action="/answer/content"
                                                     data-author-name="李淼"
                                                     data-entry-url="/question/19857995/answer/13174385">
                                                    <div class="zh-summary summary clearfix">${vo.question.content}</div>
                                                </div>
                                            </div>
                                            <div class="feed-meta">
                                                <div class="zm-item-meta answer-actions clearfix js-contentActions">
                                                    <div class="zm-meta-panel">
                                                        <a data-follow="q:link" class="follow-link zg-follow meta-item"
                                                           href="javascript:;" id="sfb-123114">
                                                            <i class="z-icon-follow"></i>关注问题</a>
                                                        <a href="#" name="addcomment"
                                                           class="meta-item toggle-comment js-toggleCommentBox">
                                                            <i class="z-icon-comment"></i>${vo.question.commentCount}
                                                            条评论</a>


                                                        <button class="meta-item item-collapse js-collapse">
                                                            <i class="z-icon-fold"></i>收起
                                                        </button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <a href="javascript:;" id="zh-load-more" class="zg-btn-white zg-r3px zu-button-more">更多</a>
                </div>
            </div>
        </div>


        <!-- Start of Footer -->
        <footer id="footer-wrapper">
            <div id="footer" class="container">
                <div class="row">

                    <div class="span3">
                        <section class="widget">
                            <h3 class="title">How it works</h3>
                            <div class="textwidget">
                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
                                    euismod
                                    tincidunt ut laoreet dolore magna aliquam erat volutpat. </p>
                                <p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit
                                    lobortis
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