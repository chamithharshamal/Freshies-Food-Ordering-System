package freshies.dao;

import freshies.connection.DbConnection;
import freshies.model.Meal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MealsDao {
    private Connection con;

    public MealsDao() throws ClassNotFoundException, SQLException {
        con = DbConnection.getConnection();
    }

    public List<Meal> getMealsByCategory(String category) {
        List<Meal> mealsList = new ArrayList<>();

        try {
            String query = "SELECT * FROM meals WHERE category = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, category);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Meal meal = new Meal();
                meal.setId(rs.getInt("id"));
                meal.setName(rs.getString("name"));
                meal.setPrice(rs.getDouble("price"));
                meal.setImage(rs.getString("image"));
                meal.setCategory(rs.getString("category"));
                mealsList.add(meal);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return mealsList;
    }
}
