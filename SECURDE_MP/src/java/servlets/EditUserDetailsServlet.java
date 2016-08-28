/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controller.Controller;
import enumeration.AccessLevel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Address;
import request.AccountRequest;

/**
 *
 * @author Phil
 */
public class EditUserDetailsServlet extends HttpServlet {

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
            out.println("<title>Servlet EditUserDetailsServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditUserDetailsServlet at " + request.getContextPath() + "</h1>");
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
        
        Account user = (Account) request.getSession(false).getAttribute("user");
        System.out.println("username: "+user.getUsername());
        Controller controller = new Controller();

        String firstName = request.getParameter("fnameEditUD");
        String middleName = request.getParameter("minitialEditUD");
        String lastName = request.getParameter("lnameEditUD");
        String username = request.getParameter("usernameEditUD");
        String email = request.getParameter("emailEditUD");
        
        String houseNumBA = request.getParameter("housenumBAEditUD");
        String streetBA = request.getParameter("streetBAEditUD");
        String subdivisionBA = request.getParameter("subdivisionBAEditUD");
        String cityBA = request.getParameter("cityBAEditUD");
        String postalCodeBA = request.getParameter("postalcodeBAEditUD");
        String countryBA = request.getParameter("countryBAEditUD");
        
        String houseNumSA = request.getParameter("housenumSAEditUD");
        String streetSA = request.getParameter("streetSAEditUD");
        String subdivisionSA = request.getParameter("subdivisionSAEditUD");
        String citySA = request.getParameter("citySAEditUD");
        String postalCodeSA = request.getParameter("postalcodeSAEditUD");
        String countrySA = request.getParameter("countrySAEditUD");
        
        Account account = new Account();
        Address addressBA = new Address();
        Address addressSA = new Address();
        
        account.setFirstName(firstName);
        account.setMiddleName(middleName);
        account.setLastName(lastName);
        account.setUsername(user.getUsername());
        account.setPassword(user.getPassword());
        account.setEmail(email);
        
        addressBA.setHouseNumber(houseNumBA);
        addressBA.setStreet(streetBA);
        addressBA.setSubdivision(subdivisionBA);
        addressBA.setCity(cityBA);
        addressBA.setPostalCode(postalCodeBA);
        addressBA.setCountry(countryBA);
        
        addressSA.setHouseNumber(houseNumSA);
        addressSA.setStreet(streetSA);
        addressSA.setSubdivision(subdivisionSA);
        addressSA.setCity(citySA);
        addressSA.setPostalCode(postalCodeSA);
        addressSA.setCountry(countrySA);
        
        
        //temporary fix
        //account.setAccessLevel(AccessLevel.USER);
        account.setAccessLevel(user.getAccessLevel());
        account.setBillingAddress(addressBA);
        account.setShippingAddress(addressSA);
        account.setAccountId(user.getAccountId());
        
        controller.updateAccount(account);
        RequestDispatcher rs = request.getRequestDispatcher("UserDetailsPage.jsp");
        rs.forward(request, response);
        //rs.forward(request, response);
        
        //processRequest(request, response);
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
