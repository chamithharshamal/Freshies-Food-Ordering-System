<!DOCTYPE html>
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
          
                            <tr class="text-center">
                                <td colspan="8">No orders yet</td>
                            </tr>
                            
                            <tr class="text-center">
                                <td class="product-remove"><a href="./cancel-order?id=">x</a></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>

        <jsp:include page="includes/footer.jsp" />
        <jsp:include page="includes/loader.jsp" />
    </body>
</html>
