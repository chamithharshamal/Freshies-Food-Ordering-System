<%@page import="freshies.connection.DbConnection"%>
<%@page import="freshies.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="freshies.dao.ProductsDao"%>
<%@page import="freshies.model.User"%>
<%@page import="freshies.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="freshies.dao.MealsDao, freshies.model.Meal" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop</title>
        <jsp:include page="includes/header.jsp" />
    </head>

    <%
        User auth = (User) request.getSession().getAttribute("auth");
        if (auth != null) {
            request.setAttribute("person", auth);
        }
        ProductsDao pd = new ProductsDao(DbConnection.getConnection());
        List<Product> products = pd.getAllProducts();
        ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
        if (cart_list != null) {
            request.setAttribute("cart_list", cart_list);
        }
        MealsDao mealsDao = new MealsDao();
        List<Meal> breakfastMeals = mealsDao.getMealsByCategory("Breakfast");
        List<Meal> lunchMeals = mealsDao.getMealsByCategory("Lunch");
        List<Meal> dinnerMeals = mealsDao.getMealsByCategory("Dinner");
        List<Meal> snackMeals = mealsDao.getMealsByCategory("Snack");
    %>

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
            <h2 class="mb-4"><b>Breakfast</b></h2>
            <div class="row">
                <% for (Meal meal : breakfastMeals) {%>
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="product">
                        <a href="#" class="img-prod"><img class="img-fluid" src="<%= meal.getImage()%>" alt="<%= meal.getName()%>">
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3 text-center">
                            <h3><a href="#"><%= meal.getName()%></a></h3>
                            <div class="d-flex">
                                <div class="pricing">
                                    <p class="price"><span>Rs.<%= meal.getPrice()%></span></p>
                                </div>
                            </div>
                            <div class="bottom-area d-flex px-3">
                                <div class="m-auto d-flex">
                                    <form method="get" action="AddToCart">
                                        <input type="hidden" name="id" value="<%= meal.getId()%>">
                                        <input type="hidden" name="name" value="<%= meal.getName()%>">
                                        <input type="hidden" name="price" value="<%= meal.getPrice()%>">
                                        <input type="hidden" name="quantity" value="1">
                                        <input type="hidden" name="image" value="<%= meal.getImage()%>">
                                        <input type="submit" class="btn btn-primary mx-1" value="Add to cart">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </section>
    <hr>
        <hr>
    <section id="Breakfast" class="ftco-section1">
        <div class="container">
            <h2 class="mb-4"><b>Lunch</b></h2>
            <div class="row">
                <% for (Meal meal : lunchMeals) {%>
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="product">
                        <a href="#" class="img-prod"><img class="img-fluid" src="<%= meal.getImage()%>" alt="<%= meal.getName()%>">
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3 text-center">
                            <h3><a href="#"><%= meal.getName()%></a></h3>
                            <div class="d-flex">
                                <div class="pricing">
                                    <p class="price"><span>Rs.<%= meal.getPrice()%></span></p>
                                </div>
                            </div>
                            <div class="bottom-area d-flex px-3">
                                <div class="m-auto d-flex">
                                    <form method="get" action="AddToCart">
                                        <input type="hidden" name="id" value="<%= meal.getId()%>">
                                        <input type="hidden" name="name" value="<%= meal.getName()%>">
                                        <input type="hidden" name="price" value="<%= meal.getPrice()%>">
                                        <input type="hidden" name="quantity" value="1">
                                        <input type="hidden" name="image" value="<%= meal.getImage()%>">
                                        <input type="submit" class="btn btn-primary mx-1" value="Add to cart">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </section>
    <hr>
        <hr>
    <section id="Breakfast" class="ftco-section1">
        <div class="container">
            <h2 class="mb-4"><b>Dinner</b></h2>
            <div class="row">
                <% for (Meal meal : dinnerMeals) {%>
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="product">
                        <a href="#" class="img-prod"><img class="img-fluid" src="<%= meal.getImage()%>" alt="<%= meal.getName()%>">
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3 text-center">
                            <h3><a href="#"><%= meal.getName()%></a></h3>
                            <div class="d-flex">
                                <div class="pricing">
                                    <p class="price"><span>Rs.<%= meal.getPrice()%></span></p>
                                </div>
                            </div>
                            <div class="bottom-area d-flex px-3">
                                <div class="m-auto d-flex">
                                    <form method="get" action="AddToCart">
                                        <input type="hidden" name="id" value="<%= meal.getId()%>">
                                        <input type="hidden" name="name" value="<%= meal.getName()%>">
                                        <input type="hidden" name="price" value="<%= meal.getPrice()%>">
                                        <input type="hidden" name="quantity" value="1">
                                        <input type="hidden" name="image" value="<%= meal.getImage()%>">
                                        <input type="submit" class="btn btn-primary mx-1" value="Add to cart">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </section>
    <hr>
        <hr>
    <section id="Breakfast" class="ftco-section1">
        <div class="container">
            <h2 class="mb-4"><b>Snacks</b></h2>
            <div class="row">
                <% for (Meal meal : snackMeals) {%>
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="product">
                        <a href="#" class="img-prod"><img class="img-fluid" src="<%= meal.getImage()%>" alt="<%= meal.getName()%>">
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3 text-center">
                            <h3><a href="#"><%= meal.getName()%></a></h3>
                            <div class="d-flex">
                                <div class="pricing">
                                    <p class="price"><span>Rs.<%= meal.getPrice()%></span></p>
                                </div>
                            </div>
                            <div class="bottom-area d-flex px-3">
                                <div class="m-auto d-flex">
                                    <form method="get" action="AddToCart">
                                        <input type="hidden" name="id" value="<%= meal.getId()%>">
                                        <input type="hidden" name="name" value="<%= meal.getName()%>">
                                        <input type="hidden" name="price" value="<%= meal.getPrice()%>">
                                        <input type="hidden" name="quantity" value="1">
                                        <input type="hidden" name="image" value="<%= meal.getImage()%>">
                                        <input type="submit" class="btn btn-primary mx-1" value="Add to cart">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <% }%>
            </div>
        </div>
    </section>
    <hr>

    <jsp:include page="includes/footer.jsp" />
    <jsp:include page="includes/loader.jsp" />

</body>
</html>
</body>
</html>
