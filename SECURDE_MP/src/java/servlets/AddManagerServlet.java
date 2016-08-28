
package servlets;

import controller.Controller;
import enumeration.AccessLevel;
import hashing.Encryptor;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Address;

public class AddManagerServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddManagerServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddManagerServlet at " + request.getContextPath() + "</h1>");
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
        
        Controller controller = new Controller();
        Account account = new Account();
        PrintWriter writer = response.getWriter();
        
        String firstName = request.getParameter("fnameManager");
        String middleInitial = request.getParameter("minitialManager");
        String lastName = request.getParameter("lnameManager");
        String username = request.getParameter("usernameManager");
        String password = request.getParameter("passwordManager");
        String email = request.getParameter("emailManager");
        String managerType = request.getParameter("typeManager");        
        
        if(firstName.isEmpty() || middleInitial.isEmpty() || lastName.isEmpty() || username.isEmpty() || password.isEmpty() || email.isEmpty()){
            RequestDispatcher rs = request.getRequestDispatcher("AdminPage.jsp");
            writer.println("<font color=red>Please fill all the fields</font>");
            rs.include(request, response);
        }
        else{
                if(managerType.equals("1"))
                    account.setAccessLevel(AccessLevel.PRODUCT_MANAGER);
                else if(managerType.equals("2"))
                    account.setAccessLevel(AccessLevel.ACCOUNTING_MANAGER);
                account.setFirstName(firstName);
                account.setMiddleName(middleInitial);
                account.setLastName(lastName);
                account.setUsername(username);
                
                String key = "Bar12345Bar12345";
                String vector = "RandomInitVector";
            
                String encryptedPassword = Encryptor.encrypt(key, vector, password);
                account.setPassword(encryptedPassword);
                account.setEmail(email);
                
                Address address = new Address();
                address.setHouseNumber("");
                address.setStreet("");
                address.setSubdivision("");
                address.setCity("");
                address.setCountry("");
                address.setPostalCode("0");
                account.setBillingAddress(address);
                account.setShippingAddress(address);
                controller.register(account);
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
        }
        //processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
