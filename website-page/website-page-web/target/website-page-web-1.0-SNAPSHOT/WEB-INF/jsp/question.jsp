<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>问题详情</title>

    <link rel="shortcut icon" href="/images/favicon.png"/>

    <!-- Style Sheet-->
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/css/detail.css"/>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <!-- Start of Header -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- End of Header -->

    <div class="zg-wrap zu-main clearfix with-indention-votebar" itemscope="" itemtype="http://schema.org/Question"
         id="zh-single-question-page" data-urltoken="36301524" role="main">
        <div class="zu-main-content">
            <div class="zu-main-content-inner">
                <meta itemprop="isTopQuestion" content="false">
                <meta itemprop="visitsCount" content="402">
                <div id="zh-question-title" data-editable="true" class="zm-editable-status-normal">
                    <h2 class="zm-item-title">

                        <span class="zm-editable-content">${question.title}</span>
                    </h2>
                </div>
                <div id="zh-question-detail" class="zm-item-rich-text zm-editable-status-normal"
                     data-resourceid="6727688"
                     data-action="/question/detail">
                    <div class="zm-editable-content">${question.content}</div>
                </div>
                <div class="zm-side-section">
                    <div class="zm-side-section-inner" id="zh-question-side-header-wrap">
                        <button data-follow="q:m:button" class="follow-button zg-follow zg-btn-green" data-id="6727688">
                            关注问题
                        </button>
                        <div class="zh-question-followers-sidebar">
                            <div class="zg-gray-normal">
                                <a href="">
                                    <strong>9</strong></a>人关注该问题
                            </div>
                            <div class="list zu-small-avatar-list zg-clear">
                                <a data-tip="p$b$yi-yi-98-91-99" class="zm-item-link-avatar" href=""
                                   data-original_title="奕奕">
                                    <img src="/images/res/6ceea810748d179f57cac0baa5cf9592_s.jpg"
                                         class="zm-item-img-avatar"></a>
                                <a data-tip="p$b$wang-wu-29-54" class="zm-item-link-avatar" href=""
                                   data-original_title="王五">
                                    <img src="/images/res/da8e974dc_s.jpg" class="zm-item-img-avatar"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="zh-question-answer-wrap" data-pagesize="10" class="zh-question-answer-wrapper navigable"
                     data-widget="navigable"
                     data-navigable-options="{&quot;items&quot;: &quot;&gt;.zm-item-answer&quot;}"
                     data-init="{&quot;params&quot;: {&quot;url_token&quot;: 36301524, &quot;pagesize&quot;: 10, &quot;offset&quot;: 0}, &quot;nodename&quot;: &quot;QuestionAnswerListV2&quot;}">
                    <c:forEach items="${vos}" var="vo">
                    <div tabindex="-1" class="zm-item-answer  zm-item-expanded" itemprop="topAnswer" itemscope=""
                         itemtype="http://schema.org/Answer" data-aid="22162611" data-atoken="66862039"
                         data-collapsed="0"
                         data-created="1444310527" data-deleted="0" data-helpful="1" data-isowner="0"
                         data-copyable="1"
                         data-za-module="AnswerItem">


                        <div class="zm-votebar goog-scrollfloater" data-za-module="VoteBar">
                            <c:choose>
                                <c:when test="${vo.get('liked')>0}">
                                    <button class="up js-like pressed" title="赞同"
                                            onclick="upLike(${vo.get('comment').id})"
                                            id="likeButton">
                                        <i class="icon vote-arrow"></i>
                                        <span class="count js-voteCount" id="js-voteCount">${vo.get('likeCount')}</span>
                                        <span class="label sr-only">赞同</span>
                                    </button>
                                    <button class="down js-dislike" title="反对，不会显示你的姓名"
                                            onclick="downDislike(${vo.get('comment').id})" id="dislikeButton">
                                        <i class="icon vote-arrow"></i>
                                        <span class="label sr-only">反对，不会显示你的姓名</span>
                                    </button>
                                </c:when>
                                <c:when test="${vo.get('liked')<0}">
                                    <button class="up js-like" title="赞同" onclick="upLike(${vo.get('comment').id})"
                                            id="likeButton">
                                        <i class="icon vote-arrow"></i>
                                        <span class="count js-voteCount" id="js-voteCount">${vo.get('likeCount')}</span>
                                        <span class="label sr-only">赞同</span>
                                    </button>
                                    <button class="down js-dislike pressed" title="反对，不会显示你的姓名"
                                            onclick="downDislike(${vo.get('comment').id})" id="dislikeButton"
                                            aria-pressed="true">
                                        <i class="icon vote-arrow"></i>
                                        <span class="label sr-only">反对，不会显示你的姓名</span>
                                    </button>
                                </c:when>
                                <c:otherwise>
                                    <button class="up js-like" title="赞同" onclick="upLike(${vo.get('comment').id})"
                                            id="likeButton">
                                        <i class="icon vote-arrow"></i>
                                        <span class="count js-voteCount" id="js-voteCount">0</span>
                                        <span class="label sr-only">赞同</span>
                                    </button>
                                    <button class="down js-dislike" title="反对，不会显示你的姓名"
                                            onclick="downDislike(${vo.get('comment').id})" id="dislikeButton">
                                        <i class="icon vote-arrow"></i>
                                        <span class="label sr-only">反对，不会显示你的姓名</span>
                                    </button>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="answer-head">
                            <div class="zm-item-answer-author-info">
                                <a class="zm-item-link-avatar avatar-link" href="" target="_blank"
                                   data-tip="p$t$yingxiaodao">
                                        <%--<img src="../images/res/11be4a90ed938abfbab4899df56ee754_s.png"
                                             class="zm-list-avatar avatar">--%></a>
                                <div class="zm-item-vote-info" data-votecount="28" data-za-module="VoteInfo">
                                <span class="voters text">
                                    <a href="" class="more text">
                                        <span class="js-voteCount">${vo.get('likeCount')}</span>&nbsp;人赞同</a></span>
                                </div>
                            </div>
                            <div class="answer-head">
                                <div class="zm-item-answer-author-info">
                                    <a class="zm-item-link-avatar avatar-link" href="" target="_blank"
                                       data-tip="p$t$yingxiaodao">
                                            <%--<img src="/images/res/11be4a90ed938abfbab4899df56ee754_s.png"
                                                 class="zm-list-avatar avatar">--%></a>
                                    <a class="author-link" data-tip="p$t$yingxiaodao" target="_blank"
                                       href="">${vo.get("user").username}</a>
                                    <span title="" class="bio"></span></div>
                                <div class="zm-item-vote-info" data-votecount="28" data-za-module="VoteInfo">
                                        <%--<span class="voters text">
                                            发布于${vo.get('comment').create_time}
                                        </span>--%>
                                </div>
                            </div>
                            <div class="zm-item-rich-text expandable js-collapse-body" data-resourceid="6727688"
                                 data-action="/answer/content" data-author-name="营销岛"
                                 data-entry-url="/question/36301524/answer/66862039">
                                <div class="zh-summary summary clearfix" style="display:block;">
                                    <div class="zm-editable-content clearfix" style="font-size: 20px">
                                            ${vo.get("comment").content}
                                    </div>
                                </div>
                                <div class="zm-item-meta answer-actions clearfix js-contentActions">
                                    <div class="zm-meta-panel">
                                        <a itemprop="url" class="answer-date-link meta-item" target="_blank" href="">发布于
                                                ${vo.get('comment').create_time}</a>
                                        <a href="" name="addcomment"
                                           class="meta-item toggle-comment js-toggleCommentBox">
                                            <i class="z-icon-comment"></i>
                                            <c:choose>
                                                <c:when test="${vo.get('comment').comment_count}>0">
                                                    ${vo.get('comment').comment_count}条评论
                                                </c:when>
                                                <c:otherwise>
                                                    0条评论
                                                </c:otherwise>
                                            </c:choose>

                                        </a>

                                        <button class="item-collapse js-collapse" style="transition: none;">
                                            <i class="z-icon-fold"></i>收起
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        <div id="zh-question-collapsed-wrap" class="zh-question-answer-wrapper"
                             style="display:none"></div>
                        <a name="draft"></a>
                        <div id="zh-question-answer-form-wrap" class="zh-question-answer-form-wrap">
                            <div class="zm-editable-tip zu-answer-form-disabled-wrap" style="display: none;"></div>
                            <div class="zm-editable-content" style="display: none;">
                            </div>

                            <input type="hidden" name="questionId" value="${question.id}" id="questionId">
                            <div class="zm-editable-editor-wrap" style="">
                                <div class="zm-editable-editor-outer">
                                    <div class="zm-editable-editor-field-wrap">
                            <textarea name="content" id="content" class="zm-editable-editor-field-element editable"
                                      style="font-style: italic;width:100%;" placeholder="这里写下你的评论"></textarea>
                                    </div>
                                </div>
                                <div class="zm-command clearfix">
                        <span class=" zg-right">
                            <button id="addCommentBtn">发布回答</button>

                        </span>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="/framework/jquery.min.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
    <script type="text/javascript" src="/js/website/discuss.js"/>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#addCommentBtn").click(function () {
                var questionId = $("#questionId").val();
                var content = $("#content").val();

                $.ajax({
                    type: "POST",
                    data: {
                        "questionId": questionId,
                        "content": content
                    },
                    async: true,
                    url: "/discuss/comment/add",
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
</body>
</html>
