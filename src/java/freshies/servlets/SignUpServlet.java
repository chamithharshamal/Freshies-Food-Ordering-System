package freshies.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import freshies.connection.DbConnection;
import freshies.dao.UserDao;
import freshies.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    private static final String LOGIN_PAGE = "login.jsp";
    private static final String SIGNUP_ERROR_MESSAGE = "Error: Failed to sign up. Please try again later.";
    private static final String EMAIL_EXISTS_MESSAGE = "An account with this email already exists. Please <a href='login.jsp'>Log In Here</a>";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

           try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Connection con = null;
            try {
                con = DbConnection.getConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
            }
            String query = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, password);

            int rowsInserted = pst.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("login.jsp"); 
            } else {
                response.sendRedirect("signup.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); 
        }
    }
}

    private static class signup {

        public signup() {
        }
    }
} 