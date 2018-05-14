<%--
  Created by IntelliJ IDEA.
  User: aheng
  Date: 2018/5/5
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="zh-CN"
      class="is-AppPromotionBarVisible cssanimations csstransforms csstransitions flexbox no-touchevents no-mobile">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>关注列表</title>
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
    <div id="main">
        <div class="zg-wrap zu-main clearfix ">
            <div class="zm-profile-section-wrap zm-profile-followee-page">
                <div class="zm-profile-section-head">
                    <span class="zm-profile-section-name">
                        <a href="#">${curUser.username}</a> 关注了 ${followeeCount} 人
                    </span>
                </div>
                <div class="zm-profile-section-list">
                    <div id="zh-profile-follows-list">
                        <div class="zh-general-list clearfix">
                            <c:forEach var="vo" items="${followees}">
                                <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                    <c:choose>
                                        <c:when test="${vo.get('followed')}">
                                            <div class="zg-right">
                                                <button class="zg-btn zg-btn-unfollow zm-rich-follow-btn small nth-0
                                    js-follow-user" onclick="unfollowBtn(${vo.get('user').id})">取消关注
                                                </button>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="zg-right">
                                                <button class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0
                                    js-follow-user" onclick="followBtn(${vo.get('user').id})">关注
                                                </button>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>

                                    <a title="Barty" class="zm-item-link-avatar" href="/user/${vo.get('user').id}">
                                        <img src="${vo.get('user').headUrl}" class="zm-item-img-avatar">
                                    </a>
                                    <div class="zm-list-content-medium">
                                        <h2 class="zm-list-content-title"><a data-tip="p$t$buaabarty"
                                                                             href="/user/${vo.get('user').id}"
                                                                             class="zg-link"
                                                                             title="Barty">${vo.get('user').username}</a>
                                        </h2>

                                        <!-- <div class="zg-big-gray">计蒜客教研首席打杂</div> -->
                                        <div class="details zg-gray">
                                            <a target="_blank" href="/user/${vo.get('user').id}/followers"
                                               class="zg-link-gray-normal">${vo.get('followeeCount')}粉丝</a>
                                            /
                                            <a target="_blank" href="/user/${vo.get('user').id}/followees"
                                               class="zg-link-gray-normal">${vo.get('followeeCount')}关注</a>
                                            /
                                            <a target="_blank" href="#"
                                               class="zg-link-gray-normal">${vo.get('commentCount')}
                                                回答</a>
                                            <%--/
                                            <a target="_blank" href="#" class="zg-link-gray-normal">548 赞同</a>--%>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                        <a aria-role="button" class="zg-btn-white zu-button-more">更多</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

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