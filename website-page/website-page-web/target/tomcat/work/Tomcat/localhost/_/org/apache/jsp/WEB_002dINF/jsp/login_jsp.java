/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-05-13 09:27:46 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n");
      out.write("    <meta name=\"renderer\" content=\"webkit\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"/css/login.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"/layui/css/layui.css\">\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"zhi  no-auth\">\r\n");
      out.write("<div class=\"index-main\">\r\n");
      out.write("    <div class=\"index-main-body\">\r\n");
      out.write("        <div class=\"index-header\">\r\n");
      out.write("            <h1 class=\"logo hide-text\"><img src=\"\" alt=\"\"></h1>\r\n");
      out.write("            <h2 class=\"subtitle\">\r\n");
      out.write("                欢迎登录\r\n");
      out.write("            </h2>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"desk-front sign-flow clearfix sign-flow-simple\">\r\n");
      out.write("            <div class=\"view view-signin\" data-za-module=\"SignInForm\" style=\"display: block;\">\r\n");
      out.write("                <form action=\"\" id=\"loginform\" method=\"post\">\r\n");
      out.write("                    <div class=\"group-inputs\">\r\n");
      out.write("                        <div class=\"email input-wrapper\">\r\n");
      out.write("                            <input type=\"text\" id=\"username\" aria-label=\"用户名\" placeholder=\"用户名\" autocomplete=\"new-password\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"input-wrapper\">\r\n");
      out.write("                            <input type=\"password\" id=\"password\" aria-label=\"密码\" placeholder=\"密码\" autocomplete=\"new-password\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <input type=\"hidden\" name=\"callback\" id=\"callback\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${callback}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\"/>\r\n");
      out.write("                    <div class=\"button-wrapper command clearfix\">\r\n");
      out.write("                        <button class=\"sign-button submit\" type=\"button\" id=\"submitLogin\">登录</button>\r\n");
      out.write("                        <button class=\"sign-button submit\" type=\"reset\">重置</button>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"signin-misc-wrapper clearfix\">\r\n");
      out.write("                        <label class=\"remember-me\">新用户?\r\n");
      out.write("                            <a href=\"/toRegister\" class=\"zg-right\">前往注册</a>\r\n");
      out.write("                        </label>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/framework/jquery.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/layui/layui.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("    $(document).ready(function () {\r\n");
      out.write("        $(\"#submitLogin\").click(function () {\r\n");
      out.write("            layui.use(['layer'], function () {\r\n");
      out.write("                var layer = layui.layer;\r\n");
      out.write("                var username = $(\"#username\").val();\r\n");
      out.write("                var password = $(\"#password\").val();\r\n");
      out.write("                var callback = $(\"#callback\").val();\r\n");
      out.write("                if (username == ''){\r\n");
      out.write("                    layer.alert(\"用户名不能为空\");\r\n");
      out.write("                }else if(password == ''){\r\n");
      out.write("                    layer.alert(\"密码不能为空\");\r\n");
      out.write("                }else {\r\n");
      out.write("                    $.post(\"/login\",{\"username\":username,\"password\":password,\"callback\":callback},function (data) {\r\n");
      out.write("                        if (data.code == 200){\r\n");
      out.write("                            //window.location.href = \"http://localhost:8081\"+data.result;\r\n");
      out.write("                            if (data.result == ''){\r\n");
      out.write("                                $(location).attr('href', 'http://localhost:8081');\r\n");
      out.write("                            }else{\r\n");
      out.write("                                $(location).attr('href', 'http://localhost:8081/'+data.result);\r\n");
      out.write("                            }\r\n");
      out.write("\r\n");
      out.write("                        }else {\r\n");
      out.write("                            layer.msg(data.msg, {\r\n");
      out.write("                                offset: '50%',\r\n");
      out.write("                                icon: 2,\r\n");
      out.write("                                time: 2000\r\n");
      out.write("                            });\r\n");
      out.write("                        }\r\n");
      out.write("                    });\r\n");
      out.write("                }\r\n");
      out.write("            });\r\n");
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
