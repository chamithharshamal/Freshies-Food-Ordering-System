<%@page import="freshies.dao.OrderDao"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Date"%>
<%@page import="freshies.model.Order"%>
<%@page import="freshies.dao.ProductsDao"%>
<%@page import="java.util.List"%>
<%@page import="freshies.connection.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="freshies.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Orders</title>
        <jsp:include page="includes/header.jsp" />
        <style>
            .green-background {
                background-color: #82ae46 !important; 
            }
        </style>
    </head>
    <body>
        <jsp:include page="includes/navBar.jsp" />
        <div class="hero-wrap hero-bread" style="background-image: url('images/signin.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <h1 class="mb-0 bread">My Orders</h1>
                    </div>
                </div>
            </div>
        </div>
        <section class="ftco-section ftco-cart">
            <div class="container">
                <div class="row">
                    <table class="table table-light">
                        <thead>
                            <tr>
                                <th scope="col" class="green-background"></th>
                                <th scope="col" class="green-background">Order ID</th>
                                <th scope="col" class="green-background">Name</th>
                                <th scope="col" class="green-background">Address</th>
                                <th scope="col" class="green-background">Contact Number</th>
                                <th scope="col" class="green-background">Total Price</th>
                                <th scope="col" class="green-background">Payment Method</th>
                                <th scope="col" class="green-background">Items</th>

                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                OrderDao orderDao = new OrderDao(DbConnection.getConnection());
                                List<Order> orders = orderDao.getAllOrders();
                                if (orders.isEmpty()) { 
                            %>
                            <tr class="text-center">
                                <td colspan="8">No orders yet</td>
                            </tr>
                            <% } else { 
                                for (Order order : orders) { 
                            %>
                            <tr class="text-center">
                                <td class="product-remove"><a href="./cancel-order?id=<%= order.getOrderId()%>">x</a></td>
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

        <jsp:include page="includes/footer.jsp" />
        <jsp:include page="includes/loader.jsp" />
    </body>
</html>
