<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN"
      class="is-AppPromotionBarVisible cssanimations csstransforms csstransitions flexbox no-touchevents no-mobile">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="/css/login.css">

</head>
<body class="zhi  no-auth">
<div class="index-main">
    <div class="index-main-body">
        <div class="index-header">
            <h1 class="logo hide-text"><img src="../images/res/nk.png" alt=""></h1>
            <h2 class="subtitle">
                <c:if test="${msg != null}">
                    ${msg}
                </c:if>
                <c:if test="${msg == null}">
                与世界分享你的知识、经验和见解
                </c:if>
            </h2>
        </div>
        <div class="desk-front sign-flow clearfix sign-flow-simple">
            <div class="view view-signin" data-za-module="SignInForm" style="display: block;">
                <form action="/login/" id="loginform" method="post">
                    <div class="group-inputs">
                        <div class="email input-wrapper">
                            <input type="text" name="username" aria-label="手机号或邮箱" placeholder="手机号或邮箱" required="">
                        </div>
                        <div class="input-wrapper">
                            <input type="password" name="password" aria-label="密码" placeholder="密码" required="">
                        </div>
                    </div>
                    <input type="hidden" name="callback" value="${callback}"/>
                    <div class="button-wrapper command clearfix">
                        <button class="sign-button submit" type="submit" onclick="form=document.getElementById('loginform');form.action='/login/'">登录</button>
                        <button class="sign-button submit" type="submit" onclick="form=document.getElementById('regloginform');form.action='/register/'">注册</button>
                    </div>
                    <div class="signin-misc-wrapper clearfix">
                        <label class="remember-me">
                            <input type="checkbox" name="rememberme" checked="" value="true"> 记住我
                        </label>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>