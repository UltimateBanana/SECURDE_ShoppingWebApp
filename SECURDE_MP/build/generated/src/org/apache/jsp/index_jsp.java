package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

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
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <!-- Bootstrap stuff -->\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js\"></script>\n");
      out.write("        <script src=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js\"></script>\n");
      out.write("        \n");
      out.write("        <!-- Link to CSS file -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"HomePage.css\">\n");
      out.write("        \n");
      out.write("        <title>Talaria Footwear Company</title>\n");
      out.write("        \n");
      out.write("        <!-- Script for functions -->\n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function(){\n");
      out.write("                \n");
      out.write("                $('#goHome').on('click', function(){\n");
      out.write("                    window.location.href = \"index.jsp\";\n");
      out.write("                });\n");
      out.write("                \n");
      out.write("                $('#signupBtn').on('click', function(){\n");
      out.write("                    window.location.href = \"SignUpPage.jsp\";\n");
      out.write("                });\n");
      out.write("                \n");
      out.write("                $('#loginBtn').on('click', function(){\n");
      out.write("                    window.location.href = \"LogInPage.jsp\";\n");
      out.write("                });\n");
      out.write("                \n");
      out.write("                $('#adminBtn').on('click', function(){\n");
      out.write("                    window.location.href = \"AdminPage.jsp\";\n");
      out.write("                });\n");
      out.write("                \n");
      out.write("                $('#productmanagerBtn').on('click', function(){\n");
      out.write("                    window.location.href = \"ProductManagerPage.jsp\";\n");
      out.write("                });\n");
      out.write("                \n");
      out.write("                $('#accountingmanagerBtn').on('click', function(){\n");
      out.write("                    window.location.href = \"AccountingManagerPage.jsp\";\n");
      out.write("                });\n");
      out.write("                \n");
      out.write("                $('#userdetailsBtn').on('click', function(){\n");
      out.write("                    window.location.href = \"UserDetailsPage.jsp\";\n");
      out.write("                });\n");
      out.write("                \n");
      out.write("                $('#productBtn').on('click', function(){\n");
      out.write("                    window.location.href = \"ProductDetailsPage.jsp\";\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            \n");
      out.write("            <!-- The HEADER and the buttons/links in it -->\n");
      out.write("            <nav class=\"navbar navbar-default navbar-fixed-top\" id=\"topheader\">\n");
      out.write("                <div class=\"container-fluid\">\n");
      out.write("                    <div class=\"navbar-header\">\n");
      out.write("                        \n");
      out.write("                        <!-- Brand (aka the app name) -->\n");
      out.write("                        <a class=\"navbar-brand\" href=\"#\" id=\"goHome\" name=\"goHome\"> \n");
      out.write("                            Talaria Footwear\n");
      out.write("                        </a>\n");
      out.write("                        \n");
      out.write("                        <!-- Search Bar -->\n");
      out.write("                        <form class=\"navbar-form navbar-left\" role=\"search\">\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                              <input type=\"text\" class=\"form-control\" id=\"searchInput\" name=\"searchInput\" placeholder=\"Search\">\n");
      out.write("                            </div>\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-default navbar-btn\" id=\"submitsearchBtn\" name=\"submitsearchBtn\">\n");
      out.write("                                <i class=\"glyphicon glyphicon-search\"></i>\n");
      out.write("                            </button>\n");
      out.write("                        </form>\n");
      out.write("\n");
      out.write("                        <!-- Sign In and Sign Up buttons -->\n");
      out.write("                        <div class=\"btn-group navbar-form navbar-right\" role=\"group\" aria-label=\"...\">\n");
      out.write("                            <button type=\"button\" class=\"btn btn-default navbar-btn\" id=\"productBtn\" name=\"productBtn\">Product Details Page</button>\n");
      out.write("                            <button type=\"button\" class=\"btn btn-default navbar-btn\" id=\"adminBtn\" name=\"adminBtn\">Admin Page</button>\n");
      out.write("                            <button type=\"button\" class=\"btn btn-default navbar-btn\" id=\"productmanagerBtn\" name=\"productmanagerBtn\">Product Manager Page</button>\n");
      out.write("                            <button type=\"button\" class=\"btn btn-default navbar-btn\" id=\"accountingmanagerBtn\" name=\"accountingmanagerBtn\">Accounting Manager Page</button>\n");
      out.write("                            <button type=\"button\" class=\"btn btn-default navbar-btn\" id=\"userdetailsBtn\" name=\"userdetailsBtn\">User Details Page</button>\n");
      out.write("                            <button type=\"button\" class=\"btn btn-default navbar-btn\" id=\"loginBtn\" name=\"loginBtn\">Sign In</button>\n");
      out.write("                            <button type=\"button\" class=\"btn btn-default navbar-btn\" id=\"signupBtn\" name=\"signupBtn\">Sign Up</button>\n");
      out.write("                        </div>\n");
      out.write("                        \n");
      out.write("                    </div>\n");
      out.write("                </div> <!-- /container-fluid -->\n");
      out.write("            </nav> <!-- /navbar top header -->\n");
      out.write("            \n");
      out.write("            <!-- CONTENT -->\n");
      out.write("            <div id=\"content\">\n");
      out.write("                <div class=\"container-fluid\">\n");
      out.write("                    \n");
      out.write("                    <!-- Text -->\n");
      out.write("                    <div id=\"contenttext\">\n");
      out.write("                        <h1>\n");
      out.write("                            How to put the products here? D:\n");
      out.write("                        </h1>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                    <!-- Image -->\n");
      out.write("                    <div id=\"contentimg\">\n");
      out.write("                        \n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("            </div><!-- /content -->\n");
      out.write("            \n");
      out.write("        </div> <!-- /container-fluid BODY -->\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
