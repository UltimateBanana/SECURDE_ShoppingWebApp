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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Product;
import request.AccountRequest;
import request.ProductRequest;

/**
 *
 * @author hannah
 */
public class GeneralIndexServlet extends HttpServlet {

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
            out.println("<title>Servlet GeneralIndexServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GeneralIndexServlet at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        if(request.getParameter("adminBtn") != null)
        {
            Controller controller = new Controller();
            AccountRequest accountRequest = new AccountRequest();
            ArrayList<Account> lockedUserList = new ArrayList<Account>();

            accountRequest.setIsLocked(true);
            lockedUserList = controller.queryAllAccounts(accountRequest);
            request.setAttribute("accounts", lockedUserList);

            request.getRequestDispatcher("/AdminPage.jsp").forward(request, response);
//            response.sendRedirect("AdminPage.jsp");
        }
        else if(request.getParameter("productmanagerBtn") != null)
        {
            
            
            request.getRequestDispatcher("/ProductManagerPage.jsp").forward(request, response);
//            response.sendRedirect("ProductManagerPage.jsp");
        }
        else if(request.getParameter("accountingmanagerBtn") != null)
        {
            
            
            request.getRequestDispatcher("/AccountingManagerPage.jsp").forward(request, response);
//            response.sendRedirect("AccountingManagerPage.jsp");
        }
        else if(request.getParameter("userdetailsBtn") != null)
        {
            
            
            request.getRequestDispatcher("/UserDetailsPage.jsp").forward(request, response);
//            response.sendRedirect("UserDetailsPage.jsp");
        }
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
//        processRequest(request, response);
        
        if(request.getParameter("adminBtn") != null)
        {
            Controller controller = new Controller();
            AccountRequest accountRequest = new AccountRequest();
            ArrayList<Account> lockedUserList = new ArrayList<Account>();

            accountRequest.setIsLocked(true);
            lockedUserList = controller.queryAllAccounts(accountRequest);
            request.setAttribute("accounts", lockedUserList);

            request.getRequestDispatcher("/AdminPage.jsp").forward(request, response);
//            response.sendRedirect("AdminPage.jsp");
        }
        else if(request.getParameter("productmanagerBtn") != null)
        {
            Controller controller = new Controller();
            ProductRequest productRequest = new ProductRequest();
            ArrayList<Product> productList = new ArrayList<Product>();
            
            productRequest.setIsDeleted(false);
            productList = controller.searchProducts(productRequest);
            request.setAttribute("products", productList);
            
            request.getRequestDispatcher("/ProductManagerPage.jsp").forward(request, response);
//            response.sendRedirect("ProductManagerPage.jsp");
        }
        else if(request.getParameter("accountingmanagerBtn") != null)
        {
//            Controller controller = new Controller();
//            ProductRequest productRequest = new ProductRequest();
//            ArrayList<Product> productList = new ArrayList<Product>();
//            
//            productRequest.setIsDeleted(false);
//            productList = controller.searchProducts(productRequest);
//            request.setAttribute("products", productList);
            
            // What is needed here??
            
            request.getRequestDispatcher("/AccountingManagerPage.jsp").forward(request, response);
//            response.sendRedirect("AccountingManagerPage.jsp");
        }
        else if(request.getParameter("userdetailsBtn") != null)
        {
            
            
            request.getRequestDispatcher("/UserDetailsPage.jsp").forward(request, response);
//            response.sendRedirect("UserDetailsPage.jsp");
        }
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
