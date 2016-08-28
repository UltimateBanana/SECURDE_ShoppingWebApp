
package servlets;

import controller.Controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Feedback;

public class AddReviewServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddReviewSerlvet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddReviewSerlvet at " + request.getContextPath() + "</h1>");
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
        Account account = (Account) request.getSession(false).getAttribute("user");
        
        int productId = Integer.parseInt(request.getParameter("productId"));
        int accountId = Integer.parseInt(account.getAccountId());
        
        String review = request.getParameter("userReview");
        Feedback feedback = new Feedback();
        
        feedback.setFeedback(review);
        int receiptId = controller.queryProductReceiptItemId(accountId, productId);
        if(receiptId > 0){
            controller.addFeedback(receiptId, feedback);
        }
        request.getRequestDispatcher("/ProductListServlet").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
