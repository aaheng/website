<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/layui/css/layui.css" rel="stylesheet"/>
<div class="layui-header">
    <div class="layui-logo">logo</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
        <li class="layui-nav-item">
            <a href="">首页</a>
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
                    <a href="/user/${user.id}">${user.username}</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="/follow/">社交管理</a>
                        </dd>
                        <dd>
                            <a href="/user/${user.id}">我的主页</a>
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