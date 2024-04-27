<%@page import="freshies.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="freshies.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In</title>
        <jsp:include page="includes/header.jsp" />
    </head>
    <body>
        <jsp:include page="includes/navBar.jsp" />

        <div class="container">
            <div class="card w-50 mx-auto my-5">
                <div class="card-header text-center">User Login</div>
                <div class="card-body">
                    <form action="user-login" method="post">
                        <div class="form-group">
                            <label>Email address</label> 
                            <input type="email" name="login-email" class="form-control" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label>Password</label> 
                            <input type="password" name="login-password" class="form-control" placeholder="Password">
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>
                        <div class="text-center">
                            <p>Don't you have an account? <a href="signup.jsp">Sign Up</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="includes/footer.jsp" />
        <jsp:include page="includes/loader.jsp" />
    </body>
</html>