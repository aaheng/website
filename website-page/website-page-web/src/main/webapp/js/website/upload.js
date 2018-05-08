layui.use(['upload', 'layer'], function () {
    var $ = layui.jquery,
        upload = layui.upload,
        layer = layui.layer;

    upload.render({
        elem: '#uploadVideoBtn'
        , url: '/video/upload'
        , accept: 'file' //视频
        , done: function (res) {
            if (res.code == 200) {
                layer.alert(res.msg, {
                    offset: '20%',
                    icon: 1
                }, function () {
                    window.parent.location.reload();
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                });
            } else if (res.code == 999){
                layer.alert(res.msg, {
                    offset: '20%',
                    icon: 1
                }, function () {
                    window.parent.location.reload();
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                });
               // window.location.href = 'http://localhost:8080/toLogin';
            }else {
                layer.msg(data.msg, {
                    offset: '50%',
                    icon: 2,
                    time: 2000
                });
            }
        }
    });
});