
package servlets;

import controller.Controller;
import enumeration.Category;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

public class EditProductDetailsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditProductDetailsServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProductDetailsServlet at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        String productName = request.getParameter("nameEditProduct");
        String description = request.getParameter("descriptionEditProduct");
        String priceString = request.getParameter("priceEditProduct");
        
        String categoryString = request.getParameter("categoryEditProduct");
        System.out.println("Price: "+priceString);
        if(productName.isEmpty() || description.isEmpty() || priceString.isEmpty()){
            RequestDispatcher rs = request.getRequestDispatcher("ProductManagerPage.jsp");
            out.println("<font color=red>Please fill all the fields. </font>");
            rs.include(request, response);
        }
        else{
            double price = Double.parseDouble(priceString);
            Product product = new Product(productName, description, Category.translateCategoryStringToEnum(categoryString), price);
            String idString = request.getParameter("id");
            System.out.println("id String: "+idString);
            product.setProductId(idString);
            controller.updateProduct(product);
            RequestDispatcher rs = request.getRequestDispatcher("ProductManagerPage.jsp");
            rs.forward(request, response);
        }
       
        //processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
