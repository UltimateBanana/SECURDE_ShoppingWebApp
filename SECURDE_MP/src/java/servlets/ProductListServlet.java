
package servlets;

import controller.Controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import request.ProductRequest;

public class ProductListServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductListServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductListServlet at " + request.getContextPath() + "</h1>");
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
        
//        processRequest(request, response);
        // Link:http://theopentutorials.com/examples/java-ee/jsp/pagination-in-servlet-and-jsp/
        
        Controller controller = new Controller();
        ProductRequest productRequest = new ProductRequest();
        ArrayList<Product> productList = new ArrayList<Product>();
        ArrayList<Product> productListForPage = new ArrayList<Product>();

        productRequest.setIsDeleted(false);
        productList = controller.searchProducts(productRequest);
        
        
        int page = 1;
        int recordsPerPage = 10;
        int limit = 0;
        if(request.getParameter("page") != null)
            page = Integer.parseInt(request.getParameter("page"));
        
//        EmployeeDAO dao = new EmployeeDAO();
//        List<Employee> list = dao.viewAllEmployees((page-1)*recordsPerPage, recordsPerPage);
        System.out.println(productList.size()/page*recordsPerPage);
        if(productList.size()/(page*recordsPerPage) != 0)
            limit = page*recordsPerPage;
        else
            limit = (productList.size()%recordsPerPage);
        
        for(int i = (page-1)*recordsPerPage; i < limit; i++)
        {
            productListForPage.add(productList.get(i));
        }
        
        int noOfPages = (int) Math.ceil(productList.size() * 1.0 / recordsPerPage);
        request.setAttribute("products", productListForPage);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        
//        request.setAttribute("products", productList);
        
        request.getRequestDispatcher("/ProductListPage.jsp").forward(request, response);
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
