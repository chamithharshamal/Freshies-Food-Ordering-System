<%-- 
    Document   : meals
    Created on : Apr 8, 2024, 1:15:42 AM
    Author     : Dell
--%>
<%@page import="freshies.connection.DbConnection"%>
<%@page import="freshies.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="freshies.dao.ProductsDao"%>
<%@page import="freshies.model.User"%>
<%@page import="freshies.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop</title>
        <jsp:include page="includes/header.jsp" />
    </head>
    <body>
        <jsp:include page="includes/navBar.jsp" />
        <div class="hero-wrap hero-bread" style="background-image: url('images/meals.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <p class="breadcrumbs"><span class="mr-2"></p>
                        <h1 class="mb-0 bread">Meal Plan</h1>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <section id="Breakfast" class="ftco-section1">

            <div class="container">
                <section id="breakveg">
                    <h2 class="mb-4 "><b>Breakfast</b></h2><h4>Veg</h4>
                    <div class="row">

                        <div class="col-md-6 col-lg-3 ftco-animate">
                            <div class="product">

                                <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/1.webp" alt="Colorlib Template">
                                    <div class="overlay"></div>
                                </a>
                                <div class="text py-3 pb-4 px-3 text-center">
                                    <h3><a href="#">String Hoppers</a></h3>
                                    <div class="d-flex">
                                        <div class="pricing">
                                            <p class="price"><span>Rs.150.00</span></p>
                                        </div>
                                    </div>
                                    <div class="bottom-area d-flex px-3">
                                        <div class="m-auto d-flex">
                                            <form method="get" action="AddToCart">
                                                <input type="hidden" name="id" value="1">
                                                <input type="hidden" name="name" value="String Hoppers">
                                                <input type="hidden" name="price" value="150">
                                                <input type="hidden" name="quantity" value="1">
                                                <input type="hidden" name="image" value="images/cart/1.webp">
                                                <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3 ftco-animate">
                            <div class="product">
                                <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/2.webp" alt="Colorlib Template">
                                    <div class="overlay"></div>
                                </a>
                                <div class="text py-3 pb-4 px-3 text-center">
                                    <h3><a href="#">Sri Lankan Rice and Curry</a></h3>
                                    <div class="d-flex">
                                        <div class="pricing">
                                            <p class="price"><span>Rs.200.00</span></p>
                                        </div>
                                    </div>
                                    <div class="bottom-area d-flex px-3">
                                        <div class="m-auto d-flex">
                                            <form method="get" action="AddToCart">
                                                <input type="hidden" name="id" value="2">
                                                <input type="hidden" name="name" value="Sri Lankan Rice and Curry">
                                                <input type="hidden" name="price" value="200">
                                                <input type="hidden" name="quantity" value="1">
                                                <input type="hidden" name="image" value="images/cart/2.webp">
                                                <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3 ftco-animate">
                            <div class="product">
                                <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/3.webp" alt="Colorlib Template">
                                    <div class="overlay"></div>
                                </a>
                                <div class="text py-3 pb-4 px-3 text-center">
                                    <h3><a href="#">Milk Rice </a></h3>
                                    <div class="d-flex">
                                        <div class="pricing">
                                            <p class="price"><span>Rs.150.00</span></p>
                                        </div>
                                    </div>
                                    <div class="bottom-area d-flex px-3">
                                        <div class="m-auto d-flex">
                                            <form method="get" action="AddToCart">
                                                <input type="hidden" name="id" value="3">
                                                <input type="hidden" name="name" value="Milk Rice ">
                                                <input type="hidden" name="price" value="150">
                                                <input type="hidden" name="quantity" value="1">
                                                 <input type="hidden" name="image" value="images/cart/3.webp">
                                                <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3 ftco-animate">
                            <div class="product">
                                <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/4.webp" alt="Colorlib Template">
                                    <div class="overlay"></div>
                                </a>
                                <div class="text py-3 pb-4 px-3 text-center">
                                    <h3><a href="#">American Pancakes</a></h3>
                                    <div class="d-flex">
                                        <div class="pricing">
                                            <p class="price"><span>Rs.200.00</span></p>
                                        </div>
                                    </div>
                                    <div class="bottom-area d-flex px-3">
                                        <div class="m-auto d-flex">
                                            <form method="get" action="AddToCart">
                                                <input type="hidden" name="id" value="4">
                                                <input type="hidden" name="name" value="American Pancakes">
                                                <input type="hidden" name="price" value="200">
                                                <input type="hidden" name="quantity" value="1">
                                                 <input type="hidden" name="image" value="images/cart/4.webp">
                                                <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </section>

                <section id="breaknonveg" class="ftco-section1">
                    <div class="container">
                        <h4>Non Veg</h4>
                        <div class="row">
                            <div class="col-md-6 col-lg-3 ftco-animate">
                                <div class="product">
                                    <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/5.webp" alt="Colorlib Template">
                                        <div class="overlay"></div>
                                    </a>
                                    <div class="text py-3 pb-4 px-3 text-center">
                                        <h3><a href="#">Western Breakfast</a></h3>
                                        <div class="d-flex">
                                            <div class="pricing">
                                                <p class="price"><span class="mr-2 price">Rs.550.00</span></p>
                                            </div>
                                        </div>
                                        <div class="bottom-area d-flex px-3">
                                            <div class="m-auto d-flex">
                                                <form method="get" action="AddToCart">
                                                    <input type="hidden" name="id" value="5">
                                                    <input type="hidden" name="name" value="Western Breakfast">
                                                    <input type="hidden" name="price" value="550">
                                                    <input type="hidden" name="quantity" value="1">
                                                      <input type="hidden" name="image" value="images/cart/5.webp">
                                                    <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3 ftco-animate">
                                <div class="product">
                                    <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/6.webp" alt="Colorlib Template">
                                        <div class="overlay"></div>
                                    </a>
                                    <div class="text py-3 pb-4 px-3 text-center">
                                        <h3><a href="#">Mutton Samosa</a></h3>
                                        <div class="d-flex">
                                            <div class="pricing">
                                                <p class="price"><span> Rs.60.00</span></p>
                                            </div>
                                        </div>
                                        <div class="bottom-area d-flex px-3">
                                            <div class="m-auto d-flex">
                                                <form method="get" action="AddToCart">
                                                    <input type="hidden" name="id" value="6">
                                                    <input type="hidden" name="name" value="Mutton Samosa">
                                                    <input type="hidden" name="price" value="60">
                                                    <input type="hidden" name="quantity" value="1">
                                                      <input type="hidden" name="image" value="images/cart/6.webp">
                                                    <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3 ftco-animate">
                                <div class="product">
                                    <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/7.webp" alt="Colorlib Template">
                                        <div class="overlay"></div>
                                    </a>
                                    <div class="text py-3 pb-4 px-3 text-center">
                                        <h3><a href="#">Savory Waffles</a></h3>
                                        <div class="d-flex">
                                            <div class="pricing">
                                                <p class="price"><span>Rs.420.00</span></p>
                                            </div>
                                        </div>
                                        <div class="bottom-area d-flex px-3">
                                            <div class="m-auto d-flex">
                                                <form method="get" action="AddToCart">
                                                    <input type="hidden" name="id" value="7">
                                                    <input type="hidden" name="name" value="Savory Waffles">
                                                    <input type="hidden" name="price" value="420">
                                                    <input type="hidden" name="quantity" value="1">
                                                      <input type="hidden" name="image" value="images/cart/7.webp">
                                                    <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3 ftco-animate">
                                <div class="product">
                                    <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/8.webp" alt="Colorlib Template">
                                        <div class="overlay"></div>
                                    </a>
                                    <div class="text py-3 pb-4 px-3 text-center">
                                        <h3><a href="#">Chicken Burger</a></h3>
                                        <div class="d-flex">
                                            <div class="pricing">
                                                <p class="price"><span>Rs.450.00</span></p>
                                            </div>
                                        </div>
                                        <div class="bottom-area d-flex px-3">
                                            <div class="m-auto d-flex">
                                                <form method="get" action="AddToCart">
                                                    <input type="hidden" name="id" value="8">
                                                    <input type="hidden" name="name" value="Chicken Burger">
                                                    <input type="hidden" name="price" value="450">
                                                    <input type="hidden" name="quantity" value="1">
                                                      <input type="hidden" name="image" value="images/cart/8.webp">
                                                    <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </section>
                        </div>
                    </div>
            </div>
        </div>
    </section>
    <hr>
    <hr>
    <section id="Lunch" class="ftco-section1">
        <div class="container">
            <section id="lunchveg">
                <h2 class="mb-4"><b>Lunch</b></h2><h4>Veg</h4>
                <div class="row">

                    <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="product">
                            <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/2.webp" alt="Colorlib Template">
                                <div class="overlay"></div>
                            </a>
                            <div class="text py-3 pb-4 px-3 text-center">
                                <h3><a href="#">Sri Lankan Rice and Curry</a></h3>
                                <div class="d-flex">
                                    <div class="pricing">
                                        <p class="price"><span>Rs.200.00</span></p>
                                    </div>
                                </div>
                                <div class="bottom-area d-flex px-3">
                                    <div class="m-auto d-flex">
                                        <form method="get" action="AddToCart">
                                            <input type="hidden" name="id" value="2">
                                            <input type="hidden" name="name" value="Sri Lankan Rice and Curry">
                                            <input type="hidden" name="price" value="200">
                                            <input type="hidden" name="quantity" value="1">
                                              <input type="hidden" name="image" value="images/cart/2.webp">
                                            <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="product">
                            <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/16.webp" alt="Colorlib Template">
                                <div class="overlay"></div>
                            </a>
                            <div class="text py-3 pb-4 px-3 text-center">
                                <h3><a href="#">Vegetable Fried Rice</a></h3>
                                <div class="d-flex">
                                    <div class="pricing">
                                        <p class="price"><span>Rs.450.00</span></p>
                                    </div>
                                </div>
                                <div class="bottom-area d-flex px-3">
                                    <div class="m-auto d-flex">
                                        <form method="get" action="AddToCart">
                                            <input type="hidden" name="id" value="16">
                                            <input type="hidden" name="name" value="Vegetable Fried Rice">
                                            <input type="hidden" name="price" value="450">
                                            <input type="hidden" name="quantity" value="1">
                                              <input type="hidden" name="image" value="images/cart/16.webp">
                                            <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="product">
                            <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/9.webp" alt="Colorlib Template">
                                <div class="overlay"></div>
                            </a>
                            <div class="text py-3 pb-4 px-3 text-center">
                                <h3><a href="#">Vegetable Kottu</a></h3>
                                <div class="d-flex">
                                    <div class="pricing">
                                        <p class="price"><span>Rs.400.00</span></p>
                                    </div>
                                </div>
                                <div class="bottom-area d-flex px-3">
                                    <div class="m-auto d-flex">
                                        <form method="get" action="AddToCart">
                                            <input type="hidden" name="id" value="9">
                                            <input type="hidden" name="name" value="Vegetable Kottu">
                                            <input type="hidden" name="price" value="400">
                                            <input type="hidden" name="quantity" value="1">
                                              <input type="hidden" name="image" value="images/cart/9.webp">
                                            <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="product">
                            <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/10.webp" alt="Colorlib Template">
                                <div class="overlay"></div>
                            </a>
                            <div class="text py-3 pb-4 px-3 text-center">
                                <h3><a href="#">Green Salad</a></h3>
                                <div class="d-flex">
                                    <div class="pricing">
                                        <p class="price"><span>Rs.400.00</span></p>
                                    </div>
                                </div>
                                <div class="bottom-area d-flex px-3">
                                    <div class="m-auto d-flex">
                                        <form method="get" action="AddToCart">
                                            <input type="hidden" name="id" value="10">
                                            <input type="hidden" name="name" value="Green Salad">
                                            <input type="hidden" name="price" value="400">
                                            <input type="hidden" name="quantity" value="1">
                                              <input type="hidden" name="image" value="images/cart/10.webp">
                                            <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </section>

            <section id="lunchnonveg" class="ftco-section1">
                <div class="container">
                    <h4>Non Veg</h4>
                    <div class="row">
                        <div class="col-md-6 col-lg-3 ftco-animate">
                            <div class="product">
                                <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/11.webp" alt="Colorlib Template">
                                    <span class="status">30%</span>
                                    <div class="overlay"></div>
                                </a>
                                <div class="text py-3 pb-4 px-3 text-center">
                                    <h3><a href="#">Chicken Fried Rice</a></h3>
                                    <div class="d-flex">
                                        <div class="pricing">
                                            <p class="price"><span class="mr-2 price">Rs.500</span></p>
                                        </div>
                                    </div>
                                    <div class="bottom-area d-flex px-3">
                                        <div class="m-auto d-flex">
                                            <form method="get" action="AddToCart">
                                                <input type="hidden" name="id" value="11">
                                                <input type="hidden" name="name" value="Chicken Fried Rice">
                                                <input type="hidden" name="price" value="500">
                                                <input type="hidden" name="quantity" value="1">
                                                  <input type="hidden" name="image" value="images/cart/11.webp">
                                                <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3 ftco-animate">
                            <div class="product">
                                <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/12.webp" alt="Colorlib Template">
                                    <div class="overlay"></div>
                                </a>
                                <div class="text py-3 pb-4 px-3 text-center">
                                    <h3><a href="#">Seafood Nasigoreng </a></h3>
                                    <div class="d-flex">
                                        <div class="pricing">
                                            <p class="price"><span>Rs.680.00</span></p>
                                        </div>
                                    </div>
                                    <div class="bottom-area d-flex px-3">
                                        <div class="m-auto d-flex">
                                            <form method="get" action="AddToCart">
                                                <input type="hidden" name="id" value="12">
                                                <input type="hidden" name="name" value="Seafood Nasigoreng">
                                                <input type="hidden" name="price" value="680">
                                                <input type="hidden" name="quantity" value="1">
                                                  <input type="hidden" name="image" value="images/cart/12.webp">
                                                <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3 ftco-animate">
                            <div class="product">
                                <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/13.webp" alt="Colorlib Template">
                                    <div class="overlay"></div>
                                </a>
                                <div class="text py-3 pb-4 px-3 text-center">
                                    <h3><a href="#">Chicken Kottu</a></h3>
                                    <div class="d-flex">
                                        <div class="pricing">
                                            <p class="price"><span>Rs.450.00</span></p>
                                        </div>
                                    </div>

                                    <div class="bottom-area d-flex px-3">
                                        <div class="m-auto d-flex">
                                            <form method="get" action="AddToCart">
                                                <input type="hidden" name="id" value="13">
                                                <input type="hidden" name="name" value="Chicken Kottu">
                                                <input type="hidden" name="price" value="450">
                                                <input type="hidden" name="quantity" value="1">
                                                  <input type="hidden" name="image" value="images/cart/13.webp">
                                                <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                            </form>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3 ftco-animate">
                            <div class="product">
                                <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/14.webp" alt="Colorlib Template">
                                    <div class="overlay"></div>
                                </a>
                                <div class="text py-3 pb-4 px-3 text-center">
                                    <h3><a href="#">Chicken Rotti</a></h3>
                                    <div class="d-flex">
                                        <div class="pricing">
                                            <p class="price"><span>Rs.300.00</span></p>
                                        </div>
                                    </div>
                                    <div class="bottom-area d-flex px-3">
                                        <div class="m-auto d-flex">
                                            <form method="get" action="AddToCart">
                                                <input type="hidden" name="id" value="14">
                                                <input type="hidden" name="name" value="Chicken Rotti">
                                                <input type="hidden" name="price" value="300">
                                                <input type="hidden" name="quantity" value="1">
                                                  <input type="hidden" name="image" value="images/cart/14.webp">
                                                <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </section>
                    </div>
                </div>
        </div>
    </div>
</section>

<hr>
<hr>

<section id="Dinner" class="ftco-section1">
    <div class="container">
        <section id="dinnerveg">
            <h2 class="mb-4"><b>Dinner</b></h2><h4>Veg</h4>
            <div class="row">

                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="product">
                        <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/10.webp" alt="Colorlib Template">
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3 text-center">
                            <h3><a href="#">Green Salad</a></h3>
                            <div class="d-flex">
                                <div class="pricing">
                                    <p class="price"><span>Rs.400.00</span></p>
                                </div>
                            </div>
                            <div class="bottom-area d-flex px-3">
                                <div class="m-auto d-flex">
                                    <form method="get" action="AddToCart">
                                        <input type="hidden" name="id" value="10">
                                        <input type="hidden" name="name" value="Green Salad">
                                        <input type="hidden" name="price" value="400">
                                        <input type="hidden" name="quantity" value="1">
                                          <input type="hidden" name="image" value="images/cart/10.webp">
                                        <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="product">
                        <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/9.webp" alt="Colorlib Template">
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3 text-center">
                            <h3><a href="#">Vegetable Kottu</a></h3>
                            <div class="d-flex">
                                <div class="pricing">
                                    <p class="price"><span>Rs.400.00</span></p>
                                </div>
                            </div>
                            <div class="bottom-area d-flex px-3">
                                <div class="m-auto d-flex">
                                    <form method="get" action="AddToCart">
                                        <input type="hidden" name="id" value="9">
                                        <input type="hidden" name="name" value="Vegetable Kottu">
                                        <input type="hidden" name="price" value="400">
                                        <input type="hidden" name="quantity" value="1">
                                          <input type="hidden" name="image" value="images/cart/9.webp">
                                        <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="product">
                        <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/15.webp" alt="Colorlib Template">
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3 text-center">
                            <h3><a href="#">Vegetable Soup</a></h3>
                            <div class="d-flex">
                                <div class="pricing">
                                    <p class="price"><span>Rs.320.00</span></p>
                                </div>
                            </div>
                            <div class="bottom-area d-flex px-3">
                                <div class="m-auto d-flex">
                                    <form method="get" action="AddToCart">
                                        <input type="hidden" name="id" value="15">
                                        <input type="hidden" name="name" value="Vegetable Soup ">
                                        <input type="hidden" name="price" value="320">
                                        <input type="hidden" name="quantity" value="1">
                                          <input type="hidden" name="image" value="images/cart/15.webp">
                                        <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="product">
                        <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/16.webp" alt="Colorlib Template">
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3 text-center">
                            <h3><a href="#">Vegetable Fried Rice</a></h3>
                            <div class="d-flex">
                                <div class="pricing">
                                    <p class="price"><span>Rs.450.00</span></p>
                                </div>
                            </div>
                            <div class="bottom-area d-flex px-3">
                                <div class="m-auto d-flex">
                                    <form method="get" action="AddToCart">
                                        <input type="hidden" name="id" value="16">
                                        <input type="hidden" name="name" value="Vegetable Fried Rice">
                                        <input type="hidden" name="price" value="450">
                                        <input type="hidden" name="quantity" value="1">
                                          <input type="hidden" name="image" value="images/cart/16.webp">
                                        <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>

        <section id="dinnernonveg" class="ftco-section1">
            <div class="container">
                <h4>Non Veg</h4>
                <div class="row">
                    <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="product">
                            <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/13.webp" alt="Colorlib Template">
                                <div class="overlay"></div>
                            </a>
                            <div class="text py-3 pb-4 px-3 text-center">
                                <h3><a href="#">Chicken Kottu</a></h3>
                                <div class="d-flex">
                                    <div class="pricing">
                                        <p class="price"><span>Rs.450.00</span></p>
                                    </div>
                                </div>

                                <div class="bottom-area d-flex px-3">
                                    <div class="m-auto d-flex">
                                       	<form method="get" action="AddToCart">
                                            <input type="hidden" name="id" value="13">
                                            <input type="hidden" name="name" value="Chicken Kottu">
                                            <input type="hidden" name="price" value="450">
                                            <input type="hidden" name="quantity" value="1">
                                              <input type="hidden" name="image" value="images/cart/13.webp">
                                            <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                        </form>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="product">
                            <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/17.webp" alt="Colorlib Template">
                                <div class="overlay"></div>
                            </a>
                            <div class="text py-3 pb-4 px-3 text-center">
                                <h3><a href="#">Mixed Fried Rice</a></h3>
                                <div class="d-flex">
                                    <div class="pricing">
                                        <p class="price"><span>Rs.750.00</span></p>
                                    </div>
                                </div>

                                <div class="bottom-area d-flex px-3">
                                    <div class="m-auto d-flex">
                                       	<form method="get" action="AddToCart">
                                            <input type="hidden" name="id" value="17">
                                            <input type="hidden" name="name" value="Mixed Fried Rice ">
                                            <input type="hidden" name="price" value="750">
                                            <input type="hidden" name="quantity" value="1">
                                              <input type="hidden" name="image" value="images/cart/17.webp">
                                            <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                        </form>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="product">
                            <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/18.webp" alt="Colorlib Template">
                                <div class="overlay"></div>
                            </a>
                            <div class="text py-3 pb-4 px-3 text-center">
                                <h3><a href="#">Club Sandwich</a></h3>
                                <div class="d-flex">
                                    <div class="pricing">
                                        <p class="price"><span>Rs.450.00</span></p>
                                    </div>
                                </div>
                                <div class="bottom-area d-flex px-3">
                                    <div class="m-auto d-flex">
                                        <form method="get" action="AddToCart">
                                            <input type="hidden" name="id" value="18">
                                            <input type="hidden" name="name" value="Club Sandwich">
                                            <input type="hidden" name="price" value="450">
                                            <input type="hidden" name="quantity" value="1">
                                              <input type="hidden" name="image" value="images/cart/18.webp">
                                            <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="product">
                            <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/19.webp" alt="Colorlib Template">
                                <div class="overlay"></div>
                            </a>
                            <div class="text py-3 pb-4 px-3 text-center">
                                <h3><a href="#">Large Pizza</a></h3>
                                <div class="d-flex">
                                    <div class="pricing">
                                        <p class="price"><span>Rs.2400.00</span></p>
                                    </div>
                                </div>
                                <div class="bottom-area d-flex px-3">
                                    <div class="m-auto d-flex">
                                        <form method="get" action="AddToCart">
                                            <input type="hidden" name="id" value="19">
                                            <input type="hidden" name="name" value="Large Pizza<">
                                            <input type="hidden" name="price" value="2400">
                                            <input type="hidden" name="quantity" value="1">
                                              <input type="hidden" name="image" value="images/cart/19.webp">
                                            <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </section>
                </div>
            </div>
    </div>
</div>
</section>

<hr>

<hr>
<section id="Snack" class="ftco-section4">
    <div class="container">
        <h2 class="mb-4"><b>Snacks</b></h2>
        <div class="row">
            <div class="col-md-6 col-lg-3 ftco-animate">
                <div class="product">
                    <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/20.webp" alt="Colorlib Template">
                        <div class="overlay"></div>
                    </a>
                    <div class="text py-3 pb-4 px-3 text-center">
                        <h3><a href="#">Doughnut</a></h3>
                        <div class="d-flex">
                            <div class="pricing">
                                <p class="price"><span class="mr-2">Rs.100.00</span></p>
                            </div>
                        </div>
                        <div class="bottom-area d-flex px-3">
                            <div class="m-auto d-flex">
                                <form method="get" action="AddToCart">
                                    <input type="hidden" name="id" value="20">
                                    <input type="hidden" name="name" value="Doughnut">
                                    <input type="hidden" name="price" value="100">
                                    <input type="hidden" name="quantity" value="1">
                                      <input type="hidden" name="image" value="images/cart/20.webp">
                                    <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 ftco-animate">
                <div class="product">
                    <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/21.webp" alt="Colorlib Template">
                        <div class="overlay"></div>
                    </a>
                    <div class="text py-3 pb-4 px-3 text-center">
                        <h3><a href="#">French Fries </a></h3>
                        <div class="d-flex">
                            <div class="pricing">
                                <p class="price"><span>Rs.380.00</span></p>
                            </div>
                        </div>
                        <div class="bottom-area d-flex px-3">
                            <div class="m-auto d-flex">
                                <form method="get" action="AddToCart">
                                    <input type="hidden" name="id" value="21">
                                    <input type="hidden" name="name" value="French Fries">
                                    <input type="hidden" name="price" value="380">
                                    <input type="hidden" name="quantity" value="1">
                                      <input type="hidden" name="image" value="images/cart/21.webp">
                                    <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 ftco-animate">
                <div class="product">
                    <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/22.webp" alt="Colorlib Template">
                        <div class="overlay"></div>
                    </a>
                    <div class="text py-3 pb-4 px-3 text-center">
                        <h3><a href="#">Chicken Strips (6)</a></h3>
                        <div class="d-flex">
                            <div class="pricing">
                                <p class="price"><span>Rs.380.00</span></p>
                            </div>
                        </div>
                        <div class="bottom-area d-flex px-3">
                            <div class="m-auto d-flex">
                                <form method="get" action="AddToCart">
                                    <input type="hidden" name="id" value="22">
                                    <input type="hidden" name="name" value="Chicken Strips (6)">
                                    <input type="hidden" name="price" value="380">
                                    <input type="hidden" name="quantity" value="1">
                                      <input type="hidden" name="image" value="images/cart/22.webp">
                                    <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 ftco-animate">
                <div class="product">
                    <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/23.webp" alt="Colorlib Template">
                        <div class="overlay"></div>
                    </a>
                    <div class="text py-3 pb-4 px-3 text-center">
                        <h3><a href="#">Chocolate Muffins</a></h3>
                        <div class="d-flex">
                            <div class="pricing">
                                <p class="price"><span>Rs.200.00</span></p>
                            </div>
                        </div>
                        <div class="bottom-area d-flex px-3">
                            <div class="m-auto d-flex">
                                <form method="get" action="AddToCart">
                                    <input type="hidden" name="id" value="23">
                                    <input type="hidden" name="name" value="Chocolate Muffins">
                                    <input type="hidden" name="price" value="200">
                                    <input type="hidden" name="quantity" value="1">
                                      <input type="hidden" name="image" value="images/cart/23.webp">
                                    <input type="submit" class="btn btn-primary mx-1" value="Add to cart"></input>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</section>
<hr>

<jsp:include page="includes/footer.jsp" />


<!-- loader -->
<jsp:include page="includes/loader.jsp" />

</body>
</html>
</body>
</html>
