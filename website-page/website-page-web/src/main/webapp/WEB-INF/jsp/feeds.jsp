<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>新鲜事</title>
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
                <div class="zu-main-feed-con navigable">
                    <div class="zh-general-list topstory clearfix">
                        <c:forEach items="${feeds}" var="vo">
                            <c:choose>
                                <c:when test="${vo.type==1}">
                                    <div class="feed-item folding feed-item-hook feed-item-2">
                                        <meta itemprop="ZReactor" data-id="389034"
                                              data-meta="{&quot;source_type&quot;: &quot;promotion_answer&quot;, &quot;voteups&quot;: 4168, &quot;comments&quot;: 69, &quot;source&quot;: []}">
                                        <div class="feed-item-inner">
                                            <div class="avatar">
                                                <a title="$!{vo.userName}" data-tip="p$t$amuro1230"
                                                   class="zm-item-link-avatar" target="_blank"
                                                   href="/user/${vo.userId}">
                                                    <img src="${vo.get('userHead')}" class="zm-item-img-avatar"></a>
                                            </div>
                                            <div class="feed-main">
                                                <div class="feed-content" data-za-module="AnswerItem">
                                                    <meta itemprop="answer-id" content="389034">
                                                    <meta itemprop="answer-url-token" content="13174385">
                                                    <div class="expandable entry-body">
                                                        <div class="zm-item-answer-author-info">
                                                            <a class="author-link" data-tip="p$b$amuro1230"
                                                               target="_blank" href="/user/${vo.userId}">${vo.get('userName')}</a>
                                                            评论了以下问题 ，${vo.create_time}
                                                        </div>
                                                        <!--
                                                        <div class="zm-item-vote-info" data-votecount="4168" data-za-module="VoteInfo">
                                                            <span class="voters text">
                                                                <a href="#" class="more text">
                                                                    <span class="js-voteCount">4168</span>&nbsp;人赞同</a></span>
                                                        </div>
                                                        -->
                                                        <div class="zm-item-rich-text expandable js-collapse-body"
                                                             data-resourceid="123114" data-action="/answer/content"
                                                             data-author-name="李淼"
                                                             data-entry-url="/question/19857995/answer/13174385">
                                                            <a href="/discuss/question/detail/${vo.get('questionId')}">
                                                                <div class="zh-summary summary clearfix">${vo.get('questionTitle')}</div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:when>
                                <c:when test="${vo.type==4}">
                                    <div class="feed-item folding feed-item-hook feed-item-2
                        " feed-item-a="" data-type="a" id="feed-2" data-za-module="FeedItem" data-za-index="">
                                        <meta itemprop="ZReactor" data-id="389034" data-meta="{&quot;source_type&quot;: &quot;promotion_answer&quot;, &quot;voteups&quot;: 4168, &quot;comments&quot;: 69, &quot;source&quot;: []}">
                                        <div class="feed-item-inner">
                                            <div class="avatar">
                                                <a title="${vo.get('userName')}" data-tip="p$t$amuro1230" class="zm-item-link-avatar" target="_blank" href="/user/${vo.userId}">
                                                    <img src="${vo.get('userHead')}" class="zm-item-img-avatar"></a>
                                            </div>
                                            <div class="feed-main">
                                                <div class="feed-content" data-za-module="AnswerItem">
                                                    <meta itemprop="answer-id" content="389034">
                                                    <meta itemprop="answer-url-token" content="13174385">
                                                    <!--
                                                    <h2 class="feed-title">
                                                        <a class="question_link" target="_blank" href="/question/$!{vo.questionId}">$!{vo.questionTitle}</a></h2>
                                                    <div class="feed-question-detail-item">
                                                        <div class="question-description-plain zm-editable-content"></div>
                                                    </div>
                                                    -->
                                                    <div class="expandable entry-body">
                                                        <div class="zm-item-answer-author-info">
                                                            <a class="author-link" data-tip="p$b$amuro1230" target="_blank" href="/user/${vo.userId}">${vo.get('userName')}</a>
                                                            关注了以下问题 ，${vo.create_time}</div>
                                                        <div class="zm-item-rich-text expandable js-collapse-body" data-resourceid="123114" data-action="/answer/content" data-author-name="李淼" data-entry-url="/question/19857995/answer/13174385">
                                                            <a href="/discuss/question/detail/${vo.get('questionId')}">
                                                                <div class="zh-summary summary clearfix">${vo.get('questionTitle')}</div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                    </div>
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
            $.post("/followUser", {"userId": userId}, function (data) {
                if (data.code == 200) {
                    window.location.reload();
                } else if (data.code == 999) {
                    $(location).attr('href', 'http://localhost:8081/toLogin?callback=' + data.result);
                } else {
                    alert(data.msg);
                }
            });
        }

        function unfollowBtn(userId) {
            $.post("/unfollowUser", {"userId": userId}, function (data) {
                if (data.code == 200) {
                    window.location.reload();
                } else if (data.code == 999) {
                    $(location).attr('href', 'http://localhost:8081/toLogin?callback=' + data.result);
                } else {
                    alert(data.msg);
                }
            });
        }
    </script>
</body>

</html>