package freshies.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import freshies.connection.DbConnection;
import freshies.dao.UserDao;
import freshies.model.User;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("login-email");
            String password = request.getParameter("login-password");

            UserDao udao = new UserDao(DbConnection.getConnection());
            User user = udao.userLogin(email, password);
            if (user != null) {
               
                Cookie sessionCookie = new Cookie("user_session", user.getUsername());
                sessionCookie.setMaxAge(24 * 60 * 60); 
                response.addCookie(sessionCookie);

                request.getSession().setAttribute("auth", user);
                response.sendRedirect("index.jsp");
            } else {
                out.println("<script type=\"text/javascript\">");
                    out.println("alert('Failed to log in. Please try again.');");
                    out.println("window.location='login.jsp';");
                    out.println("</script>");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }
}
