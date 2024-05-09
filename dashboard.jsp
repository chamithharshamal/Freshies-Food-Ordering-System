<%@page import="java.util.List"%>
<%@page import="freshies.model.Product"%>
<%@page import="freshies.dao.ProductsDao"%>
<%@page import="java.sql.SQLException"%>
<%@page import="freshies.connection.DbConnection"%>
<%@page import="freshies.model.Meal"%>
<%@page import="freshies.dao.MealsDao"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
         <link rel="stylesheet" href="css/admin.css">
        <style>
            .remove-btn {
                background-color: #dc3545;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .remove-btn:hover {
                background-color: #c82333;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <form id="logoutForm" action="AdminLogoutServlet" method="post">
                <button type="submit">Logout</button>
            </form>
           
            <div class="dashboard">
                <div class="sidebar">
                    <div class="menu">
                        <div class="menu-item"><a href="#"><i class="fas fa-tachometer-alt"></i> DASHBOARD</a></div>
                        <div class="menu-item"><a href="dashboard.jsp"><i class="fas fa-plus-circle"></i> Add Meal</a></div>
                        <div class="menu-item"><a href="userDetails.jsp"><i class="fas fa-users"></i> Users</a></div>
                        <div class="menu-item"><a href="orderDetails.jsp"><i class="fas fa-shopping-cart"></i> Orders</a></div>
                    </div>
                </div>
                <div class="content">
                    <h2>Admin Dashboard</h2>
                    <div class="add-item-panel">
                        <h3>Add a New Meal</h3>
                        <form method="post" action="AddMealServlet" enctype="multipart/form-data">
                            <div class="form-group">
                                <input type="text" id="name" name="name" placeholder="Name" required class="form-control" style="width: 95%;">
                            </div>
                            <div class="form-group">
                                <input type="text" id="price" name="price" placeholder="Price" required class="form-control" style="width: 95%;">
                            </div>
                            <div class="form-group">
                                <label for="image">Image Upload:</label>
                                <input type="file" id="image" name="imageFile" class="form-control-file" required>
                            </div>
                            <div class="form-group">
                                <select id="category" name="category" class="form-control" style="width: 95%;" required>
                                    <option value="">Select Category</option>
                                    <option value="Breakfast">Breakfast</option>
                                    <option value="Lunch">Lunch</option>
                                    <option value="Dinner">Dinner</option>
                                    <option value="Snack">Snack</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <button type="submit">Add Meal</button>
                            </div>
                        </form>
                    </div>
                 

                </div>
            </div>
            <%
                String message = (String) request.getAttribute("message");
                if (message == null) {

                } else {
            %>
            <p><%= message%></p>
            <% } %>
            <%

                String name = request.getParameter("name");
                String priceStr = request.getParameter("price");
                String imageUrl = request.getParameter("image");
                String category = request.getParameter("category");

                if (name != null && priceStr != null && imageUrl != null && category != null) {
                    double price = 0.0;
                    try {
                        price = Double.parseDouble(priceStr);
                    } catch (NumberFormatException e) {
                        message = "Invalid price format. Please enter a valid number.";
                    }

                    if (message == null) {
                        try {
                            Connection con = DbConnection.getConnection();
                            MealsDao mealDao = new MealsDao();
                            Meal meal = new Meal();
                            meal.setName(name);
                            meal.setPrice(price);
                            meal.setImage(imageUrl);
                            meal.setCategory(category);
                            boolean success = mealDao.addMeal(meal);

                            if (success) {
                                message = "Meal added successfully!";
                            } else {
                                message = "Failed to add meal. Please try again.";
                            }
                        } catch (ClassNotFoundException e) {
                            message = "Error: Database driver not found.";
                            e.printStackTrace();
                        } catch (SQLException e) {
                            message = "An error occurred while accessing the database.";
                            e.printStackTrace();
                        }
                    }
                }
            %>

            &nbsp;
            &nbsp;
            &nbsp;
            &nbsp;
            
            <table style="margin-left:250px;">
                <thead>
                    <tr>
                        <th style="width: 20%;">Meal ID</th> 
                        <th style="width: 30%;">Name</th> 
                        <th style="width: 30%;">Image</th> 
                        <th style="width: 20%;">Price</th> 
                        <th style="width: 20%;">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            MealsDao mealsDao = new MealsDao();
                            List<Meal> meals = mealsDao.getAllMeals();
                            for (Meal meal : meals) {
                    %>
                    <tr>
                        <td><%= meal.getId()%></td>
                        <td><%= meal.getName()%></td>
                        <td><img src="<%= meal.getImage()%>" alt="<%= meal.getName()%>" style="width: 70px; height: 70px;"></td>

                        <td><%= meal.getPrice()%></td>
                        <td>
                            <form method="post" action="RemoveMealServlet">
                                <input type="hidden" name="mealId" value="<%= meal.getId()%>">
                                <button type="submit" class="remove-btn">Remove</button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
        </div>
                <div>
    </body>
</html>
