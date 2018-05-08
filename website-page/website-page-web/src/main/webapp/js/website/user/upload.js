layui.use(['upload', 'layer','form'], function () {
    var $ = layui.jquery,
        upload = layui.upload,
        form = layui.form,
        layer = layui.layer;
    alert("123");
    upload.render({
        elem: '#uploadBtn'
        , url: '/upload/uploadImage'
        , accept: 'file' //文件
        , done: function (res) {
            if (res.code == 200) {
                $("#headerImg").attr("src", res.result.imgPath);
                $("#headerImg").attr("style","display:block;width:50px;height:50px;padding-left: 10px");
                $("#head_url").val(res.result.imgPath);
                $("#headImgHref").attr("href",res.result.imgPath);
            } else if (res.code == 999) {
                layer.alert(res.msg, {
                    offset: '20%',
                    icon: 1
                }, function () {
                    window.parent.location.reload();
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                });
                // window.location.href = 'http://localhost:8080/toLogin';
            } else {
                layer.msg(data.msg, {
                    offset: '50%',
                    icon: 2,
                    time: 2000
                });
            }
        }
    });

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
        $.post("/register",params,function (data) {
            if (data.code == 200){
                window.location.href = "http://localhost:8080";
            }else {
                layer.msg(data.msg, {
                    offset: '50%',
                    icon: 2,
                    time: 2000
                });
            }
        });
        form.render();
    });
});