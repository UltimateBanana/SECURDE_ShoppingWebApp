
package servlets;

import controller.Controller;
import hashing.Encryptor;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;

public class ChangePasswordServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePasswordServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordServlet at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        Controller controller = new Controller();
        Account user = (Account) request.getSession(false).getAttribute("user");
        String password = request.getParameter("currpasswordChangePass");
        System.out.println("Password: "+password);
        String newPassword = request.getParameter("newpasswordChangePass");
        String confirmNewPassword = request.getParameter("confnewpasswordChangePass");
        
        String key = "Bar12345Bar12345";
        String vector = "RandomInitVector";
        String encryptedOldPassword = Encryptor.encrypt(key, vector, password);
        if(password.isEmpty() || newPassword.isEmpty() || confirmNewPassword.isEmpty()){
            RequestDispatcher rs = request.getRequestDispatcher("UserDetailsPage.jsp");
            out.println("<font color=red>Please fill all the fields. </font>");
            rs.include(request, response);
        }
        else{
          if(encryptedOldPassword.equals(user.getPassword())){
              if(!newPassword.equals(confirmNewPassword)){
                  RequestDispatcher rs = request.getRequestDispatcher("UserDetailsPage.jsp");
                  out.println("<font color=red>Passwords mismatch. </font>");
                  rs.include(request, response);
              }
              else{
                  
        
                  String encryptedPassword = Encryptor.encrypt(key, vector, newPassword);
                  controller.changePassword(Integer.parseInt(user.getAccountId()), encryptedPassword);
                  RequestDispatcher rs = request.getRequestDispatcher("UserDetailsPage.jsp");
                  rs.forward(request, response);
              }
          }
          else{
              RequestDispatcher rs = request.getRequestDispatcher("UserDetailsPage.jsp");
              out.println("<font color=red>Incorrect password. </font>");
              rs.include(request, response);
          }
        }
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
