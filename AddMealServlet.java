package freshies.servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import freshies.dao.MealsDao;
import freshies.model.Meal;

@WebServlet(name = "AddMealServlet", urlPatterns = {"/AddMealServlet"})
@MultipartConfig
public class AddMealServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Fetch form parameters
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String category = request.getParameter("category");

        // Convert price string to double
        double price;
        try {
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid price format. Please enter a valid number.");
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            return;
        }

        // Process file upload
        Part filePart = request.getPart("imageFile");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = "images";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String imagePath = uploadPath + File.separator + fileName;
        InputStream fileContent = filePart.getInputStream();
        Files.copy(fileContent, Paths.get(imagePath), StandardCopyOption.REPLACE_EXISTING);

        // Create a new meal object
        Meal meal = new Meal();
        meal.setName(name);
        meal.setPrice(price);
        meal.setCategory(category);
        meal.setImage(imagePath);

        // Insert the meal into the database
        try {
            MealsDao mealDao = new MealsDao();
            boolean success = mealDao.addMeal(meal);
            if (success) {
                request.setAttribute("message", "Meal added successfully!");
            } else {
                request.setAttribute("message", "Failed to add meal. Please try again.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            request.setAttribute("message", "An error occurred while accessing the database.");
            e.printStackTrace();
        }

        // Forward the request to the admin dashboard
        request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}