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
                                    <c:when test="${profileUser.get('followed')}">
                                        <button class="layui-btn layui-btn-primary" onclick="unfollowBtn(${profileUser.get('user').id})">取消关注</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="layui-btn" onclick="followBtn(${profileUser.get('user').id})">关注</button>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <a title="Barty" class="zm-item-link-avatar" href="/user/${profileUser.get('user').id}">
                                <img src="${profileUser.get('user').headUrl}" class="zm-item-img-avatar">
                            </a>
                            <div class="zm-list-content-medium">
                                <h2 class="zm-list-content-title"><a data-tip="p$t$buaabarty"
                                                                     href="/user/${profileUser.get('user').id}"
                                                                     class="zg-link">${profileUser.get('user').username}</a></h2>

                                <!-- <div class="zg-big-gray">计蒜客教研首席打杂</div> -->
                                <div class="details zg-gray">
                                    <a target="_blank" href="/user/${profileUser.get('user').id}/followers"
                                       class="zg-link-gray-normal">${profileUser.get('followerCount')}粉丝</a>
                                    /
                                    <a target="_blank" href="/user/${profileUser.get('user').id}/followees"
                                       class="zg-link-gray-normal">${profileUser.get('followeeCount')}关注</a>
                                    /
                                    <a target="_blank" href="#" class="zg-link-gray-normal">${profileUser.get('commentCount')}
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
                                        <a title="${vo.get('user').username}" data-tip="p$t$amuro1230" class="zm-item-link-avatar"
                                           target="_blank" href="${vo.get('user').headUrl}">
                                            <img src="${vo.get('user').headUrl}" class="zm-item-img-avatar"></a>
                                    </div>
                                    <div class="feed-main">
                                        <div class="feed-content" data-za-module="AnswerItem">
                                            <meta itemprop="answer-id" content="389034">
                                            <meta itemprop="answer-url-token" content="13174385">
                                            <h2 class="feed-title">
                                                <a class="question_link" target="_blank"
                                                   href="/discuss/question/detail/${vo.get('question').id}">${vo.get('question').title}</a></h2>
                                            <div class="feed-question-detail-item">
                                                <div class="question-description-plain zm-editable-content"></div>
                                            </div>
                                            <div class="expandable entry-body">
                                                <div class="zm-item-vote">
                                                    <a class="zm-item-vote-count js-expand js-vote-count"
                                                       href="javascript:;" data-bind-votecount=""><%--${vo.followCount}--%></a>
                                                </div>
                                                <div class="zm-item-answer-author-info">
                                                    <a class="author-link" data-tip="p$b$amuro1230" target="_blank"
                                                       href="/user/${vo.get('user').id}">${vo.get('user').username}</a>
                                                    ，${vo.get('user').created}
                                                </div>
                                                <div class="zm-item-vote-info" data-votecount="4168"
                                                     data-za-module="VoteInfo">
                                                <span class="voters text">
                                                    <a href="#" class="more text">
                                                        <span class="js-voteCount"></span>&nbsp;人赞同</a></span>
                                                </div>
                                                <div class="zm-item-rich-text expandable js-collapse-body">
                                                    <div class="zh-summary summary clearfix">${vo.get('question').content}</div>
                                                </div>
                                            </div>
                                            <div class="feed-meta">
                                                <div class="zm-item-meta answer-actions clearfix js-contentActions">
                                                    <div class="zm-meta-panel">
                                                        <a data-follow="q:link" class="follow-link zg-follow meta-item"
                                                           href="javascript:;" id="sfb-123114">
                                                            <i class="z-icon-follow"></i>关注问题</a>
                                                        <a href="/discuss/question/detail/${vo.get('question').id}" name="addcomment"
                                                           class="meta-item toggle-comment js-toggleCommentBox">
                                                            <i class="z-icon-comment"></i>${vo.get('question').comment_count}
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
        function followBtn(userId) {
            $.post("/followUser",{"userId":userId},function (data) {
                if (data.code == 200){
                    window.location.reload();
                }else if (data.code == 999){
                    $(location).attr('href', 'http://localhost:8081/toLogin?callback='+data.result);
                }else {
                    alert(data.msg);
                }
            });
        }
        function unfollowBtn(userId) {
            $.post("/unfollowUser",{"userId":userId},function (data) {
                if (data.code == 200){
                    window.location.reload();
                }else if (data.code == 999){
                    $(location).attr('href', 'http://localhost:8081/toLogin?callback='+data.result);
                }else {
                    alert(data.msg);
                }
            });
        }
    </script>
</body>

</html>