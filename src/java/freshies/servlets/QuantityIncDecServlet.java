package freshies.servlets;

import freshies.connection.DbConnection;
import freshies.model.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/quantity-inc-dec")
public class QuantityIncDecServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();
        ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");

        if (cartList != null && action != null) {
            try {
                Connection con = DbConnection.getConnection();
                String query = "SELECT quantity FROM products WHERE id=?";
                PreparedStatement pst = con.prepareStatement(query);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();

                int productQuantity = 0;
                if (rs.next()) {
                    productQuantity = rs.getInt("quantity");
                    if ("inc".equals(action)) {
                        productQuantity++;
                    } else if ("dec".equals(action) && productQuantity > 1) {
                        productQuantity--;
                    }

                    // Update the quantity in the products table
                    String updateQuery = "UPDATE products SET quantity=? WHERE id=?";
                    PreparedStatement updatePst = con.prepareStatement(updateQuery);
                    updatePst.setInt(1, productQuantity);
                    updatePst.setInt(2, id);
                    updatePst.executeUpdate();
                }

                // Update the quantity in the cart
                for (Cart item : cartList) {
                    if (item.getId() == id) {
                        item.setQuantity(productQuantity);
                        item.setTotal(item.getPrice() * productQuantity);
                        break;
                    }
                }

                session.setAttribute("cart-list", cartList);
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(QuantityIncDecServlet.class.getName()).log(Level.SEVERE, null, ex);

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(QuantityIncDecServlet.class.getName()).log(Level.SEVERE, null, ex);

            }
        }

        response.sendRedirect("cart.jsp");
    }
}
