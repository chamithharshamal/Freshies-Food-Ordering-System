<%@page import="freshies.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="freshies.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign Up</title>
    <style>
    .error-message {
        color: #999; 
        font-size: 16px; 
    }
</style>

    <jsp:include page="includes/header.jsp" />
</head>
<body>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        // If user is already authenticated, redirect to index page
        response.sendRedirect("index.jsp");
    } else {
        // User is not authenticated, continue rendering the sign-up form
        ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
        if (cart_list != null) {
            request.setAttribute("cart_list", cart_list);
        }
%>

<jsp:include page="includes/navBar.jsp" />

<div class="container">
    <div class="card w-50 mx-auto my-5">
        <div class="card-header text-center">User Sign Up</div>
        <div class="card-body">
            <form action="signup" method="post" id="signupForm">
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="name" id="name" class="form-control" placeholder="Enter name">
                    <span class="error-message" id="name_error_message"></span>
                </div>
                <div class="form-group">
                    <label>Email address</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="Enter email">
                    <span class="error-message" id="email_error_message"></span>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Password">
                    <span class="error-message" id="password_error_message"></span>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Sign Up</button>
                </div>
                <div class="text-center">
                    <p>Do you have an account? <a href="login.jsp">Log In</a></p>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />
<jsp:include page="includes/loader.jsp" />

<%
    }
%>

<script>
    document.getElementById('signupForm').addEventListener('submit', function(event) {
        var name = document.getElementById('name').value;
        var email = document.getElementById('email').value;
        var password = document.getElementById('password').value;

        var nameError = document.getElementById('name_error_message');
        var emailError = document.getElementById('email_error_message');
        var passwordError = document.getElementById('password_error_message');

        var isValid = true;

        if (!name.trim()) {
            nameError.innerText = 'Please enter your name.';
            isValid = false;
        } else if (!/^[a-zA-Z\s]+$/.test(name.trim())) {
            nameError.innerText = 'Only letters are allowed in the name field.';
            isValid = false;
        } else {
            nameError.innerText = '';
        }

        if (!email.trim()) {
            emailError.innerText = 'Please enter your email.';
            isValid = false;
        } else if (!/\S+@\S+\.\S+/.test(email.trim())) {
            emailError.innerText = 'Please enter a valid email address.';
            isValid = false;
        } else {
            emailError.innerText = '';
        }

        if (!password.trim()) {
            passwordError.innerText = 'Please enter a password.';
            isValid = false;
        } else if (!/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{6,}/.test(password)) {
            passwordError.innerText = 'Password must be at least 6 characters long\n\
*One uppercase letter, \n\
*One lowercase letter, \n\
*One digit,one special character.';
            isValid = false;
        } else {
            passwordError.innerText = '';
        }

        if (!isValid) {
            event.preventDefault();
        }
    });
</script>

</body>
</html>
