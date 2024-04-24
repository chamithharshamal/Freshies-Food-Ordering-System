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
        <title>Freshies</title>
         <jsp:include page="includes/header.jsp" />
    </head>
    <body>
        
        <jsp:include page="includes/navBar.jsp" />
        
        <section id="home-section" class="hero">
            <div class="home-slider owl-carousel">
                <div class="slider-item" style="background-image: url(images/bg_6.jpg);">
                    <div class="overlay"></div>
                    <div class="container">
                        <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

                            <div class="col-md-12 ftco-animate text-center">
                                <h1 class="mb-2">We serve yummy meals to your door step</h1>
                                <h2 class="subheading mb-4">Freshies- Where Every Bite Brings Fresh Delights!"</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="slider-item" style="background-image: url(images/bg_8.jpg);">
                    <div class="overlay"></div>
                    <div class="container">
                        <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

                            <div class="col-sm-12 ftco-animate text-center">
                                <h1 class="mb-2">100% fresh foods</h1>
                                <h2 class="subheading mb-4">Freshies- Where Every Bite Brings Fresh Delights!"</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        &nbsp;&nbsp;&nbsp;&nbsp;


        <hr>
        <section class="ftco-section ftco-category ftco-no-pt">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-md-6 order-md-last align-items-stretch d-flex">
                                <div class="category-wrap-2 ftco-animate img align-self-stretch d-flex" style="background-image: url(images/12.avif);">
                                    <div class="text text-center">
                                        <h1>What are you craving for?</h1>
                                        <p>	Healthy meals for all of you</p>
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mealPlanModal">Build Meal Plan</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(images/break.avif);">
                                    <div class="text px-3 py-1">
                                        <h2 class="mb-0"><a href="./shop.jsp#Breakfast">Breakfast</a></h2>
                                    </div>
                                </div>
                                <div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url(images/lnch.jpeg);">
                                    <div class="text px-3 py-1">
                                        <h2 class="mb-0"><a href="./shop.jsp#Lunch">Lunch</a></h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(images/dinner.avif);">
                            <div class="text px-3 py-1">
                                <h2 class="mb-0"><a href="./shop.jsp#Dinner">Dinner</a></h2>
                            </div>		
                        </div>
                        <div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url(images/snacks.jpeg);">
                            <div class="text px-3 py-1">
                                <h2 class="mb-0"><a href="/shop.jsp#Snack">Snacks</a></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-3 pb-3">
                    <div class="col-md-12 heading-section text-center ftco-animate">
                        <span class="subheading">Featured Products</span>
                        <h2 class="mb-4">Savor Every Bite: Don't miss</h2>
                        <p>Tempting Treats Await- Don't miss out on our delectable dishes!</p>
                    </div>
                </div>   		
            </div>
            <div class="container">
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
                                            <input type="submit" class="btn btn-primary mx-1" value="Add to cart">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
                                            <input type="submit" class="btn btn-primary mx-1" value="Add to cart">
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
                                            <input type="submit" class="btn btn-primary mx-1" value="Add to cart">
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="product">
                            <a href="#" class="img-prod"><img class="img-fluid" src="images/cart/11.webp" alt="Colorlib Template">

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
                                            <input type="submit" class="btn btn-primary mx-1" value="Add to cart">
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>	
                </div>
            </div>
        </section>

                
        <section class="ftco-section img" style="background-image: url(images/bg_14.jpg);">
            <div class="container">
                <div class="row justify-content-end">
                    <div class="col-md-6 heading-section ftco-animate deal-of-the-day ftco-animate">
                        <span class="subheading">Today's special</span>
                        <h2 class="mb-4">20% Discount when ordering two dinner meals</h2>
                        <p>Pair your discounted dinner meals with our chef's special dessert for the perfect ending to your dining experience!</p>
                    </div>
                </div>   		
            </div>
        </section>    
      
        <hr>
        <jsp:include page="includes/footer.jsp" />

        <!-- loader -->
       <jsp:include page="includes/loader.jsp" />
        <!-- Modal -->
        <div class="modal fade" id="mealPlanModal" tabindex="-1" role="dialog" aria-labelledby="mealPlanModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="mealPlanModalLabel">Build Your Meal Plan</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="mealPlanForm">
                            <div id="hidhid">
                                <div class="form-group">
                                    <label for="mealType">Select Meal Type:</label>
                                    <select class="form-control" id="mealType" name="mealType">
                                        <option value="breakfast">Breakfast</option>
                                        <option value="lunch">Lunch</option>
                                        <option value="dinner">Dinner</option>
                                        <option value="snack">Snack</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="mealCategory">Select Meal Category:</label>
                                    <select class="form-control" id="mealCategory" name="mealCategory">
                                        <option value="vegetarian">vegetarian</option>
                                        <option value="nonVegetarian">non-Vegetarian</option>
                                    </select>
                                </div></div>
                            <button class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>document.addEventListener("DOMContentLoaded", function () {
                var mealTypeSelect = document.getElementById('mealType');
                var mealCategorySelect = document.getElementById('mealCategory');

                mealTypeSelect.addEventListener('change', function () {
                    if (mealTypeSelect.value === 'snack') {
                        mealCategorySelect.style.display = 'none';
                    } else {
                        mealCategorySelect.style.display = 'block';
                    }
                });

                document.getElementById('mealPlanForm').addEventListener('submit', function (event) {
                    event.preventDefault();

                    var mealType = mealTypeSelect.value;
                    var mealCategory = mealCategorySelect.value;
                    var url;

                    if (mealType === 'breakfast') {
                        if (mealCategory === 'vegetarian') {
                            url = 'meals.jsp#breakveg';
                        } else {
                            url = 'meals.jsp#breaknonveg';
                        }
                    } else if (mealType === 'lunch') {
                        if (mealCategory === 'vegetarian') {
                            url = 'meals.jsp#lunchveg';
                        } else {
                            url = 'meals.jsp#lunchnonveg';
                        }
                    } else if (mealType === 'dinner') {
                        if (mealCategory === 'vegetarian') {
                            url = 'meals.jsp#dinnerveg';
                        } else {
                            url = 'meals.jsp#dinnernonveg';
                        }
                    } else if (mealType === 'snack') {
                        url = 'meals.jsp#Snack';
                    }

                    window.location.href = url;
                });
            });

        </script>
    </body>
</html>

