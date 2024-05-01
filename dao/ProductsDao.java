package freshies.dao;

import freshies.connection.DbConnection;
import freshies.model.Cart;
import freshies.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductsDao {

    private Connection con;

    public ProductsDao(Connection con) {
        this.con = con;
    }

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String query = "SELECT * FROM products";
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getDouble("price"));
                product.setQuantity(rs.getInt("quantity"));
                product.setImage(rs.getString("image"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return products;
    }

    public Product getSingleProduct(int id) {
        Product product = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String query = "SELECT * FROM products WHERE id=?";
            pst = con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setQuantity(rs.getInt("quantity"));
                product.setPrice(rs.getDouble("price"));
                product.setImage(rs.getString("image"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return product;
    }

    public void addProductToTable(int id, String name, double price, int quantity, String image) {
        PreparedStatement pst = null;
        try {
            String query = "INSERT INTO products (id, name, price, quantity, image) VALUES (?, ?, ?, ?, ?)";
            pst = con.prepareStatement(query);
            pst.setInt(1, id);
            pst.setString(2, name);
            pst.setDouble(3, price);
            pst.setInt(4, quantity);
            pst.setString(5, image);

            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void removeProduct(int productId) {
        PreparedStatement pst = null;
        try {
            String query = "DELETE FROM products WHERE id=?";
            pst = con.prepareStatement(query);
            pst.setInt(1, productId);
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void deleteAllProducts(Connection con) throws SQLException {
        String sql = "DELETE FROM products";
        try (PreparedStatement pst = con.prepareStatement(sql)) {
            pst.executeUpdate();
        }
    }

    private String getProductName(Connection con, int productId) throws SQLException {
        String productName = null;
        String sql = "SELECT name FROM products WHERE id = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, productId);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            productName = rs.getString("name");
        }
        return productName;
    }

}
