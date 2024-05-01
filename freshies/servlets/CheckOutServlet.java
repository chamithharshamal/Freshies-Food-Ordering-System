package freshies.servlets;

import freshies.connection.DbConnection;
import freshies.model.Cart;
import freshies.model.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CheckOutServlet", urlPatterns = {"/CheckOutServlet"})
public class CheckOutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            User auth = (User) session.getAttribute("auth");
            if (auth == null) {
                response.sendRedirect("login.jsp");
                return; 
            }

            ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");
            if (cartList == null || cartList.isEmpty()) {
                response.sendRedirect("cart.jsp"); 
                return;
            }

            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String contactNumber = request.getParameter("contact_number");
            String paymentMethod = request.getParameter("payment_method");
            String totalPrice = request.getParameter("total_price");

            Connection con = DbConnection.getConnection();
            if (con == null) {
                throw new SQLException("Failed to establish database connection");
            }

            StringBuilder itemsBuilder = new StringBuilder();
            for (Cart cart : cartList) {
                
                String productName = getProductName(con, cart.getId());
                if (productName != null) {
                    if (itemsBuilder.length() > 0) {
                        itemsBuilder.append(", ");
                    }
                    itemsBuilder.append(productName);
                }
            }

            String sql = "INSERT INTO orders (name, address, contact_number, total_price, payment_method, items) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, name);
            pst.setString(2, address);
            pst.setString(3, contactNumber);
            pst.setString(4, totalPrice);
            pst.setString(5, paymentMethod);
            pst.setString(6, itemsBuilder.toString());
            pst.executeUpdate();

           
            deleteAllProducts(con);

            session.removeAttribute("cart-list");
            response.sendRedirect("orders.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
         
            response.sendRedirect("error.jsp");
        }
    }

    private String getProductName(Connection con, int productId) throws SQLException {
        String productName = null;
        String sql = "SELECT name FROM products WHERE id = ?";
        try (PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setInt(1, productId);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    productName = rs.getString("name");
                }
            }
        }
        return productName;
    }

    private void deleteAllProducts(Connection con) throws SQLException {
        String sql = "DELETE FROM products";
        try (PreparedStatement pst = con.prepareStatement(sql)) {
            pst.executeUpdate();
        }
    }

}
