/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-05-11 10:07:35 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class message_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"zh-CN\"\r\n");
      out.write("      class=\"is-AppPromotionBarVisible cssanimations csstransforms csstransitions flexbox no-touchevents no-mobile\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("    <title>读《Web 全栈工程师的自我修养》 - web开发的愚人之旅 - 牛客网</title>\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/css/bootstrap.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"../styles/font-awesome.min.css\">\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" media=\"all\" href=\"/layui/css/layui.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" media=\"all\" href=\"/css/letter.css\">\r\n");
      out.write("\r\n");
      out.write("    <script src=\"../scripts/hm.js\"></script>\r\n");
      out.write("    <script src=\"../scripts/detail.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    <script type=\"text/javascript\" src=\"../scripts/bootstrap.min.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"../scripts/jquery.qrcode.min.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"posts_show\">\r\n");
      out.write("<div class=\"layui-layout layui-layout-admin\">\r\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <div id=\"main\">\r\n");
      out.write("        <div class=\"zg-wrap zu-main clearfix \">\r\n");
      out.write("            <button class=\"layui-btn layui-layout-right\" id=\"addMessage\">发私信</button>\r\n");
      out.write("            <ul class=\"letter-list\" style=\"margin-top: 20px\">\r\n");
      out.write("                <li id=\"conversation-item-10005_622873\">\r\n");
      out.write("                    <a class=\"letter-link\"\r\n");
      out.write("                       href=\"msg-list?conversationId=10005_622873&amp;updateRead=1&amp;msgType=1\"></a>\r\n");
      out.write("                    <div class=\"letter-info\">\r\n");
      out.write("                        <span class=\"l-time\">今天 15:28</span>\r\n");
      out.write("                        <div class=\"l-operate-bar\">\r\n");
      out.write("                            <a href=\"javascript:void(0);\" class=\"sns-action-del\" data-id=\"10005_622873\">\r\n");
      out.write("                                删除\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <a href=\"msg-list?conversationId=10005_622873&amp;updateRead=1&amp;msgType=1\">\r\n");
      out.write("                                共268条会话\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"chat-headbox\">\r\n");
      out.write("                        <span class=\"msg-num\">\r\n");
      out.write("                            99+\r\n");
      out.write("                        </span>\r\n");
      out.write("                        <a class=\"list-head\">\r\n");
      out.write("                            <img alt=\"头像\" src=\"http://static.nowcoder.com/images/head/notify.png\">\r\n");
      out.write("                        </a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"letter-detail\">\r\n");
      out.write("                        <a title=\"通知\" class=\"letter-name level-color-1\">\r\n");
      out.write("                            通知\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <p class=\"letter-brief\">\r\n");
      out.write("                            <a href=\"msg-list?conversationId=10005_622873&amp;updateRead=1&amp;msgType=1\">\r\n");
      out.write("                                你收藏的问题\"二维数组中的查找\" 有了新的回答，去看看对自己是否有用吧。（不想再收到此类提醒？点击设置 ）\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/framework/jquery.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/layui/layui.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("    $(document).ready(function () {\r\n");
      out.write("        $(\"#addMessage\").click(function () {\r\n");
      out.write("            layui.use(['layer'], function () {\r\n");
      out.write("                var layer = layui.layer;\r\n");
      out.write("                layerIndex = layer.open({\r\n");
      out.write("                    title: \"发私信\",\r\n");
      out.write("                    type: 2,\r\n");
      out.write("                    content: \"/user/toAddMessage\",\r\n");
      out.write("                    maxmin: false,\r\n");
      out.write("                    resize: false,\r\n");
      out.write("                    offset: '5%',\r\n");
      out.write("                    area: [\"700px\", \"400px\"]\r\n");
      out.write("                });\r\n");
      out.write("            });\r\n");
      out.write("        });\r\n");
      out.write("    });\r\n");
      out.write("</script>\r\n");
      out.write("<script>\r\n");
      out.write("    layui.use('element', function () {\r\n");
      out.write("        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块\r\n");
      out.write("\r\n");
      out.write("        //监听导航点击\r\n");
      out.write("        element.on('nav(demo)', function (elem) {\r\n");
      out.write("            //console.log(elem)\r\n");
      out.write("            layer.msg(elem.text());\r\n");
      out.write("        });\r\n");
      out.write("    });\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
