<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>

<body class="layui-body" style="background: #fafafa">
<div class="layui-container" style="width: 900px;">
    <div style="padding: 40px;">
        <div style="font-size: 30px;color: #009688;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 用户注册
        </div>
        <br/>
        <form class="layui-form" action="/register" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                    <input type="text" id="username" lay-verify="required" placeholder="请输入用户名"
                           autocomplete="new-password"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="password" lay-verify="required" placeholder="请输入密码"
                           autocomplete="new-password" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">手机</label>
                    <div class="layui-input-inline">
                        <input type="tel" id="phone" lay-verify="required" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">头像</label>
                <div class="layui-upload">
                    <button type="button" class="layui-btn"
                            id="uploadBtn" style="float: left">选择图片
                    </button>
                    <span>
                        <a href="javascript:void(0);" id="headImgHref" target="_blank">
                            <img id="headerImg" src="" style="display: none;">
                            <input id="head_url" type="hidden">
                        </a>
                    </span>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-inline">
                        <input type="text" id="email" lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <%--<div class="layui-form-item">
                <label class="layui-form-label">身份</label>
                <div class="layui-input-block">
                    <input type="radio" name="status" value="1" title="教师">
                    <input type="radio" name="status" value="2" title="学生" checked>
                </div>
            </div>--%>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input type="checkbox" name="" lay-skin="switch" lay-text="男|女" id="sex">
                    <%--<input type="radio" name="sex" value="1" title="男">
                    <input type="radio" name="sex" value="0" title="女" checked>--%>
                </div>
            </div>
            <div class="layui-form-item layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="registerBtn">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript" src="/framework/jquery.min.js"></script>
<script src="/layui/layui.js"></script>
<script src="/js/website/user/upload.js"/>
<script>
    /*$(document).ready(function () {

    });*/
</script>
</body>

</html>