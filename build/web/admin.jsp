
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Admin Login</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
            }

            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .card {
                width: 400px;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }

            .card-header {
                background-color: #84ac44;
                color: #fff;
                text-align: center;
                padding: 15px 0;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
            }

            .card-body {
                padding: 20px;
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

            .btn-primary {
                background-color: #84ac44;
                color: #fff;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                cursor: pointer;
            }

            .btn-primary:hover {
                background-color: #fcfcfc;
                color: black;
                border: 1px solid #000000;
            }

            .text-center {
                text-align: center;
            }

            a {
                color: #84ac44;
                text-decoration: none;
            }

            a:hover {
                text-decoration: underline;
            }
            
            #backBtn {
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
        </style>
    </head>
    <body>
        <div class="container">
            <div id="backBtn">
                <a href="index.jsp"><button type="button">Back</button></a>
            </div>
            <div class="card">
                <div class="card-header">
                    <h2>Admin Login</h2>
                </div>
                <div class="card-body">
                    <form action="admin-login" method="post">
                        <div class="form-group">
                            <label for="admin-username">Username</label>
                            <input type="text" id="admin-username" name="admin-username" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="admin-password">Password</label>
                            <input type="password" id="admin-password" name="admin-password" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
