<%--
  Created by IntelliJ IDEA.
  User: aheng
  Date: 2018/5/5
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="zh-CN"
      class="is-AppPromotionBarVisible cssanimations csstransforms csstransitions flexbox no-touchevents no-mobile">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>粉丝列表</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel='stylesheet' id='bootstrap-css-css' href='/css/bootstrap5152.css?ver=1.0' type='text/css' media='all'/>
    <link rel='stylesheet' id='responsive-css-css' href='/css/responsive5152.css?ver=1.0' type='text/css' media='all'/>
    <link rel='stylesheet' id='pretty-photo-css-css' href='/js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4'
          type='text/css'
          media='all'/>
    <link rel='stylesheet' id='main-css-css' href='/css/main5152.css?ver=1.0' type='text/css' media='all'/>
    <link rel='stylesheet' id='custom-css-css' href='/css/custom5152.html?ver=1.0' type='text/css' media='all'/>
    <link rel="stylesheet" href="/css/result.css"/>

</head>
<body>
<div class="layui-layout layui-layout-admin">
    <%--header--%>
    <jsp:include page="../header.jsp"/>

    <%--<div id="main">
        <div class="zg-wrap zu-main clearfix ">
            <div class="zm-profile-section-wrap zm-profile-followee-page">
                <div class="zm-profile-section-head">
                    <span class="zm-profile-section-name"><a href="/people/zjuyxy">叶向宇</a> 关注了 70 人</span>
                    <a class="zg-right zg-link-litblue-normal zm-profile-answer-page-return"
                       href="/people/zjuyxy">返回个人主页</a>
                </div>
                <div class="zm-profile-section-list">
                    <div id="zh-profile-follows-list">
                        <div class="zh-general-list clearfix"
                             data-init="{&quot;params&quot;: {&quot;offset&quot;: 0, &quot;order_by&quot;: &quot;created&quot;, &quot;hash_id&quot;: &quot;1511065e20b8ce6e99a64565cd2cc1e4&quot;}, &quot;nodename&quot;: &quot;ProfileFolloweesListV2&quot;}">

                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <div class="zg-right">
                                    <button data-follow="m:button" data-id="e61f6ff403018cab810c63a660146c35"
                                            class="zg-btn zg-btn-unfollow zm-rich-follow-btn small nth-0">取消关注
                                    </button>
                                </div>
                                <a title="Barty" data-tip="p$t$buaabarty" class="zm-item-link-avatar"
                                   href="/people/buaabarty">
                                    <img src="https://pic2.zhimg.com/3bc6c4dbf50dbce5fa27174f23404849_m.jpg"
                                         class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$buaabarty"
                                                                         href="https://www.nowcoder.com/people/buaabarty"
                                                                         class="zg-link" title="Barty">Barty</a></h2>

                                    <div class="zg-big-gray">计蒜客教研首席打杂</div>
                                    <div class="details zg-gray">
                                        <a target="_blank" href="/people/buaabarty/followers"
                                           class="zg-link-gray-normal">462
                                            关注者</a>
                                        /
                                        <a target="_blank" href="/people/buaabarty/asks" class="zg-link-gray-normal">0
                                            提问</a>
                                        /
                                        <a target="_blank" href="/people/buaabarty/answers" class="zg-link-gray-normal">21
                                            回答</a>
                                        /
                                        <a target="_blank" href="/people/buaabarty" class="zg-link-gray-normal">548
                                            赞同</a>
                                    </div>

                                </div>
                            </div>

                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <div class="zg-right">
                                    <button data-follow="m:button" data-id="a183b32632088ad4cb0ebf944e555eed"
                                            class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0">关注他
                                    </button>
                                </div>
                                <a title="赵轩昂" data-tip="p$t$sd0061" class="zm-item-link-avatar" href="/people/sd0061">
                                    <img src="https://pic2.zhimg.com/4ee0d8959_m.jpg" class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$sd0061"
                                                                         href="https://www.nowcoder.com/people/sd0061"
                                                                         class="zg-link" title="赵轩昂">赵轩昂</a></h2>

                                    <div class="zg-big-gray">(#°Д°)</div>
                                    <div class="details zg-gray">
                                        <a target="_blank" href="/people/sd0061/followers" class="zg-link-gray-normal">899
                                            关注者</a>
                                        /
                                        <a target="_blank" href="/people/sd0061/asks" class="zg-link-gray-normal">0
                                            提问</a>
                                        /
                                        <a target="_blank" href="/people/sd0061/answers" class="zg-link-gray-normal">23
                                            回答</a>
                                        /
                                        <a target="_blank" href="/people/sd0061" class="zg-link-gray-normal">2592 赞同</a>
                                    </div>

                                </div>
                            </div>

                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <div class="zg-right">
                                    <button data-follow="m:button" data-id="523b05453dd7752bfa66ad63382a3845"
                                            class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0">关注他
                                    </button>
                                </div>
                                <a title="crazyacking" data-tip="p$t$crazyacking" class="zm-item-link-avatar"
                                   href="/people/crazyacking">
                                    <img src="https://pic4.zhimg.com/84a390745798de27bbff1a8dba2633f7_m.jpg"
                                         class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$crazyacking"
                                                                         href="https://www.nowcoder.com/people/crazyacking"
                                                                         class="zg-link"
                                                                         title="crazyacking">crazyacking</a>
                                    </h2>

                                    <div class="zg-big-gray"></div>
                                    <div class="details zg-gray">
                                        <a target="_blank" href="/people/crazyacking/followers"
                                           class="zg-link-gray-normal">5
                                            关注者</a>
                                        /
                                        <a target="_blank" href="/people/crazyacking/asks" class="zg-link-gray-normal">1
                                            提问</a>
                                        /
                                        <a target="_blank" href="/people/crazyacking/answers"
                                           class="zg-link-gray-normal">3
                                            回答</a>
                                        /
                                        <a target="_blank" href="/people/crazyacking" class="zg-link-gray-normal">5
                                            赞同</a>
                                    </div>

                                </div>
                            </div>

                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <div class="zg-right">
                                    <button data-follow="m:button" data-id="25aea6262b8edc613e6b829740ba857b"
                                            class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0">关注他
                                    </button>
                                </div>
                                <a title="彭鹏" data-tip="p$t$pieerepeng" class="zm-item-link-avatar"
                                   href="/people/pieerepeng">
                                    <img src="https://pic1.zhimg.com/da8e974dc_m.jpg" class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$pieerepeng"
                                                                         href="https://www.nowcoder.com/people/pieerepeng"
                                                                         class="zg-link" title="彭鹏">彭鹏</a></h2>

                                    <div class="zg-big-gray">谢谢过去一年给我的帮助</div>
                                    <div class="details zg-gray">
                                        <a target="_blank" href="/people/pieerepeng/followers"
                                           class="zg-link-gray-normal">637
                                            关注者</a>
                                        /
                                        <a target="_blank" href="/people/pieerepeng/asks" class="zg-link-gray-normal">1
                                            提问</a>
                                        /
                                        <a target="_blank" href="/people/pieerepeng/answers"
                                           class="zg-link-gray-normal">14
                                            回答</a>
                                        /
                                        <a target="_blank" href="/people/pieerepeng" class="zg-link-gray-normal">200
                                            赞同</a>
                                    </div>

                                </div>
                            </div>

                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <div class="zg-right">
                                    <button data-follow="m:button" data-id="720c6ef165a77d39a9452c8977729518"
                                            class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0">关注他
                                    </button>
                                </div>
                                <a title="雷军" data-tip="p$t$mileijun" class="zm-item-link-avatar"
                                   href="/people/mileijun">
                                    <img src="https://pic3.zhimg.com/a6fd28f70584d499f1d1f184c4769d56_m.jpg"
                                         class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$mileijun"
                                                                         href="https://www.nowcoder.com/people/mileijun"
                                                                         class="zg-link" title="雷军">雷军</a></h2>

                                    <div class="zg-big-gray"></div>
                                    <div class="details zg-gray">
                                        <a target="_blank" href="/people/mileijun/followers"
                                           class="zg-link-gray-normal">116021
                                            关注者</a>
                                        /
                                        <a target="_blank" href="/people/mileijun/asks" class="zg-link-gray-normal">0
                                            提问</a>
                                        /
                                        <a target="_blank" href="/people/mileijun/answers" class="zg-link-gray-normal">8
                                            回答</a>
                                        /
                                        <a target="_blank" href="/people/mileijun" class="zg-link-gray-normal">26727
                                            赞同</a>
                                    </div>

                                </div>
                            </div>

                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <div class="zg-right">
                                    <button data-follow="m:button" data-id="59d41f04964870e9a874783d64373d68"
                                            class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0">关注他
                                    </button>
                                </div>
                                <a title="李申申" data-tip="p$t$shen" class="zm-item-link-avatar" href="/people/shen">
                                    <img src="https://pic2.zhimg.com/e14d48805_m.jpg" class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$shen"
                                                                         href="https://www.nowcoder.com/people/shen"
                                                                         class="zg-link" title="李申申">李申申</a></h2>

                                    <div class="zg-big-gray">牛客 002 号员工</div>
                                    <div class="details zg-gray">
                                        <a target="_blank" href="/people/shen/followers" class="zg-link-gray-normal">123146
                                            关注者</a>
                                        /
                                        <a target="_blank" href="/people/shen/asks" class="zg-link-gray-normal">152
                                            提问</a>
                                        /
                                        <a target="_blank" href="/people/shen/answers" class="zg-link-gray-normal">165
                                            回答</a>
                                        /
                                        <a target="_blank" href="/people/shen" class="zg-link-gray-normal">1458 赞同</a>
                                    </div>

                                </div>
                            </div>

                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <div class="zg-right">
                                    <button data-follow="m:button" data-id="317fffe6dcd8df5e5b9c2d9087a4382d"
                                            class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0">关注他
                                    </button>
                                </div>
                                <a title="Wayne Shi" data-tip="p$t$sw2016" class="zm-item-link-avatar"
                                   href="/people/sw2016">
                                    <img src="https://pic3.zhimg.com/059217c75a2a74620ee1e9e494bd91fe_m.png"
                                         class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$sw2016"
                                                                         href="https://www.nowcoder.com/people/sw2016"
                                                                         class="zg-link" title="Wayne Shi">Wayne Shi</a>
                                    </h2>

                                    <div class="zg-big-gray">程序员shiyanlou.com</div>
                                    <div class="details zg-gray">
                                        <a target="_blank" href="/people/sw2016/followers" class="zg-link-gray-normal">1454
                                            关注者</a>
                                        /
                                        <a target="_blank" href="/people/sw2016/asks" class="zg-link-gray-normal">1
                                            提问</a>
                                        /
                                        <a target="_blank" href="/people/sw2016/answers" class="zg-link-gray-normal">28
                                            回答</a>
                                        /
                                        <a target="_blank" href="/people/sw2016" class="zg-link-gray-normal">9104 赞同</a>
                                    </div>

                                </div>
                            </div>

                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <div class="zg-right">
                                    <button data-follow="m:button" data-id="637aaad2e130148aa4f730fc94861f90"
                                            class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0">关注她
                                    </button>
                                </div>
                                <a title="朱晓晓" data-tip="p$t$zhu-xiao-xiao-6" class="zm-item-link-avatar"
                                   href="/people/zhu-xiao-xiao-6">
                                    <img src="https://pic1.zhimg.com/c6fac365c_m.jpg" class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$zhu-xiao-xiao-6"
                                                                         href="https://www.nowcoder.com/people/zhu-xiao-xiao-6"
                                                                         class="zg-link" title="朱晓晓">朱晓晓</a></h2>

                                    <div class="zg-big-gray">温暖善良</div>
                                    <div class="details zg-gray">
                                        <a target="_blank" href="/people/zhu-xiao-xiao-6/followers"
                                           class="zg-link-gray-normal">5 关注者</a>
                                        /
                                        <a target="_blank" href="/people/zhu-xiao-xiao-6/asks"
                                           class="zg-link-gray-normal">2
                                            提问</a>
                                        /
                                        <a target="_blank" href="/people/zhu-xiao-xiao-6/answers"
                                           class="zg-link-gray-normal">6 回答</a>
                                        /
                                        <a target="_blank" href="/people/zhu-xiao-xiao-6" class="zg-link-gray-normal">23
                                            赞同</a>
                                    </div>

                                </div>
                            </div>

                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <div class="zg-right">
                                    <button data-follow="m:button" data-id="f8ddd086c27cc7c577a4b0cde348c8fa"
                                            class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0">关注他
                                    </button>
                                </div>
                                <a title="汪牛" data-tip="p$t$wang-niu-37" class="zm-item-link-avatar"
                                   href="/people/wang-niu-37">
                                    <img src="https://pic3.zhimg.com/4d9f208c2_m.jpg" class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$wang-niu-37"
                                                                         href="https://www.nowcoder.com/people/wang-niu-37"
                                                                         class="zg-link" title="汪牛">汪牛</a></h2>

                                    <div class="zg-big-gray">武汉大学人力资源管理专业毕业，华为公司校园招聘HR</div>
                                    <div class="details zg-gray">
                                        <a target="_blank" href="/people/wang-niu-37/followers"
                                           class="zg-link-gray-normal">16
                                            关注者</a>
                                        /
                                        <a target="_blank" href="/people/wang-niu-37/asks" class="zg-link-gray-normal">0
                                            提问</a>
                                        /
                                        <a target="_blank" href="/people/wang-niu-37/answers"
                                           class="zg-link-gray-normal">1
                                            回答</a>
                                        /
                                        <a target="_blank" href="/people/wang-niu-37" class="zg-link-gray-normal">0
                                            赞同</a>
                                    </div>

                                </div>
                            </div>

                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <div class="zg-right">
                                    <button data-follow="m:button" data-id="df6ca602f8e8673ff1786e3c7208dcea"
                                            class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0">关注他
                                    </button>
                                </div>
                                <a title="南桥印海" data-tip="p$t$none797" class="zm-item-link-avatar"
                                   href="/people/none797">
                                    <img src="https://pic1.zhimg.com/da8e974dc_m.jpg" class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$none797"
                                                                         href="https://www.nowcoder.com/people/none797"
                                                                         class="zg-link" title="南桥印海">南桥印海</a></h2>

                                    <div class="zg-big-gray">51job/校园招聘 爱与梦想/已得其一</div>
                                    <div class="details zg-gray">
                                        <a target="_blank" href="/people/none797/followers" class="zg-link-gray-normal">33
                                            关注者</a>
                                        /
                                        <a target="_blank" href="/people/none797/asks" class="zg-link-gray-normal">3
                                            提问</a>
                                        /
                                        <a target="_blank" href="/people/none797/answers" class="zg-link-gray-normal">11
                                            回答</a>
                                        /
                                        <a target="_blank" href="/people/none797" class="zg-link-gray-normal">24 赞同</a>
                                    </div>

                                </div>
                            </div>

                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <div class="zg-right">
                                    <button data-follow="m:button" data-id="8d0101498478bec2df85aa0985926074"
                                            class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0">关注他
                                    </button>
                                </div>
                                <a title="叶玎玎" data-tip="p$t$yedingding" class="zm-item-link-avatar"
                                   href="/people/yedingding">
                                    <img src="https://pic4.zhimg.com/b825933eb_m.jpg" class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$yedingding"
                                                                         href="https://www.nowcoder.com/people/yedingding"
                                                                         class="zg-link" title="叶玎玎">叶玎玎</a></h2>

                                    <div class="zg-big-gray">Growing.IO 主程，Teahour.fm 主播</div>
                                    <div class="details zg-gray">
                                        <a target="_blank" href="/people/yedingding/followers"
                                           class="zg-link-gray-normal">1024
                                            关注者</a>
                                        /
                                        <a target="_blank" href="/people/yedingding/asks" class="zg-link-gray-normal">0
                                            提问</a>
                                        /
                                        <a target="_blank" href="/people/yedingding/answers"
                                           class="zg-link-gray-normal">28
                                            回答</a>
                                        /
                                        <a target="_blank" href="/people/yedingding" class="zg-link-gray-normal">378
                                            赞同</a>
                                    </div>

                                </div>
                            </div>

                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <div class="zg-right">
                                    <button data-follow="m:button" data-id="7262952144714ec88d11428b69b18bd6"
                                            class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0">关注他
                                    </button>
                                </div>
                                <a title="王小川" data-tip="p$t$wang-xiao-chuan" class="zm-item-link-avatar"
                                   href="/people/wang-xiao-chuan">
                                    <img src="https://pic1.zhimg.com/c3307a743d7e15a59d2ebdaa2e9d3d94_m.jpg"
                                         class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$wang-xiao-chuan"
                                                                         href="https://www.nowcoder.com/people/wang-xiao-chuan"
                                                                         class="zg-link" title="王小川">王小川</a></h2>

                                    <div class="zg-big-gray">搜狗CEO</div>
                                    <div class="details zg-gray">
                                        <a target="_blank" href="/people/wang-xiao-chuan/followers"
                                           class="zg-link-gray-normal">49222 关注者</a>
                                        /
                                        <a target="_blank" href="/people/wang-xiao-chuan/asks"
                                           class="zg-link-gray-normal">4
                                            提问</a>
                                        /
                                        <a target="_blank" href="/people/wang-xiao-chuan/answers"
                                           class="zg-link-gray-normal">73 回答</a>
                                        /
                                        <a target="_blank" href="/people/wang-xiao-chuan" class="zg-link-gray-normal">13757
                                            赞同</a>
                                    </div>

                                </div>
                            </div>

                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <div class="zg-right">
                                    <button data-follow="m:button" data-id="3fe9c07261beef166bad595ba712c536"
                                            class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0">关注他
                                    </button>
                                </div>
                                <a title="闭关写代码" data-tip="p$t$wenmingvs" class="zm-item-link-avatar"
                                   href="/people/wenmingvs">
                                    <img src="https://pic2.zhimg.com/385c2c1564b20b0713f1e2037d8f0971_m.jpg"
                                         class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$wenmingvs"
                                                                         href="https://www.nowcoder.com/people/wenmingvs"
                                                                         class="zg-link" title="闭关写代码">闭关写代码</a></h2>

                                    <div class="zg-big-gray">Android Developer</div>
                                    <div class="details zg-gray">
                                        <a target="_blank" href="/people/wenmingvs/followers"
                                           class="zg-link-gray-normal">976
                                            关注者</a>
                                        /
                                        <a target="_blank" href="/people/wenmingvs/asks" class="zg-link-gray-normal">1
                                            提问</a>
                                        /
                                        <a target="_blank" href="/people/wenmingvs/answers" class="zg-link-gray-normal">18
                                            回答</a>
                                        /
                                        <a target="_blank" href="/people/wenmingvs" class="zg-link-gray-normal">9454
                                            赞同</a>
                                    </div>

                                </div>
                            </div>

                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <div class="zg-right">
                                    <button data-follow="m:button" data-id="4b28859208022198569f0a48937485fb"
                                            class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0">关注她
                                    </button>
                                </div>
                                <a title="Royal" data-tip="p$t$shaw-royal" class="zm-item-link-avatar"
                                   href="/people/shaw-royal">
                                    <img src="https://pic3.zhimg.com/b78b311ba09ed4f4324d8cf39f44ec72_m.jpg"
                                         class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$shaw-royal"
                                                                         href="https://www.nowcoder.com/people/shaw-royal"
                                                                         class="zg-link" title="Royal">Royal</a></h2>

                                    <div class="zg-big-gray">昔日时差党，独立咨询顾问/文艺的接地气，不忘初心</div>
                                    <div class="details zg-gray">
                                        <a target="_blank" href="/people/shaw-royal/followers"
                                           class="zg-link-gray-normal">33
                                            关注者</a>
                                        /
                                        <a target="_blank" href="/people/shaw-royal/asks" class="zg-link-gray-normal">0
                                            提问</a>
                                        /
                                        <a target="_blank" href="/people/shaw-royal/answers"
                                           class="zg-link-gray-normal">10
                                            回答</a>
                                        /
                                        <a target="_blank" href="/people/shaw-royal" class="zg-link-gray-normal">86
                                            赞同</a>
                                    </div>

                                </div>
                            </div>

                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <div class="zg-right">
                                    <button data-follow="m:button" data-id="af6d1af717d454470553ab99ca64ac6b"
                                            class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0">关注他
                                    </button>
                                </div>
                                <a title="范俊浩" data-tip="p$t$fan-jun-hao-66-57" class="zm-item-link-avatar"
                                   href="/people/fan-jun-hao-66-57">
                                    <img src="https://pic4.zhimg.com/5f7b2fcb682401d194b455d8fea0c70b_m.jpg"
                                         class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$fan-jun-hao-66-57"
                                                                         href="https://www.nowcoder.com/people/fan-jun-hao-66-57"
                                                                         class="zg-link" title="范俊浩">范俊浩</a></h2>

                                    <div class="zg-big-gray">以代码为生，以文字为乐。牛客新人。</div>
                                    <div class="details zg-gray">
                                        <a target="_blank" href="/people/fan-jun-hao-66-57/followers"
                                           class="zg-link-gray-normal">39 关注者</a>
                                        /
                                        <a target="_blank" href="/people/fan-jun-hao-66-57/asks"
                                           class="zg-link-gray-normal">4 提问</a>
                                        /
                                        <a target="_blank" href="/people/fan-jun-hao-66-57/answers"
                                           class="zg-link-gray-normal">16 回答</a>
                                        /
                                        <a target="_blank" href="/people/fan-jun-hao-66-57" class="zg-link-gray-normal">220
                                            赞同</a>
                                    </div>

                                </div>
                            </div>

                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <div class="zg-right">
                                    <button data-follow="m:button" data-id="6e5d9c6ddc61e60c34894700a4989a14"
                                            class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0">关注她
                                    </button>
                                </div>
                                <a title="Lydia" data-tip="p$t$lydia-62" class="zm-item-link-avatar"
                                   href="/people/lydia-62">
                                    <img src="https://pic3.zhimg.com/1e5facdc2acfe721fb12b950202fc51a_m.jpg"
                                         class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$lydia-62"
                                                                         href="https://www.nowcoder.com/people/lydia-62"
                                                                         class="zg-link" title="Lydia">Lydia</a></h2>

                                    <div class="zg-big-gray">微信公众号Lydia66890,一些生活札记</div>
                                    <div class="details zg-gray">
                                        <a target="_blank" href="/people/lydia-62/followers"
                                           class="zg-link-gray-normal">112090
                                            关注者</a>
                                        /
                                        <a target="_blank" href="/people/lydia-62/asks" class="zg-link-gray-normal">22
                                            提问</a>
                                        /
                                        <a target="_blank" href="/people/lydia-62/answers" class="zg-link-gray-normal">106
                                            回答</a>
                                        /
                                        <a target="_blank" href="/people/lydia-62" class="zg-link-gray-normal">76647
                                            赞同</a>
                                    </div>

                                </div>
                            </div>

                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <div class="zg-right">
                                    <button data-follow="m:button" data-id="3bd24270336177f54057f7c4c9caac83"
                                            class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0">关注她
                                    </button>
                                </div>
                                <a title="黄胤然" data-tip="p$t$huang-yin-ran" class="zm-item-link-avatar"
                                   href="/people/huang-yin-ran">
                                    <img src="https://pic1.zhimg.com/d6017570acfe0bbe96d64cd919e71c10_m.jpg"
                                         class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$huang-yin-ran"
                                                                         href="https://www.nowcoder.com/people/huang-yin-ran"
                                                                         class="zg-link" title="黄胤然">黄胤然</a></h2>

                                    <div class="zg-big-gray">想做一流的电影操盘手</div>
                                    <div class="details zg-gray">
                                        <a target="_blank" href="/people/huang-yin-ran/followers"
                                           class="zg-link-gray-normal">4577 关注者</a>
                                        /
                                        <a target="_blank" href="/people/huang-yin-ran/asks"
                                           class="zg-link-gray-normal">2
                                            提问</a>
                                        /
                                        <a target="_blank" href="/people/huang-yin-ran/answers"
                                           class="zg-link-gray-normal">76
                                            回答</a>
                                        /
                                        <a target="_blank" href="/people/huang-yin-ran" class="zg-link-gray-normal">12231
                                            赞同</a>
                                    </div>

                                </div>
                            </div>

                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <div class="zg-right">
                                    <button data-follow="m:button" data-id="91921123d6647038251339356ac4f7ff"
                                            class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0">关注她
                                    </button>
                                </div>
                                <a title="Mila Lin" data-tip="p$t$mila-lin" class="zm-item-link-avatar"
                                   href="/people/mila-lin">
                                    <img src="https://pic4.zhimg.com/a96f23e2f_m.jpg" class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$mila-lin"
                                                                         href="https://www.nowcoder.com/people/mila-lin"
                                                                         class="zg-link" title="Mila Lin">Mila Lin</a>
                                    </h2>

                                    <div class="zg-big-gray"></div>
                                    <div class="details zg-gray">
                                        <a target="_blank" href="/people/mila-lin/followers"
                                           class="zg-link-gray-normal">3
                                            关注者</a>
                                        /
                                        <a target="_blank" href="/people/mila-lin/asks" class="zg-link-gray-normal">4
                                            提问</a>
                                        /
                                        <a target="_blank" href="/people/mila-lin/answers" class="zg-link-gray-normal">0
                                            回答</a>
                                        /
                                        <a target="_blank" href="/people/mila-lin" class="zg-link-gray-normal">0 赞同</a>
                                    </div>

                                </div>
                            </div>

                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <div class="zg-right">
                                    <button data-follow="m:button" data-id="f174b224063c5bc5855e4959871b3adf"
                                            class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0">关注他
                                    </button>
                                </div>
                                <a title="左程云" data-tip="p$t$amphibianman" class="zm-item-link-avatar"
                                   href="/people/amphibianman">
                                    <img src="https://pic1.zhimg.com/4ad8aed4df51705bc72d41e2e876a174_m.jpg"
                                         class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$amphibianman"
                                                                         href="https://www.nowcoder.com/people/amphibianman"
                                                                         class="zg-link" title="左程云">左程云</a></h2>

                                    <div class="zg-big-gray">死亡是一个未经证实的谣言</div>
                                    <div class="details zg-gray">
                                        <a target="_blank" href="/people/amphibianman/followers"
                                           class="zg-link-gray-normal">625 关注者</a>
                                        /
                                        <a target="_blank" href="/people/amphibianman/asks" class="zg-link-gray-normal">2
                                            提问</a>
                                        /
                                        <a target="_blank" href="/people/amphibianman/answers"
                                           class="zg-link-gray-normal">8
                                            回答</a>
                                        /
                                        <a target="_blank" href="/people/amphibianman" class="zg-link-gray-normal">268
                                            赞同</a>
                                    </div>

                                </div>
                            </div>

                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <div class="zg-right">
                                    <button data-follow="m:button" data-id="589d96873dbbed5963093c756918acae"
                                            class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0">关注
                                    </button>
                                </div>
                                <a title="葫芦娃之水娃" data-tip="p$t$huluwazhishuiwa" class="zm-item-link-avatar"
                                   href="/people/huluwazhishuiwa">
                                    <img src="https://pic1.zhimg.com/0a3870f127a997b2b82f5b5892d68be8_m.jpg"
                                         class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$huluwazhishuiwa"
                                                                         href="https://www.nowcoder.com/people/huluwazhishuiwa"
                                                                         class="zg-link" title="葫芦娃之水娃">葫芦娃之水娃</a></h2>

                                    <div class="zg-big-gray"></div>
                                    <div class="details zg-gray">
                                        <a target="_blank" href="/people/huluwazhishuiwa/followers"
                                           class="zg-link-gray-normal">4 关注者</a>
                                        /
                                        <a target="_blank" href="/people/huluwazhishuiwa/asks"
                                           class="zg-link-gray-normal">2
                                            提问</a>
                                        /
                                        <a target="_blank" href="/people/huluwazhishuiwa/answers"
                                           class="zg-link-gray-normal">0 回答</a>
                                        /
                                        <a target="_blank" href="/people/huluwazhishuiwa" class="zg-link-gray-normal">0
                                            赞同</a>
                                    </div>

                                </div>
                            </div>

                        </div>
                        <a aria-role="button" class="zg-btn-white zu-button-more">更多</a>
                        <a href="javascript:;" id="zh-load-more" data-method="next"
                           class="zg-btn-white zg-r3px zu-button-more" style="display:none">更多</a>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
    <div id="main">
        <div class="zg-wrap zu-main clearfix ">
            <div class="zm-profile-section-wrap zm-profile-followee-page">
                <div class="zm-profile-section-head">
                    <span class="zm-profile-section-name">
                        <a href="#">${curUser.username}</a> 粉丝 ${followerCount} 人
                    </span>
                </div>
                <div class="zm-profile-section-list">
                    <div id="zh-profile-follows-list">
                        <div class="zh-general-list clearfix">
                            <c:forEach var="vo" items="${followers}">
                                <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                    <c:choose>
                                        <c:when test="${vo.get('followed')}">
                                            <div class="zg-right">
                                                <button class="zg-btn zg-btn-unfollow zm-rich-follow-btn small nth-0
                                    js-follow-user" onclick="unfollowBtn(${vo.get('user').id})">取消关注
                                                </button>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="zg-right">
                                                <button class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0
                                    js-follow-user" onclick="followBtn(${vo.get('user').id})">关注
                                                </button>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>

                                    <a title="Barty" class="zm-item-link-avatar" href="/user/${vo.get('user').id}">
                                        <img src="${vo.get('user').headUrl}" class="zm-item-img-avatar">
                                    </a>
                                    <div class="zm-list-content-medium">
                                        <h2 class="zm-list-content-title"><a data-tip="p$t$buaabarty"
                                                                             href="/user/${vo.get('user').id}"
                                                                             class="zg-link"
                                                                             title="Barty">${vo.get('user').username}</a>
                                        </h2>

                                        <!-- <div class="zg-big-gray">计蒜客教研首席打杂</div> -->
                                        <div class="details zg-gray">
                                            <a target="_blank" href="/user/${vo.get('user').id}/followers"
                                               class="zg-link-gray-normal">${vo.get('followeeCount')}粉丝</a>
                                            /
                                            <a target="_blank" href="/user/${vo.get('user').id}/followees"
                                               class="zg-link-gray-normal">${vo.get('followeeCount')}关注</a>
                                            /
                                            <a target="_blank" href="#"
                                               class="zg-link-gray-normal">${vo.get('commentCount')}
                                                回答</a>
                                            <%--/
                                            <a target="_blank" href="#" class="zg-link-gray-normal">548 赞同</a>--%>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                        <a aria-role="button" class="zg-btn-white zu-button-more">更多</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>


<!-- script -->
<script type='text/javascript' src='/js/jquery-1.8.3.min.js'></script>
<script type='text/javascript' src='/js/jquery.easing.1.3.js'></script>
<script type='text/javascript' src='/js/prettyphoto/jquery.prettyPhoto.js'></script>
<script type='text/javascript' src='/js/jflickrfeed.js'></script>
<script type='text/javascript' src='/js/jquery.liveSearch.js'></script>
<script type='text/javascript' src='/js/jquery.form.js'></script>
<script type='text/javascript' src='/js/jquery.validate.min.js'></script>
<script type='text/javascript' src='/js/custom.js'></script>

<script type="text/javascript" src="/framework/jquery.min.js"></script>
<script type="text/javascript" src="/layui/layui.js"></script>

<script>
    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });

    function followBtn(userId) {
        $.post("/followUser", {"userId": userId}, function (data) {
            if (data.code == 200) {
                window.location.reload();
            } else if (data.code == 999) {
                $(location).attr('href', 'http://localhost:8081/toLogin?callback=' + data.result);
            } else {
                alert(data.msg);
            }
        });
    }

    function unfollowBtn(userId) {
        $.post("/unfollowUser", {"userId": userId}, function (data) {
            if (data.code == 200) {
                window.location.reload();
            } else if (data.code == 999) {
                $(location).attr('href', 'http://localhost:8081/toLogin?callback=' + data.result);
            } else {
                alert(data.msg);
            }
        });
    }
</script>
</body>
</html>