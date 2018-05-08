function uploadVideo() {
    layui.use(['layer'], function () {
        var layer = layui.layer;
        alert("22");
        layerIndex = layer.open({
            title: "上传视频",
            type: 2,
            content: "/discuss/toAddQuestion",
            maxmin: false,
            resize: false,
            offset: '5%',
            area: ["700px", "400px"]
        });
    });
}