/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.80
 * Generated at: 2023-11-24 11:13:14 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class register_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1685681139796L));
    _jspx_dependants.put("jar:file:/D:/_spring_workspace/_final_project/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/finalProject/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>member register</title>\n");
      out.write("<style type=\"text/css\">\n");
      out.write("	.bodyContainer{\n");
      out.write("		display: flex;\n");
      out.write("		justify-content: center;\n");
      out.write("	}\n");
      out.write("\n");
      out.write("	form{\n");
      out.write("		width: 600px;\n");
      out.write("	}\n");
      out.write("	.registerBtn{\n");
      out.write("		width: 600px;\n");
      out.write("	}\n");
      out.write("	.pwEye{\n");
      out.write("		 cursor: pointer;\n");
      out.write("	}\n");
      out.write("	.msg{\n");
      out.write("		color: red;\n");
      out.write("	}\n");
      out.write("</style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../common/header.jsp", out, false);
      out.write("\n");
      out.write("<div class=\"bodyContainer\">\n");
      out.write("\n");
      out.write("<form action=\"/member/register\" method=\"post\">\n");
      out.write("	<div class=\"mb-3\">\n");
      out.write("	  <label for=\"email\" class=\"form-label\">이메일 주소</label>\n");
      out.write("	  <input type=\"email\" class=\"form-control input-danger\" name=\"memEmail\" id=\"email\" placeholder=\"예) avocart@avocart.co.kr\">\n");
      out.write("	  <p class=\"msg\" style=\"display:none\" id=\"emailMsg\">이메일 주소를 정확히 입력해주세요.</p>\n");
      out.write("	  <p class=\"msg\" style=\"display:none\" id=\"emailMsg2\">이미 존재하는 이메일입니다.</p>\n");
      out.write("	</div>\n");
      out.write("	<div class=\"mb-3\">\n");
      out.write("	  <label for=\"pw\" class=\"form-label\">비밀번호</label>\n");
      out.write("	  <input type=\"password\" class=\"form-control\" name=\"memPw\" id=\"pw\" placeholder=\"영문,숫자,특수문자 조합 8-16자\">\n");
      out.write("	  <i class=\"bi bi-eye-slash pwEye\" id=\"showPwBtn\"></i>\n");
      out.write("	  <p class=\"msg\" style=\"display:none\" id=\"pwMsg\">영문, 숫자, 특수문자를 조합하여 입력해주세요.</p>\n");
      out.write("	  <p class=\"msg\" style=\"display:none\" id=\"pwMsg2\">8-16자 사이로 입력해주세요.</p>\n");
      out.write("	</div>\n");
      out.write("	<div class=\"mb-3\">\n");
      out.write("	  <label for=\"nick\" class=\"form-label\">닉네임</label>\n");
      out.write("	  <input type=\"text\" class=\"form-control\" name=\"memNickName\" id=\"nick\" placeholder=\"닉네임을 입력하세요\">\n");
      out.write("	  <p class=\"msg\" style=\"display:none\" id=\"nickMsg\">이미 존재하는 닉네임입니다.</p>\n");
      out.write("	</div>\n");
      out.write("	<div class=\"mb-3\">\n");
      out.write("	  <label for=\"ph\" class=\"form-label\">전화번호</label>\n");
      out.write("	  <input type=\"text\" class=\"form-control\" name=\"memPhone\" id=\"ph\" placeholder=\"-를 제외한 전화번호를 입력하세요\">\n");
      out.write("	</div>\n");
      out.write("	<div class=\"mb-3\">	\n");
      out.write("	  <label for=\"addr\" class=\"form-label\">주소</label>\n");
      out.write("	  <input type=\"text\" class=\"form-control\" id=\"addr\" placeholder=\"주소를 검색하세요\">\n");
      out.write("	</div>\n");
      out.write("	<!-- 주소 전송용 인풋 -->\n");
      out.write("	<input type=\"hidden\" class=\"form-control\" name=\"memSido\" id=\"sido\">\n");
      out.write("	<input type=\"hidden\" class=\"form-control\" name=\"memSigg\" id=\"sigg\">\n");
      out.write("	<input type=\"hidden\" class=\"form-control\" name=\"memEmd\" id=\"emd\">\n");
      out.write("	\n");
      out.write("	<div class=\"agree\">\n");
      out.write("	    <input type=\"checkbox\" name=\"agree\" id=\"all\" onclick=\"selectAll(this)\">\n");
      out.write("	    <label for=\"all\">전체 약관에 동의합니다.</label><br>\n");
      out.write("	    <input type=\"checkbox\" name=\"agree\" id=\"age\">\n");
      out.write("	    <label for=\"age\">만 14세 이상입니다.</label><br>\n");
      out.write("	    <input type=\"checkbox\" name=\"agree\" id=\"service\">\n");
      out.write("	    <label for=\"service\">서비스 이용약관에 동의합니다.</label><br>\n");
      out.write("	    <input type=\"checkbox\" name=\"agree\" id=\"personal\">\n");
      out.write("	    <label for=\"personal\">개인정보 수집 및 이용에 동의합니다.</label><br>\n");
      out.write("	    <input type=\"checkbox\" name=\"agree\" id=\"event\">\n");
      out.write("	    <label for=\"event\">이벤트 정보 수신에 동의합니다.(선택)</label><br>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("	\n");
      out.write("	<button type=\"submit\" class=\"btn btn-secondary registerBtn\">가입하기</button>\n");
      out.write("</form>\n");
      out.write("\n");
      out.write("</div>\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../common/footer.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("<script src=\"//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"/resources/js/memberRegister.js\"></script>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
