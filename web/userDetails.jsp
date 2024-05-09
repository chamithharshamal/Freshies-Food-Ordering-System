

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
        <title>User Details</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
       <link rel="stylesheet" href="css/admin.css">
        <style>
     
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
                <div class="userDetails">
            <h2>User Details</h2>
            <table>
                <thead>
                    <tr>
                        <th style="width: 20%;">User ID</th>
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
                        <td class="td1"><%= user.getId()%></td>
                        <td class="td1"><%= user.getName()%></td>
                        <td class="td1"><%= user.getEmail()%></td>
                        <td class="td1"><%= user.getPassword()%></td>
                    </tr>
                    <% } %>

                </tbody>
            </table>
                </div>
           
        </div>
                <div>
    </body>
</html>
