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
    <title>消息详情</title>

    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../styles/font-awesome.min.css">
    <link rel="stylesheet" media="all" href="/css/letter.css">
    <link rel="stylesheet" media="all" href="/layui/css/layui.css">


</head>
<body class="posts_show">
<div class="layui-layout layui-layout-admin">
    <%--<jsp:include page="header.jsp"></jsp:include>--%>

    <%--<div id="main">
        <div class="zg-wrap zu-main clearfix ">
            <button class="layui-btn layui-layout-right" id="addMessage">发私信</button>
            <ul class="letter-list" style="margin-top: 20px">
                <c:forEach items="${messages}" var="message">
                    <li id="msg-item-4009580">
                        <a class="list-head">
                            <img alt="头像" src="${message.get('user').headUrl}">
                        </a>
                        <div class="tooltip fade right in">
                            <div class="tooltip-arrow"></div>
                            <div class="tooltip-inner letter-chat clearfix">
                                <div class="letter-info">
                                    <p class="letter-time">${message.get("message").create_time}</p>
                                    <!-- <a href="javascript:void(0);" id="del-link" name="4009580">删除</a> -->
                                </div>
                                <p class="chat-content">
                                        ${message.get("message").content}
                                </p>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>

        </div>
    </div>--%>
    <div class="layui-header">
        <div class="layui-logo">logo</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item">
                <a href="/">首页</a>
            </li>
            <li class="layui-nav-item">
                <a href="/video">教学视频</a>
            </li>
            <li class="layui-nav-item">
                <a href="">在线测评</a>
            </li>
            <li class="layui-nav-item">
                <a href="/discuss/index">讨论区</a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="">邮件管理</a>
                    </dd>
                    <dd>
                        <a href="">消息管理</a>
                    </dd>
                    <dd>
                        <a href="">授权管理</a>
                    </dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <c:choose>
                <c:when test="${user==null}">
                    <li class="layui-nav-item">
                        <a href="/toLogin">登录</a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="/toRegister">注册</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="layui-nav-item">
                        <a href="/user/toMessage">消息</a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="/toRegister">注册</a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="/user/${user.id}">${user.username}</a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="/follow/">社交管理</a>
                            </dd>
                            <dd>
                                <a href="/user/${user.id}">我的主页</a>
                            </dd>
                            <dd>
                                <a href="/user/toEditUser/${user.id}">资料修改</a>
                            </dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="/logout/${user.id}">退出</a>
                    </li>
                </c:otherwise>
            </c:choose>

        </ul>
    </div>
    <div id="main">
        <div class="zg-wrap zu-main clearfix ">
            <ul class="letter-chatlist">
                <c:forEach items="${messages}" var="message">
                <li>
                    <a class="list-head" href="/user/${message.get('user').headUrl}">
                        <img alt="头像" src="${message.get('user').headUrl}">
                    </a>
                    <div class="tooltip fade right in">
                        <div class="tooltip-arrow"></div>
                        <div class="tooltip-inner letter-chat clearfix">
                            <div class="letter-info">
                                <p class="letter-time">${message.get("message").create_time}</p>
                                <%--<a href="javascript:void(0);" id="del-link" name="4009580">删除</a>--%>
                            </div>
                            <%--<p class="chat-content" style="color: #0a1015">
                                    ${message.get("message").content}
                            </p>--%>
                            <p class="letter-brief">
                                <a href="/user/msg/detail?conversationId=${vo.get('message').conversationId}">
                                        ${vo.get('message').content}
                                </a>
                            </p>
                        </div>
                    </div>
                </li>
                </c:forEach>
            </ul>
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
</script>
</body>
</html>