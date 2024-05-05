package freshies.model;

// Admin model class representing the structure of admin data
public class Admin {
    private int id;
    private String username;
    private String password; // In a real scenario, consider using secure password hashing and storage techniques

    // Getters and Setters for the Admin model
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
