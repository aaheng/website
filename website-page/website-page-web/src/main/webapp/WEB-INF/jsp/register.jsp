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
                    <input type="text" id="username" required lay-verify="required" placeholder="请输入用户名"
                           autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="password" required lay-verify="required" placeholder="请输入密码"
                           autocomplete="off" class="layui-input">
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
<script>
    //Demo
    layui.use(['form', 'layer'], function () {
        var $ = layui.jquery,
            form = layui.form,
            layer = layui.layer;

        //监听提交
        form.on('submit(registerBtn)', function (data) {
            var username = $("#username").val();
            var password = $("#password").val();
            var phone = $("#phone").val();
            var head_url = $("#head_url").val();
            var email = $("#email").val();
            var sex = $("#sex").val();
            if (sex) {
                sex = 1;
            } else {
                sex = 0;
            }
            var params = {
                "username": username,
                "password": password,
                "phone": phone,
                "headUrl": head_url,
                "email": email,
                "sex": sex
            };
            $.ajax({
                type: "POST",
                data: params,
                async: true,
                url: "/register",
                success: function (data) {
                    if (data.code == 200) {
                        layui.use(['layer'], function () {
                            var layer = layui.layer;
                            layer.alert("添加成功", {
                                offset: '20%',
                                icon: 1
                            }, function () {
                                window.parent.location.reload();
                                var index = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(index);
                            });
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
            form.render();
        });
    });
</script>
<script src="/js/website/user/upload.js"/>
</body>

</html>