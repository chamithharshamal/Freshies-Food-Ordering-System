<%@page import="freshies.connection.DbConnection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="freshies.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="freshies.model.Product"%>
<%@page import="freshies.dao.ProductsDao"%>
<%@page import="freshies.model.User"%>

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="index.php">Freshies</a>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a href="shop.jsp" class="nav-link">Shop</a></li>
                <li class="nav-item"><a href="about.jsp" class="nav-link">About</a></li>
                <li class="nav-item"><a href="contact.jsp" class="nav-link">Contact</a></li>
                 
                <li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
                <li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
                   
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
              
                <li class="nav-item"><a class="nav-link" href="cart.jsp"><span class="icon-shopping_cart">[]</span> </a></li>
            </ul>
        </div>
    </div>
</nav>
