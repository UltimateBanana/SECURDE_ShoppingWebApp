
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignUpServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SignUpServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpServlet at " + request.getContextPath() + "</h1>");
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
        String firstName = request.getParameter("fnameSignUp");
        String middleInitial = request.getParameter("minitialSignUp");
        String lastName = request.getParameter("lnameSignUp");
        String username = request.getParameter("usernameSignUp");
        String password = request.getParameter("passwordSignUp");
        String email = request.getParameter("emailSignUp");
        
        String houseNumBA = request.getParameter("housenumBA");
        String streetBA = request.getParameter("streetBA");
        String subdivisionBA = request.getParameter("subdivisionBA");
        String cityBA = request.getParameter("cityBA");
        String postalCodeBA = request.getParameter("postalcodeBA");
        String countryBA = request.getParameter("countryBA");
                
        String houseNumSA = request.getParameter("housenumSA");
        String streetSA = request.getParameter("streetSA");
        String subdivisionSA = request.getParameter("subdivisionSA");
        String citySA = request.getParameter("citySA");
        String postalCodeSA = request.getParameter("postalcodeSA");
        String countrySA = request.getParameter("countrySA");
        
        if(firstName.isEmpty() || middleInitial.isEmpty() || lastName.isEmpty() || username.isEmpty()
                || password.isEmpty() || email.isEmpty() || houseNumBA.isEmpty() || streetBA.isEmpty()
                || subdivisionBA.isEmpty() || cityBA.isEmpty() || postalCodeBA.isEmpty() || countryBA.isEmpty()
                || houseNumSA.isEmpty() || streetSA.isEmpty() || subdivisionSA.isEmpty() || citySA.isEmpty()
                || postalCodeSA.isEmpty() || countrySA.isEmpty()){
            RequestDispatcher rd = request.getRequestDispatcher("SignUpPage.jsp");
            out.println("<font color=red>Please fill all the fields</font>");
            rd.include(request, response);
        }
        else{
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
