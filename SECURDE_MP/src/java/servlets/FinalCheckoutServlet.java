/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controller.Controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.CreditCard;
import model.Receipt;
import model.ReceiptItem;

/**
 *
 * @author Paolo
 */
public class FinalCheckoutServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FinalCheckoutServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FinalCheckoutServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        System.out.println("APPLE BOTTOM JEANS WITH BOOTS AND FUR");
        
        String number = request.getParameter("cardNumber");
        String code = request.getParameter("cardCode");
        String expMonth = request.getParameter("expirationMonth");
        String expYear = request.getParameter("expirationYear");
        CreditCard card = new CreditCard();
        card.setCreditCardNumber(number);
        card.setSecurityPin(code);
        ArrayList<ReceiptItem> cart = (ArrayList<ReceiptItem>) request.getSession(false).getAttribute("cart");
        int total = 0;
        for(ReceiptItem r : cart){
            total+=r.getSubtotal();
        }
        //validate(card, expMonth, expYear);
        //check if creditlimit > total price
        Account account = (Account) request.getSession(false).getAttribute("user");
        System.out.println(account.getUsername());
        
        Receipt receipt = new Receipt();
        receipt.setCreditCardNumber(number);
        receipt.setReceiptItems(cart);
        receipt.setPrice(total);
        Controller controller = new Controller();
        controller.addReceipt(Integer.parseInt(account.getAccountId()), receipt);
        
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
