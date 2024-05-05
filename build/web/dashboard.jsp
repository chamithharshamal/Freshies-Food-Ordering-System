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
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            h2 {
                text-align: center;
                color: #84ac44;
                margin-bottom: 30px;
                font-size: 32px; 
            }
            form#logoutForm {
                position: absolute;
                top: 20px;
                right: 20px;
            }

            button {
                padding: 10px 20px;
                background-color: #84ac44;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            button:hover{
                background-color: #fdfdfd;
                color: #000000;
                border: 1px solid #000000;
            }
            .dashboard {
                display: flex;
                justify-content: center;
                align-items: flex-start;
                margin-top: 20px;
            }

            .sidebar {
                background-color: #f4f4f4;
                padding: 20px;
                min-width: 30%;
                border-radius: 10px;
                margin-bottom: 20px;
            }

            .content {
                width: 100%;
                background-color: #fff;
                border-radius: 10px;
                padding: 20px;
            }

            .add-item-panel {
                background-color: #f9f9f9;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 400px;
                max-width: 100%;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-control {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            p {
                color: #84ac44;
                text-align: center;
                margin-top: 20px;
            }

            table {
                width: 80%;
                border-collapse: collapse;
                margin-bottom: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            th, td {
                border-bottom: 1px solid #ddd;
                text-align: center;
                padding: 10px;
            }

            th {
                background-color: #84ac44;
                color: #fff;
            }

            .td1{
                padding: 25px;
            }

            tbody tr:hover {
                background-color: #f2f2f2;
            }

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
            <h2>Admin Dashboard</h2>
            <div class="dashboard">
                <div class="content">
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

            <h3>Users</h3>
            <table>
                <thead>
                    <tr>
                        <th style="width: 30%;" >Username</th> 
                        <th style="width: 30%;" >Email</th> 
                        <th style="width: 20%;">Password</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Fetch users and iterate over them --%>
                    <%
                        freshies.dao.UserDao userDao = new freshies.dao.UserDao(freshies.connection.DbConnection.getConnection());
                        java.util.List<freshies.model.User> userList = userDao.getAllUsers();
                        for (freshies.model.User user : userList) {
                    %>
                    <tr>
                        <td class="td1"><%= user.getName()%></td>
                        <td class="td1"><%= user.getEmail()%></td>
                        <td class="td1"><%= user.getPassword()%></td>
                    </tr>
                    <% } %>

                </tbody>
            </table>

            <h3>User Products</h3>
            <table>
                <thead>
                    <tr>
                        <th style="width: 20%;">Meal ID</th> 
                        <th style="width: 30%;">Name</th> 
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
    </body>
</html>
