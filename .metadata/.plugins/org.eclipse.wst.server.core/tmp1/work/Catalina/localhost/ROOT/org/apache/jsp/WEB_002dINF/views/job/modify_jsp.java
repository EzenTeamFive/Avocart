/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.80
 * Generated at: 2023-11-27 09:14:06 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.job;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class modify_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

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

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>job modify page</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/resources/css/page.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../common/header.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"bodyContainer\">\r\n");
      out.write("		\r\n");
      out.write("	<form action=\"/job/modify\" method=\"post\" enctype=\"multipart/form-data\" >\r\n");
      out.write("	<input type=\"hidden\" class=\"form-control\" id=\"proEmail\" name=\"proEmail\" value=\"proEmail\">\r\n");
      out.write("	<input type=\"hidden\" class=\"form-control\" id=\"proNickName\" name=\"proNickName\" value=\"proNickName\">\r\n");
      out.write("	<input type=\"hidden\" class=\"form-control\" id=\"proBno\" name=\"proBno\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${jbdto.pbvo.proBno }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\">\r\n");
      out.write("	  <div class=\"mb-3\">\r\n");
      out.write("	    <label for=\"proTitle\" class=\"form-label\">제목</label>\r\n");
      out.write("	    <input type=\"text\" class=\"form-control\" name=\"proTitle\" id=\"proTitle\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${jbdto.pbvo.proTitle}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\">\r\n");
      out.write("	    \r\n");
      out.write("	  </div>\r\n");
      out.write("	  <div class=\"mb-3\">\r\n");
      out.write("	  <label for=\"jobDetail\" class=\"form-label\">구인 정보</label>\r\n");
      out.write("	  <!-- 지급기준 메뉴에 담기 -->\r\n");
      out.write("		    <select class=\"form-select form-select-sm\" aria-label=\"Small select example\" name=\"proMenu\">\r\n");
      out.write("			  <option selected value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${jbdto.pbvo.proMenu}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write('"');
      out.write('>');
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${jbdto.pbvo.proMenu}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</option>\r\n");
      out.write("			  <option value=\"시급\">시급</option>\r\n");
      out.write("			  <option value=\"일급\">일급</option>\r\n");
      out.write("			  <option value=\"월급\">월급</option>\r\n");
      out.write("			  <option value=\"건별\">건별</option>\r\n");
      out.write("			</select>\r\n");
      out.write("		\r\n");
      out.write("		<label for=\"jobProPrice\" class=\"form-label\">급여</label>\r\n");
      out.write("	    <input type=\"text\" class=\"form-control\" name=\"proPrice\" id=\"proPrice\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${jbdto.pbvo.proPrice}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\">\r\n");
      out.write("\r\n");
      out.write("		<label for=\"jobAddress\" class=\"form-label\">근무지역</label>\r\n");
      out.write("	    <input type=\"text\" class=\"form-control\" name=\"address\" id=\"address\">\r\n");
      out.write("		\r\n");
      out.write("		<label for=\"jobDay\" class=\"form-label\">근무요일</label>\r\n");
      out.write("		<div class=\"form-check\">\r\n");
      out.write("			<label><input type=\"checkbox\" name=\"days\" value=\"월\"> 월요일</label>\r\n");
      out.write("	        <label><input type=\"checkbox\" name=\"days\" value=\"화\"> 화요일</label>\r\n");
      out.write("	        <label><input type=\"checkbox\" name=\"days\" value=\"수\"> 수요일</label>\r\n");
      out.write("	        <label><input type=\"checkbox\" name=\"days\" value=\"목\"> 목요일</label>\r\n");
      out.write("	        <label><input type=\"checkbox\" name=\"days\" value=\"금\"> 금요일</label>\r\n");
      out.write("	        <label><input type=\"checkbox\" name=\"days\" value=\"토\"> 토요일</label>\r\n");
      out.write("	        <label><input type=\"checkbox\" name=\"days\" value=\"일\"> 일요일</label>\r\n");
      out.write("		</div>\r\n");
      out.write("		\r\n");
      out.write("		<label for=\"jobHour\">근무시간</label><br>\r\n");
      out.write("		<input type=\"number\" id=\"startHour\" min=\"0\" max=\"24\"> :\r\n");
      out.write("		<input type=\"number\" id=\"startMinute\" min=\"0\" max=\"59\">\r\n");
      out.write("		~\r\n");
      out.write("		<input type=\"number\" id=\"endHour\" min=\"0\" max=\"24\"> :\r\n");
      out.write("		<input type=\"number\" id=\"endMinute\" min=\"0\" max=\"59\">\r\n");
      out.write("	  </div>\r\n");
      out.write("\r\n");
      out.write("	  <div class=\"mb-3\">\r\n");
      out.write("	    <label for=\"proContent\" class=\"form-label\">상세 내용</label>\r\n");
      out.write("		<textarea class=\"form-control\" name=\"proContent\" id=\"proContent\" rows=\"10\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${jbdto.pbvo.proContent}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</textarea>\r\n");
      out.write("	  </div>\r\n");
      out.write("	  \r\n");
      out.write("	  <div class=\"mb-3\">\r\n");
      out.write("	    <input type=\"file\" class=\"form-control\" id=\"files\" name=\"files\" style=\"display: none;\" multiple=\"multiple\">\r\n");
      out.write("	    <!-- input type trigger 용도의 button -->\r\n");
      out.write("	    <button type=\"button\" id=\"trigger\" class=\"btn btn-outline-success\">사진 첨부</button>\r\n");
      out.write("	  </div>\r\n");
      out.write("	  \r\n");
      out.write("	  <div class=\"mb-3\" id=\"fileZone\">\r\n");
      out.write("	  <!-- 첨부파일 표시 될 영역 -->\r\n");
      out.write("	  </div>\r\n");
      out.write("  \r\n");
      out.write("	  <button type=\"submit\" class=\"btn btn-success\">수정</button>\r\n");
      out.write("	  <button type=\"reset\" class=\"btn btn-success\">취소</button>\r\n");
      out.write("	</form>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\" src=\"/resources/js/jobBoardRegister.js\"></script>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../common/footer.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
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