<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                           autocomplete="new-password" value="${user.username}"
                           class="layui-input">
                    <input type="hidden" value="${user.id}" id="id">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="password" lay-verify="required" placeholder="请输入密码"
                           autocomplete="new-password" class="layui-input" value="">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">手机</label>
                    <div class="layui-input-inline">
                        <input type="tel" id="phone" lay-verify="required" autocomplete="off"
                               class="layui-input" value="${user.phone}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">头像</label>
                <div class="layui-upload">
                    <%--<form action="/upload/uploadImage" enctype="multipart/form-data">--%>
                    <input type="file" id="btn_file" style="display:none" onchange="changeImage()" name="file">
                    <button type="button" class="layui-btn"
                            id="uploadBtn" style="float: left" onclick="upLoadImage()">选择图片
                    </button>
                    <%--</form>--%>

                    <span>
                        <a href="javascript:void(0);" id="headImgHref" target="_blank">
                            <img id="headerImg" src="${user.headUrl}" style="display:block;width:50px;height:50px;padding-left: 10px">
                            <input id="head_url" type="hidden" value="${user.headUrl}">
                        </a>
                    </span>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-inline">
                        <input type="text" id="email" lay-verify="required" autocomplete="off" class="layui-input"
                               value="${user.email}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">身份</label>
                <div class="layui-input-block">
                    <input type="radio" name="status" value="1" title="教师">
                    <input type="radio" name="status" value="2" title="学生" checked>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">

                    <%--<input type="radio" name="sex" value="1" title="男">
                    <input type="radio" name="sex" value="0" title="女" checked>--%>
                    <c:choose>
                        <c:when test="${user.sex == 1}">
                            <input type="checkbox" name="" lay-skin="switch" lay-text="男|女" id="sex" checked>
                        </c:when>
                        <c:otherwise>
                            <input type="checkbox" name="" lay-skin="switch" lay-text="男|女" id="sex">
                        </c:otherwise>
                    </c:choose>
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
    function upLoadImage() {
        $("#btn_file").click();
    }

    function changeImage() {
        var fileObj = document.getElementById("btn_file").files[0]; // js 获取文件对象
        if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
            alert("请选择图片");
            return;
        }
        var formFile = new FormData();
        //formFile.append("action", "UploadVMKImagePath");
        formFile.append("file", fileObj); //加入文件对象

        var data = formFile;
        $.ajax({
            url: "/upload/uploadImage",
            data: data,
            type: "Post",
            dataType: "json",
            cache: false,//上传文件无需缓存
            processData: false,//用于对data参数进行序列化处理 这里必须false
            contentType: false, //必须
            success: function (res) {
                if (res.code == 200) {
                    layui.use(['layer'], function () {
                        var layer = layui.layer;
                        layer.msg("上传成功", {
                            offset: '50%',
                            icon: 1,
                            time: 2000
                        });
                    });
                    $("#headerImg").attr("src", res.result.imgPath);
                    $("#headerImg").attr("style", "display:block;width:50px;height:50px;padding-left: 10px");
                    $("#head_url").val(res.result.imgPath);
                    $("#headImgHref").attr("href", res.result.imgPath);
                } else {
                    layui.use(['layer'], function () {
                        var layer = layui.layer;
                        layer.msg(data.msg, {
                            offset: '50%',
                            icon: 2,
                            time: 2000
                        });
                    });

                }
            },
        })

    }
</script>

<script>
    layui.use(['element', 'layer', 'form', 'upload'], function () {
        var element = layui.element,//导航的hover效果、二级菜单等功能，需要依赖element模块
            layer = layui.layer,
            upload = layui.upload,
            form = layui.form;

        form.on('submit(registerBtn)', function (data) {
            var id = $("#id").val();
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
                id: id,
                username: username,
                password: password,
                phone: phone,
                headUrl: head_url,
                email: email,
                sex: sex
            };
            $.post("/user/editUser", params, function (data) {
                if (data.code == 200) {
                    $(location).attr('href', 'http://localhost:8081');
                    form.render();
                } else {
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
    });
</script>
<%--<script src="/js/website/user/upload.js"/>--%>

</body>

</html>