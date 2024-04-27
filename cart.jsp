<%@page import="freshies.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="freshies.connection.DbConnection"%>
<%@page import="freshies.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Cart</title>
        <jsp:include page="includes/header.jsp" />
        <style>
            .green-background {
                background-color: #82ae46 !important; 
            }
        </style>
     
    </head>
    <body>
    
        <jsp:include page="includes/navBar.jsp" />
        <div class="hero-wrap hero-bread" style="background-image: url('images/cart.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <h1 class="mb-0 bread">My Cart</h1>
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
                                <th scope="col" class="green-background"></th>
                                <th scope="col" class="green-background">Product</th>
                                <th scope="col" class="green-background">Price</th>
                                <th scope="col" class="green-background">Quantity</th>
                                <th scope="col" class="green-background">Total</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                Connection con = DbConnection.getConnection();
                                PreparedStatement pst = con.prepareStatement("SELECT id, name, quantity, price FROM products");
                                ResultSet rs = pst.executeQuery();

                                double grandTotal = 0.0;
                                if (!rs.next()) {
                                    out.println("<tr><td colspan='6'>Your cart is empty.</td></tr>");
                                } else {
                                    do {
                                        int id = rs.getInt("id");
                                        String name = rs.getString("name");
                                        double price = rs.getDouble("price");
                                        int quantity = rs.getInt("quantity");

                                        double total = price * quantity;
                                        grandTotal += total;
                            %>

                            <tr class="text-center" id="item_<%= id%>">
                                <td class="product-remove"><a href="./remove-from-cart?id=<%= id%>">x</a></td>
                                <td class="image-prod"><div class="img" style="background-image:url(./images/cart/<%= id%>.webp);"></div></td>
                                <td class="product-name"><%= name%></td>
                                <td class="price"><%= price%></td>
                                <td class="quantity">
                                    <a href="quantity-inc-dec?action=dec&id=<%= id%>&quantity=-1">-  </a><!-- Decrease quantity by 1 -->
                                    <%= quantity%>
                                    <a href="quantity-inc-dec?action=inc&id=<%= id%>&quantity=1">  +</a><!-- Increase quantity by 1 -->
                                </td>
                                <td class="total" id="total_<%= id%>"><%= total%></td>
                            </tr>
                            <%
                                    } while (rs.next());
                                }
                            %>
                        </tbody>
                    </table>
                    <div>
                        <h3>Total: <%= grandTotal%></h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<form id="checkoutForm" action="CheckOutServlet" method="POST" class="info">
    <div class="row justify-content-end">
        <div class="col-lg-4 mt-5 cart-wrap ftco-animate">
            <div class="cart-total mb-3">
                <h3 class="billing-heading mb-4">Payment Method</h3>
                <div class="form-group">
                    <label><input type="radio" name="payment_method" value="Direct Bank Transfer" class="mr-2"> Direct Bank Transfer</label>
                </div>
                <div class="form-group">
                    <label><input type="radio" name="payment_method" value="Check Payment" class="mr-2"> Check Payment</label>
                </div>
                <div class="form-group">
                    <label><input type="radio" name="payment_method" value="Paypal" class="mr-2"> Paypal</label>
                </div>
                <div class="form-group">
                    <label><input required type="checkbox" value="" class="mr-2"> I have read and accept the terms and conditions</label>
                </div>
            </div>
        </div>
        <div class="col-lg-4 mt-5 cart-wrap ftco-animate">
            <h3>Order Information</h3>

            <input type="hidden" name="name_error" id="name_error">
            <input type="hidden" name="address_error" id="address_error">
            <input type="hidden" name="contact_number_error" id="contact_number_error">
            
            <div class="form-group">
                <label for="cusName">Name</label>
                <input required type="text" name="name" class="form-control text-left px-3" placeholder="">
                <span class="error-message" id="name_error_message"></span>
            </div>
            <div class="form-group">
                <label for="cusAddress">Address</label>
                <input required type="text" name="address" class="form-control text-left px-3" placeholder="">
                <span class="error-message" id="address_error_message"></span>
            </div>
            <div class="form-group">
                <label for="cusContact_number">Contact Number</label>
                <input required type="text" name="contact_number" class="form-control text-left px-3" placeholder="">
                <span class="error-message" id="contact_number_error_message"></span>
            </div>

        </div>
        <div class="col-lg-4 mt-5 cart-wrap ftco-animate">    
            <div class="cart-total mb-3">
                <%
                    int delCharge = 200;
                    double totalAmount = grandTotal + delCharge;
                %>
                <h3>Cart Total</h3>
                <p class="d-flex">
                    <span>Subtotal</span>
                    <span>Rs.<%= grandTotal%>.00</span>
                </p>
                <p class="d-flex">
                    <span>Delivery</span>
                    <span>RS.<%= delCharge%></span>
                </p>
                <hr>
                <p class="d-flex total-price">
                    <span>Total</span>
                    <span> Total: <%= grandTotal + delCharge%> </span>
                </p>
                <input type="hidden" name="total_price" value="<%= totalAmount%>">
                <button type="submit" class="btn btn-primary py-3 px-4">Place an order</button>
            </div>
        </div>
    </div>
</form>
<script>
    document.getElementById('checkoutForm').addEventListener('submit', function(event) {
        var name = document.getElementsByName('name')[0].value;
        var address = document.getElementsByName('address')[0].value;
        var contactNumber = document.getElementsByName('contact_number')[0].value;

        var nameError = document.getElementById('name_error');
        var addressError = document.getElementById('address_error');
        var contactNumberError = document.getElementById('contact_number_error');

        var isValid = true;

        // Name validation
        if (!name.trim()) {
            document.getElementById('name_error_message').innerText = 'Please enter your name.';
            nameError.value = 'Please enter your name.';
            isValid = false;
        } else if (!/^[a-zA-Z\s]+$/.test(name.trim())) { // Check if name contains only letters
            document.getElementById('name_error_message').innerText = 'Only letters are allowed in the name field.';
            nameError.value = 'Only letters are allowed in the name field.';
            isValid = false;
        } else {
            document.getElementById('name_error_message').innerText = '';
            nameError.value = '';
        }

        // Address validation
        if (!address.trim()) {
            document.getElementById('address_error_message').innerText = 'Please enter your address.';
            addressError.value = 'Please enter your address.';
            isValid = false;
        } else {
            document.getElementById('address_error_message').innerText = '';
            addressError.value = '';
        }

        // Contact number validation
        var contactRegex = /^[0-9]{10}$/;
        if (!contactRegex.test(contactNumber)) {
            document.getElementById('contact_number_error_message').innerText = 'Please enter a valid 10-digit contact number.';
            contactNumberError.value = 'Please enter a valid 10-digit contact number.';
            isValid = false;
        } else {
            document.getElementById('contact_number_error_message').innerText = '';
            contactNumberError.value = '';
        }

        if (!isValid) {
            event.preventDefault();
        }
    });
</script>
<jsp:include page="includes/footer.jsp" />
<jsp:include page="includes/loader.jsp" />
</body>
</html>