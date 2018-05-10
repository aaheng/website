<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>关注列表</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>首页</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel='stylesheet' id='bootstrap-css-css' href='/css/bootstrap5152.css?ver=1.0' type='text/css' media='all'/>
    <link rel='stylesheet' id='responsive-css-css' href='/css/responsive5152.css?ver=1.0' type='text/css' media='all'/>
    <link rel='stylesheet' id='pretty-photo-css-css' href='/js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4'
          type='text/css'
          media='all'/>
    <link rel='stylesheet' id='main-css-css' href='/css/main5152.css?ver=1.0' type='text/css' media='all'/>
    <link rel='stylesheet' id='custom-css-css' href='/css/custom5152.html?ver=1.0' type='text/css' media='all'/>
    <link rel="stylesheet" href="/css/result.css"/>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <%--header--%>
    <jsp:include page="../header.jsp"/>
    <div class="zg-wrap zu-main clearfix ">
        <div class="zm-profile-section-wrap zm-profile-followee-page">
            <div class="zm-profile-section-head">
                    <span class="zm-profile-section-name">
                        <a href="#">${curUser.name}</a> 关注了 ${followeeCount} 人
                    </span>
            </div>
            <div class="zm-profile-section-list">
                <div id="zh-profile-follows-list">
                    <div class="zh-general-list clearfix">
                        #foreach($vo in $followees)
                        <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                            #if($vo.followed)
                            <div class="zg-right">
                                <button class="zg-btn zg-btn-unfollow zm-rich-follow-btn small nth-0
                                    js-follow-user" data-status="1" data-id="$vo.user.id">取消关注
                                </button>
                            </div>
                            #else
                            <div class="zg-right">
                                <button class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0
                                    js-follow-user" data-id="$vo.user.id">关注
                                </button>
                            </div>
                            #end
                            <a title="Barty" class="zm-item-link-avatar" href="/user/${vo.user.id}">
                                <img src="${vo.user.headUrl}" class="zm-item-img-avatar">
                            </a>
                            <div class="zm-list-content-medium">
                                <h2 class="zm-list-content-title"><a data-tip="p$t$buaabarty" href="/user/${vo.user.id}"
                                                                     class="zg-link" title="Barty">${vo.user.name}</a>
                                </h2>

                                <!-- <div class="zg-big-gray">计蒜客教研首席打杂</div> -->
                                <div class="details zg-gray">
                                    <a target="_blank" href="/user/${vo.user.id}/followers"
                                       class="zg-link-gray-normal">${vo.followerCount}粉丝</a>
                                    /
                                    <a target="_blank" href="/user/${vo.user.id}/followees"
                                       class="zg-link-gray-normal">${vo.followeeCount}关注</a>
                                    /
                                    <a target="_blank" href="#" class="zg-link-gray-normal">${vo.commentCount} 回答</a>
                                    /
                                    <a target="_blank" href="#" class="zg-link-gray-normal">548 赞同</a>
                                </div>
                            </div>
                        </div>
                        #end
                    </div>
                    <a aria-role="button" class="zg-btn-white zu-button-more">更多</a>
                </div>
            </div>
        </div>
    </div>

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
