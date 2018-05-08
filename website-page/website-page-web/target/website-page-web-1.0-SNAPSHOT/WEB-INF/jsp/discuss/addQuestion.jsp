<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>提问</title>
    <link rel="stylesheet" href="/layui/css/layui.css"/>
    <link rel="stylesheet" href="/css/detail.css"/>
</head>
<body class="zhi">
<%--<div class="modal-dialog-bg" aria-hidden="true" style="opacity: 0.5; width: 1366px; height: 1196px;"></div>--%>
<div class="modal-dialog-content">
    <div class="zh-add-question-form">
        <form class="js-add-question-form" style="display: block;">
            <div class="zg-section-big clearfix">
                <div id="zm-modal-dialog-info-wrapper"></div>
                <div style="display: none;position: relative;" id="zm-modal-dialog-warnmsg-wrapper">
                    <div class="zm-modal-dialog-warnmsg zm-modal-dialog-guide-warn-message zg-r5px"></div>

                    <span class="zm-modal-dialog-guide-title-msg"></span>
                </div>
                <div class="zg-form-text-input add-question-title-form" style="position: relative;">
                            <textarea rows="1" class="zg-editor-input zu-seamless-input-origin-element" title="在这里输入问题"
                                      id="question-title" aria-label="写下你的问题" placeholder="写下你的问题"
                                      role="combobox" aria-autocomplete="list" autocomplete="off"
                                      style="height: 22px;"></textarea>
                </div>
            </div>
            <div class="zg-section-big">
                <div class="add-question-section-title">问题说明（可选）：</div>
                <div id="zh-question-suggest-detail-container" class="zm-editable-status-editing">
                    <div class="zm-editable-editor-wrap no-toolbar" style="">
                        <div class="zm-editable-editor-outer">
                            <div class="zm-editable-editor-field-wrap">
                                <div id="mock:k" class="zm-editable-editor-field-element editable"
                                     g_editable="true" role="textbox" contenteditable="true"
                                     style="font-style: italic;">
                                    <p>
                                        <textarea rows="1"
                                                  class="zg-editor-input zu-seamless-input-origin-element"
                                                  title="在这里输入问题"
                                                  id="question-content" aria-label="写下你的问题" placeholder="问题背景、条件等详细信息"
                                                  role="combobox" aria-autocomplete="list" autocomplete="off"
                                                  style="height: 22px;"></textarea>

                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="zm-command">
                <!-- <span id="zh-question-form-tag-err">至少添加一个话题</span> -->
                <a href="javascript:;" name="addq" class="zg-r5px zu-question-form-add zg-btn-blue"
                   id="addQuestion">发布</a>
                <%--<a name="jumpq" class="zg-r5px zg-btn-blue zu-question-form-jump"
                   style="display:none;">查看问题</a>--%>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="/framework/jquery.min.js"></script>
<script type="text/javascript" src="/layui/layui.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#addQuestion").click(function () {
            var title = $("#question-title").val();
            var content = $("#question-content").val();
            $.ajax({
                type: "POST",
                data: {
                    "title": title,
                    "content": content
                },
                async: true,
                url: "/discuss/question/insert",
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
        });
    });
</script>
</body>
</html>
