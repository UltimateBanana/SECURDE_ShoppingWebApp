
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("usernameSignIn");
        String password = request.getParameter("passwordSignIn");
        
        //pseudo code
        //if(validatation.check(username, password)){
        //      RequestDispatcher rs = request.getRequestDispatcher(to whatever page you wanna redirect);
        //      rs.forward(request, response);
        //}
        //else{ //Sysout(password or username incorrect)
        //      RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
        //      rs.include(request, response);
        //}
        //System.out.println("Username: " +username);
        //System.out.println("Password: " +password);
        
        
        //processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}