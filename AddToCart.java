package freshies.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import freshies.connection.DbConnection;
import freshies.dao.ProductsDao;
import freshies.model.Cart;

@WebServlet(name = "AddToCart", urlPatterns = "/add-to-cart")
public class AddToCart extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        @SuppressWarnings("unchecked")
        ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");

        if (cartList == null) {
            cartList = new ArrayList<>();
            session.setAttribute("cart-list", cartList);
        }

        boolean existsInCart = false;
        for (Cart cartItem : cartList) {
            if (cartItem.getId() == id) {
                existsInCart = true;
                break;
            }
        }

        if (!existsInCart) {

            Cart cartItem = new Cart();
            cartItem.setId(id);
            cartItem.setQuantity(quantity);
            cartList.add(cartItem);

            try {
                ProductsDao productDao = new ProductsDao(DbConnection.getConnection());
                productDao.addProductToTable(id, name, (int) price, quantity, image);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);

            }
        }

        response.sendRedirect(request.getHeader("referer"));
    }
}
