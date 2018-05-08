<%--
  Created by IntelliJ IDEA.
  User: aheng
  Date: 2018/3/11
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="addquestion" class="white_content">
    <div class="modal-dialog-title">
        <span class="modal-dialog-title-text" id=":i" role="heading">提出问题</span>
        <span class="modal-dialog-title-close" tabindex="0" aria-label="Close"
              onclick="document.getElementById('addquestion').style.display='none';document.getElementById('fade').style.display='none'"
        ></span>
    </div>
    <div class="modal-dialog-content">
        <div class="zh-add-question-form">
            <form class="js-add-question-form" style="display: block;">
                <div class="zg-section-big clearfix">

                    <div class="add-question-section-title">问题标题：</div>
                    <div class="zg-form-text-input add-question-title-form" style="position: relative;">
                            <textarea rows="1" class="zg-editor-input zu-seamless-input-origin-element" title="在这里输入问题"
                                      id="question-title" aria-label="写下你的问题" placeholder="写下你的问题"
                                      role="combobox" aria-autocomplete="list" autocomplete="off"
                                      style="height: 22px;">
                            </textarea>
                    </div>
                </div>
                <div class="zg-section-big">
                    <div class="add-question-section-title">问题描述：</div>
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
                                                          id="question-content" aria-label="写下你的问题"
                                                          placeholder="问题背景、条件等详细信息"
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
                    <a href="javascript:;" name="cancel" class="zm-command-cancel"
                       onclick="document.getElementById('addquestion').style.display='none';document.getElementById('fade').style.display='none'">取消</a>
                    <a href="javascript:;" name="addq" class="zg-r5px zu-question-form-add zg-btn-blue"
                       onclick="publishQuestion()">发布</a>
                </div>
                <div class="zm-command" id="question-warning">

                </div>
            </form>
        </div>
    </div>
    <div class="modal-dialog-buttons" style="display: none;"></div>
</div>
<div class="black_overlay" id="fade"></div>

<div id="fasongsixin" class="white_content">
    <div class="modal-dialog-title">
        <span class="modal-dialog-title-text" id=":i" role="heading">发送私信</span>
        <span class="modal-dialog-title-close" tabindex="0" aria-label="Close"
              onclick="document.getElementById('fasongsixin').style.display='none';document.getElementById('fade').style.display='none'"
        ></span>
    </div>
    <div class="modal-dialog-content">
        <div class="zh-add-question-form">
            <form class="js-add-question-form" style="display: block;">
                <div class="zg-section-big clearfix">

                    <div class="add-question-section-title">发给：</div>
                    <div class="zg-form-text-input add-question-title-form" style="position: relative;">
                            <textarea rows="1" class="zg-editor-input zu-seamless-input-origin-element" title="在这里输入问题"
                                      id="toName" aria-label="写下你的问题" placeholder="姓名"
                                      role="combobox" aria-autocomplete="list" autocomplete="off"
                                      style="height: 22px;"></textarea>
                    </div>
                </div>
                <div class="zg-section-big">
                    <div class="add-question-section-title">内容：</div>
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
                                                          id="messageContent" aria-label="写下你的问题" placeholder="私信内容"
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
                    <a href="javascript:;" name="cancel" class="zm-command-cancel"
                       onclick="document.getElementById('fasongsixin').style.display='none';document.getElementById('fade').style.display='none'">取消</a>
                    <a href="javascript:;" name="addq" class="zg-r5px zu-question-form-add zg-btn-blue"
                       onclick="publishMessage()">发布</a>
                </div>
            </form>
        </div>
    </div>
    <div class="modal-dialog-buttons" style="display: none;"></div>
</div>