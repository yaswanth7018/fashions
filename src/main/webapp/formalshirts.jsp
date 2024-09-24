<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- ====== Favicon ====== -->
    <link
      rel="shortcut icon"
      href="images/favicon-32x32.png"
      type="image/png"
    />
    <!-- ====== Boxicons ====== -->
    <link
      href="https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css"
      rel="stylesheet"
    />
    <!-- ====== Swiper CSS ====== -->
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />
    <!-- ====== Custom CSS ====== -->
    <link rel="stylesheet" href="css/styles.css" />
    <title>Fashion Shop</title>
  </head>
  <body>
    <!-- ====== Header ====== -->
    <header class="header">
      <!-- ====== Navigation ====== -->
   <%@ include file="navbar.jsp" %> 
   
      
    </header>
  

    <!-- ====== Categories ====== -->
    <section class="section categories">
      <div class="title">
        <span>CATEGORIES MEN</span>
      </div>
<%@ page import="java.util.*" %>
<%@ page import="com.fashion.model.Products" %>

<%-- Assuming you have a List of Products named 'products' --%>
<% List<Products> products = (List<Products>) request.getAttribute("products"); %>

<%-- Check if the 'products' list is not empty --%>
<% if (products != null && !products.isEmpty()) { %>
    <div class="products container" style="display: flex; flex-wrap: wrap;">
        <% for (Products product : products) { %>
        <% String s = product.getGender();%>
        <% String c = product.getCategory();%>
        <%if(s.equals("Men") && c.equals("formalshirts")) {%>
            <div class="product" style="display: inline-block; margin: 10px;">
                <div class="top d-flex">
                    
                    <% if (product.getImage() != null){ %>
                        <img src="data:image/jpeg;base64, <%= Base64.getEncoder().encodeToString(product.getImage()) %>" alt="<%= product.getName() %> Image" />
                    <% } else { %>
                        <img src="" alt="">
                    <% } %>
                    <div class="icon d-flex">
                        <i class="bx bxs-heart"></i>
                    </div>
                </div>
                <div class="bottom">
                    <div class="d-flex">
                        <h4><%= product.getName()%></h4><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        
                                   <form action="/add-to-cart" method="post">
    <input type="hidden" name="productId" value="<%= product.getId() %>" />
     <input type="hidden" name="returnUrl" value="<%= request.getRequestURI() %>" />
    <button type="submit" class="btn cart-btn">Add to Cart</button>
</form>
                    </div>
                    <div class="d-flex">
                        <div class="price">&#8377;<%= product.getPrice() %></div>
                        <div class="rating">
                            <i class="bx bxs-star"></i>
                            <i class="bx bxs-star"></i>
                            <i class="bx bxs-star"></i>
                            <i class="bx bxs-star"></i>
                            <i class="bx bxs-star"></i>
                        </div>
                    </div>
                </div>
            </div>
        <% } }%>
    </div>
<% } else { %>
    <p>No products available.</p>
<% } %>


      <div class="button d-flex">
        <a class="btn loadmore">Load More</a>
      </div>
    </section>

    <!-- ====== SwiperJs ====== -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- ====== Custom Script ====== -->
    <script src="./js/product.js"></script>
    <script src="./js/main.js"></script>
  </body>
</html>
