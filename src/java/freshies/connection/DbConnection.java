
package freshies.connection;

import freshies.model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbConnection {

    private static Connection connection = null;

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        if (connection == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/Freshies";
                String username = "root";
                String password = "";
                Connection connection = DriverManager.getConnection(url, username, password);
                System.out.println("Database connection established successfully");
                return connection;
            } catch (Exception e) {
                System.err.println("Error establishing database connection: " + e.getMessage());
                e.printStackTrace();
            }
            return null;
        }
        return connection;
    }

    public static boolean isValidUser(String email, String password) {
        try {
            Connection connection = getConnection();
            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            return rs.next();
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error validating user: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public static void storeUser(User user) {
        try {
            Connection connection = getConnection();
            String sql = "INSERT INTO users (email, password, name) VALUES (?, ?, ?)";
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, user.getEmail());
            pst.setString(2, user.getPassword());
            pst.setString(3, user.getName());
            pst.executeUpdate();
            System.out.println("User stored successfully.");
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error storing user: " + e.getMessage());
            e.printStackTrace();
        }
    }

}
