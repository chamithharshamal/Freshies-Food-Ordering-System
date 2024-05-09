<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.net.*" %>

<%
  HttpSession sessionn = request.getSession();
  int cartCount = 0;

  if(session.getAttribute("cart") != null && !((Map<String, Integer>)session.getAttribute("cart")).isEmpty()) {
      Map<String, Integer> cart = (Map<String, Integer>)session.getAttribute("cart");
      for (Map.Entry<String, Integer> entry : cart.entrySet()) {
          cartCount += entry.getValue();
      }
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
        <jsp:include page="includes/header.jsp" />
   
</head>
<body class="goto-here">
      <jsp:include page="includes/navBar.jsp" />
  

    <div class="hero-wrap hero-bread"
        style="background-image: url('images/contact.jpg');">
        <div class="container">
            <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <p class="breadcrumbs"><span class="mr-2"></span></p>
                    <h1 class="mb-0 bread">Contact us</h1>
                </div>
            </div>
        </div>
    </div>

    <section class="ftco-section contact-section bg-light">
        <div class="container">
            <div class="row d-flex mb-5 contact-info">
                <div class="w-100"></div>
                <div class="col-md-3 d-flex">
                    <div class="info bg-white p-4">
                        <p><span>Address:</span> <a href="#">203 Fussels's Lane, Complex 0060,Colombo, Sri Lanka</a>
                        </p>
                    </div>
                </div>
                <div class="col-md-3 d-flex">
                    <div class="info bg-white p-4">
                        <p><span>Phone:</span> <a href="tel://1234567920">+94 112 924106</a></p>
                    </div>
                </div>
                <div class="col-md-3 d-flex">
                    <div class="info bg-white p-4">
                        <p><span>Email:</span> <a href="mailto:info@yoursite.com">freshies@gmail.com</a></p>
                    </div>
                </div>
                <div class="col-md-3 d-flex">
                    <div class="info bg-white p-4">
                        <p><span>Website: </span> <a href="#">Freshies.com</a></p>
                    </div>
                </div>
            </div>
            <div class="row block-9">
                <div class="col-md-6 order-md-last d-flex">
                    <form action="#" class="bg-white p-5 contact-form">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Your Name">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Your Email">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Subject">
                        </div>
                        <div class="form-group">
                            <textarea name="" id="" cols="30" rows="7" class="form-control"
                                placeholder="Message"></textarea>
                        </div>
                        <div class="form-group">
                            <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
                        </div>
                    </form>

                </div>

                <div class="col-md-6 d-flex">
                    <div class="bg-white">
                        <div
                            style="overflow:hidden;resize:none;max-width:100%;width:500px;height:500px;">
                            <div id="g-mapdisplay"
                                style="height:100%; width:100%; max-width:100%;"><iframe
                                    style="height:100%;width:100%;border:0;"
                                    frameborder="0"
                                    src="https://www.google.com/maps/embed/v1/place?q=nsbm&key=AIzaSyBFw0Qbyq9zTFTd-tUY6dZWTgaQzuU17R8"></iframe>
                            </div>
                            <a class="google-map-html" rel="nofollow"
                                href="https://www.bootstrapskins.com/themes"
                                id="grab-map-data">premium bootstrap themes</a><style>#g-mapdisplay
                                img {
                                max-width:none!important;
                                background:none!important;
                                font-size: inherit;
                                font-weight:inherit;
                                }
                            </style>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <hr>
     <footer class="ftco-footer ftco-section">
			<div class="container">
			  <div class="row mb-5">
				<div class="col-md">
				  <div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">Freshies</h2>
					<p>Where Every Bite Brings Fresh Delights!</p>
					<ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
					  <li class=""><a href="https://twitter.com"><span class="icon-twitter"></span></a></li>
					  <li class=""><a href="https://www.facebook.com/login/"><span class="icon-facebook"></span></a></li>
					  <li class=""><a href="https://www.instagram.com/accounts/login/?hl=en"><span class="icon-instagram"></span></a></li>
					</ul>
				  </div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
					  <h2 class="ftco-heading-2">Menu</h2>
					  <ul class="list-unstyled">
						<li><a href="meals.php" class="py-2 d-block">Shop</a></li>
						<li><a href="about.php" class="py-2 d-block">About</a></li>
						<li><a href="contact.php" class="py-2 d-block">Contact Us</a></li>
					  </ul>
					</div>
				  </div>
				  <div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Question?</h2>
						<div class="block-23 mb-3">
						  <ul>
							<li class="mb-3"><span class="icon icon-map-marker"></span><span class="text">203 Fussels's Lane, Complex 0060,Colombo, Sri Lanka</span></li>
							<li class="mb-3"><span class="icon icon-phone"></span><span class="text">+94 112 924106</span></li>
							<li class="mb-3"><span class="icon icon-envelope"></span><span class="text">freshies@gmail.com</span></li>
						  </ul>
						</div>
					</div>
				  </div>
				</div>
			  <div class="row">
				<div class="col-md-12 text-center">
				  <p>
				   Copyright &copy;All rights reserved | by <a href="#" target="_blank">Freshies</a>
				  </p>
				</div>
			  </div>
			</div>
		  </footer>
    
  

 
  <jsp:include page="includes/loader.jsp" />
    
  </body>
</html>