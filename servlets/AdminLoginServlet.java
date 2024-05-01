package freshies.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freshies.connection.DbConnection;
import freshies.dao.AdminDao;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("admin-username");
        String password = request.getParameter("admin-password");

        AdminDao adminDao = null;
        try {
            adminDao = new AdminDao(DbConnection.getConnection());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminLoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AdminLoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        boolean isValidAdmin = false;
        try {
            isValidAdmin = adminDao.adminLogin(username, password);
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception appropriately
        }

        if (isValidAdmin) {
            // Successful login
            Cookie adminCookie = new Cookie("adminLogin", username);
            adminCookie.setMaxAge(3600); // Set cookie expiration time (1 hour)
            response.addCookie(adminCookie);
            response.sendRedirect("dashboard.jsp"); // Redirect to dashboard
        } else {
            // Failed login
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        }
    }
}