package freshies.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDao {
    private final Connection connection;


    public AdminDao(Connection connection) {
        this.connection = connection;
    }

   
    public boolean adminLogin(String username, String password) throws SQLException {
        String query = "SELECT COUNT(*) FROM admin WHERE username=? AND password=?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, username);
            stmt.setString(2, password);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    return count > 0;
                }
            }
        }
        return false; 
    }
}