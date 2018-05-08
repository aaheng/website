<%--
  Created by IntelliJ IDEA.
  User: aheng
  Date: 2018/4/11
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN"
      class="is-AppPromotionBarVisible cssanimations csstransforms csstransitions flexbox no-touchevents no-mobile">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>读《Web 全栈工程师的自我修养》 - web开发的愚人之旅 - 牛客网</title>

    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../styles/font-awesome.min.css">

    <link rel="stylesheet" media="all" href="/layui/css/layui.css">
    <link rel="stylesheet" media="all" href="/css/letter.css">

    <script src="../scripts/hm.js"></script>
    <script src="../scripts/detail.js"></script>

    <script type="text/javascript" src="../scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="../scripts/jquery.qrcode.min.js"></script>
</head>
<body class="posts_show">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="header.jsp"></jsp:include>

    <div id="main">
        <div class="zg-wrap zu-main clearfix ">
            <button class="layui-btn layui-layout-right" id="addMessage">发私信</button>
            <ul class="letter-list" style="margin-top: 20px">
                <li id="conversation-item-10005_622873">
                    <a class="letter-link"
                       href="msg-list?conversationId=10005_622873&amp;updateRead=1&amp;msgType=1"></a>
                    <div class="letter-info">
                        <span class="l-time">今天 15:28</span>
                        <div class="l-operate-bar">
                            <a href="javascript:void(0);" class="sns-action-del" data-id="10005_622873">
                                删除
                            </a>
                            <a href="msg-list?conversationId=10005_622873&amp;updateRead=1&amp;msgType=1">
                                共268条会话
                            </a>
                        </div>
                    </div>
                    <div class="chat-headbox">
                        <span class="msg-num">
                            99+
                        </span>
                        <a class="list-head">
                            <img alt="头像" src="http://static.nowcoder.com/images/head/notify.png">
                        </a>
                    </div>
                    <div class="letter-detail">
                        <a title="通知" class="letter-name level-color-1">
                            通知
                        </a>
                        <p class="letter-brief">
                            <a href="msg-list?conversationId=10005_622873&amp;updateRead=1&amp;msgType=1">
                                你收藏的问题"二维数组中的查找" 有了新的回答，去看看对自己是否有用吧。（不想再收到此类提醒？点击设置 ）
                            </a>
                        </p>
                    </div>
                </li>
            </ul>

        </div>
    </div>

</div>
<script type="text/javascript" src="/framework/jquery.min.js"></script>
<script type="text/javascript" src="/layui/layui.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#addMessage").click(function () {
            layui.use(['layer'], function () {
                var layer = layui.layer;
                layerIndex = layer.open({
                    title: "发私信",
                    type: 2,
                    content: "/user/toAddMessage",
                    maxmin: false,
                    resize: false,
                    offset: '5%',
                    area: ["700px", "400px"]
                });
            });
        });
    });
</script>
<script>
    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
</body>
</html>