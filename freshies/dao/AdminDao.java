package freshies.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// Admin data access class for performing admin-related database operations
public class AdminDao {
    private final Connection connection;

    // Constructor to initialize the database connection
    public AdminDao(Connection connection) {
        this.connection = connection;
    }

    // Method to perform admin login based on username and password
    public boolean adminLogin(String username, String password) throws SQLException {
        String query = "SELECT COUNT(*) FROM admin WHERE username=? AND password=?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, username);
            stmt.setString(2, password);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    return count > 0; // Return true if a matching record is found
                }
            }
        }
        return false; // Return false if the login is unsuccessful
    }
}