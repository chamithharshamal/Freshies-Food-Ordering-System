package freshies.servlets;

import freshies.connection.DbConnection;
import freshies.dao.ProductsDao;
import freshies.model.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id")); 
        ProductsDao productsDao = null;
        try {
            productsDao = new ProductsDao(DbConnection.getConnection());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RemoveFromCartServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RemoveFromCartServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        productsDao.removeProduct(productId);

        response.sendRedirect("cart.jsp");
    }
}
