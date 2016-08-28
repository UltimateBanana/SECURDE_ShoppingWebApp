
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
import model.Product;
import model.ReceiptItem;

public class AddToCartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddToCartServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCartServlet at " + request.getContextPath() + "</h1>");
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
        
        String id = request.getParameter("prodID");
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        
        ArrayList<ReceiptItem> cart = new ArrayList<ReceiptItem>();
        
        ReceiptItem item = new ReceiptItem();
        Product product = controller.queryProduct(Integer.parseInt(id));
        item.setProduct(product);
        item.setSubtotal(product.getPrice());
        //item.setSize(size);
        //item.setColr(color);
        try{
            cart = (ArrayList<ReceiptItem>)request.getSession(false).getAttribute("cart");
        }catch(Exception e){
            cart = new ArrayList<ReceiptItem>();
        }
        if(cart == null){
            cart = new ArrayList<ReceiptItem>();
        }
        cart.add(item);
        double subtotal = 0;
        ArrayList<Product> products = new ArrayList<Product>();
        for(ReceiptItem r : cart){
            subtotal+=r.getSubtotal();
            products.add(r.getProduct());
            
        }
        System.out.println("SUBTOTAL: " + subtotal);
        
        request.getSession(false).setAttribute("cart", cart);
        request.setAttribute("cart", products);
        request.setAttribute("subtotal", subtotal);
        request.getRequestDispatcher("/ShoppingCartPage.jsp").forward(request, response);
        //processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
