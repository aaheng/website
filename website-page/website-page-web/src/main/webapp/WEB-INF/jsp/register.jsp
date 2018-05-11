<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>layui</title>
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
        <form class="layui-form">
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
<script>
    layui.use(['element', 'layer','form','upload'], function () {
        var element = layui.element,//导航的hover效果、二级菜单等功能，需要依赖element模块
            layer = layui.layer,
            upload = layui.upload,
            form = layui.form;

        form.on('submit(registerBtn)', function(data) {
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
                username : username,
                password : password,
                phone : phone,
                headUrl : head_url,
                email : email,
                sex : sex
            };
            $.post("/register",params,function (data) {
                if(data.code == 200){
                    $(location).attr('href', 'http://localhost:8081');
                    form.render();
                }else {
                    layer.msg(data.msg, {
                        offset: '50%',
                        icon: 2,
                        time: 2000
                    });

                    form.render();
                }
            });
            form.render();
        });

        upload.render({
            elem: '#uploadBtn'
            , url: '/upload/uploadImage'
            ,field : "file"
            , done: function (res) {
                if (res.code == 200) {
                    $("#headerImg").attr("src", res.result.imgPath);
                    $("#headerImg").attr("style","display:block;width:50px;height:50px;padding-left: 10px");
                    $("#head_url").val(res.result.imgPath);
                    $("#headImgHref").attr("href",res.result.imgPath);
                } else {
                    layer.msg(data.msg, {
                        offset: '50%',
                        icon: 2,
                        time: 2000
                    });
                }
            }
        });
    });
</script>
<%--<script src="/js/website/user/upload.js"/>--%>

</body>

</html>