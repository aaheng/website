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
    <link rel="stylesheet" href="/layui/css/layui.css">

</head>
<body class="zhi  no-auth">
<div class="index-main">
    <div class="index-main-body">
        <div class="index-header">
            <h1 class="logo hide-text"><img src="" alt=""></h1>
            <h2 class="subtitle">
                欢迎登录
            </h2>
        </div>
        <div class="desk-front sign-flow clearfix sign-flow-simple">
            <div class="view view-signin" data-za-module="SignInForm" style="display: block;">
                <form action="" id="loginform" method="post">
                    <div class="group-inputs">
                        <div class="email input-wrapper">
                            <input type="text" id="username" aria-label="用户名" placeholder="用户名" autocomplete="new-password">
                        </div>
                        <div class="input-wrapper">
                            <input type="password" id="password" aria-label="密码" placeholder="密码" autocomplete="new-password">
                        </div>
                    </div>
                    <input type="hidden" name="callback" id="callback" value="${callback}"/>
                    <div class="button-wrapper command clearfix">
                        <button class="sign-button submit" type="button" id="submitLogin">登录</button>
                        <button class="sign-button submit" type="reset">重置</button>
                    </div>
                    <div class="signin-misc-wrapper clearfix">
                        <label class="remember-me">新用户?
                            <a href="/toRegister" class="zg-right">前往注册</a>
                        </label>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/framework/jquery.min.js"></script>
<script type="text/javascript" src="/layui/layui.js"></script>
<script>
    $(document).ready(function () {
        $("#submitLogin").click(function () {
            layui.use(['layer'], function () {
                var layer = layui.layer;
                var username = $("#username").val();
                var password = $("#password").val();
                var callback = $("#callback").val();
                if (username == ''){
                    layer.alert("用户名不能为空");
                }else if(password == ''){
                    layer.alert("密码不能为空");
                }else {
                    $.post("/login",{"username":username,"password":password,"callback":callback},function (data) {
                        if (data.code == 200){
                            //window.location.href = "http://localhost:8081"+data.result;
                            if (data.result == ''){
                                $(location).attr('href', 'http://localhost:8081');
                            }else{
                                $(location).attr('href', 'http://localhost:8081/'+data.result);
                            }

                        }else {
                            layer.msg(data.msg, {
                                offset: '50%',
                                icon: 2,
                                time: 2000
                            });
                        }
                    });
                }
            });
        });
    });
</script>
</body>
</html>