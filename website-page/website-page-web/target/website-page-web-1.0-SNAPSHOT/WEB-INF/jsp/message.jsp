<%--
  Created by IntelliJ IDEA.
  User: aheng
  Date: 2018/4/11
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="zh-CN"
      class="is-AppPromotionBarVisible cssanimations csstransforms csstransitions flexbox no-touchevents no-mobile">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>消息</title>

    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../styles/font-awesome.min.css">

    <link rel="stylesheet" media="all" href="/layui/css/layui.css">
    <link rel="stylesheet" media="all" href="/css/letter.css">

</head>
<body class="posts_show">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="header.jsp"></jsp:include>

    <div id="main">
        <div class="zg-wrap zu-main clearfix ">
            <button class="layui-btn layui-layout-right" id="addMessage">发私信</button>
            <ul class="letter-list" style="margin-top: 20px">
                <c:forEach items="${vos}" var="vo">
                    <li id="conversation-item-10005_622873">
                        <a class="letter-link"
                           href="/user/msg/detail?conversationId=${vo.get('message').conversationId}"></a>
                        <div class="letter-info">
                            <span class="l-time">${vo.get('message').create_time}</span>
                            <div class="l-operate-bar">
                                <%--<a href="javascript:void(0);" class="sns-action-del" data-id="10005_622873">
                                    删除
                                </a>--%>
                                <a href="/user/msg/detail?conversationId=${vo.get('message').conversationId}">
                                    共${vo.get('message').id}条会话
                                </a>
                            </div>
                        </div>
                        <div class="chat-headbox">
                        <span class="msg-num">
                                ${vo.get('unread')}
                        </span>
                            <a class="list-head">
                                <img alt="头像" src="${vo.get('user').headUrl}">
                            </a>
                        </div>
                        <div class="letter-detail">
                            <a title="通知" class="letter-name level-color-1">
                                    ${vo.get('user').username}
                            </a>
                            <p class="letter-brief">
                                <a href="/user/msg/detail?conversationId=${vo.get('message').conversationId}">
                                        ${vo.get('message').content}
                                </a>
                            </p>
                        </div>
                    </li>
                </c:forEach>
            </ul>

        </div>
    </div>

</div>
<script type="text/javascript" src="/framework/jquery.min.js"></script>
<script type="text/javascript" src="/layui/layui.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#addMessage").click(function () {
            layui.use(['layer'], function () {
                var layer = layui.layer;
                layerIndex = layer.open({
                    title: "发私信",
                    type: 2,
                    content: "/user/toAddMessage",
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