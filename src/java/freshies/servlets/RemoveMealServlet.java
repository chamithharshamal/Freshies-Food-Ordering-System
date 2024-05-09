package freshies.servlets;

import freshies.connection.DbConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RemoveProductServlet")
public class RemoveMealServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("mealId");

        if (productId != null && !productId.isEmpty()) {
            try {
                Connection con = DbConnection.getConnection();
                String query = "DELETE FROM meals WHERE id = ?";
                PreparedStatement pst = con.prepareStatement(query);
                pst.setString(1, productId);
                int rowsDeleted = pst.executeUpdate();

                if (rowsDeleted > 0) {
                    response.sendRedirect("dashboard.jsp"); 
                } else {
                  
                }
            } catch (SQLException e) {
               
                e.printStackTrace();
               
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(RemoveMealServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            
            
        }
    }
}
