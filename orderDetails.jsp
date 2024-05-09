

<%@page import="freshies.model.Order"%>
<%@page import="freshies.dao.OrderDao"%>
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
        <title>Order Details</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/admin.css">
        <style>
            h2 {
                text-align: left;
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
                <section class="ftco-section ftco-cart">
            <div class="container">
                 <h2>Order Details</h2>
                <div class="row">
                     
                    <table class="table table-light" border="1">
                        <thead>
                            <tr>
                               
                                <th scope="col" >Order ID</th>
                                <th scope="col" >Name</th>
                                <th scope="col" >Address</th>
                                <th scope="col" >Contact Number</th>
                                <th scope="col" >Total Price</th>
                                <th scope="col" >Payment Method</th>
                                <th scope="col" >Items</th>

                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                OrderDao orderDao = new OrderDao(DbConnection.getConnection());
                                List<Order> orders = orderDao.getAllOrders();
                                if (orders.isEmpty()) { // Check if there are no orders
                            %>
                            <tr class="text-center">
                                <td colspan="8">No orders yet</td>
                            </tr>
                            <% } else { 
                                for (Order order : orders) { 
                            %>
                            <tr class="text-center">
                              
                                <td><%= order.getOrderId() %></td>
                                <td><%= order.getName() %></td>
                                <td><%= order.getAddress() %></td>
                                <td><%= order.getContactNumber() %></td>
                                <td><%= order.getTotalPrice() %></td>
                                <td><%= order.getPaymentMethod() %></td>
                                <td><%= order.getItems() %></td>
                            </tr>
                            <% 
                                } 
                            } 
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
                    </div>
            </body>
</html>
