<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
     <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    />
     <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    />
     <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    />
    <!-- ====== Custom CSS ====== -->
    <link rel="stylesheet" href="css/styles.css" />
    <title>Fashion Shop</title>
    <style>

    </style>
  </head>
<body>
  <header class="header">
      <!-- ====== Navigation ====== -->
   <%@ include file="navbar.jsp" %> 
   
      <!-- ====== Hero Area ====== -->
    
    </header>
      <%@ page import="java.util.*" %>
        <%@ page import="com.fashion.model.Orders" %>
        <% List<Orders> cartitm = (List<Orders>) request.getAttribute("orders"); %>
        <% if (cartitm != null && !cartitm.isEmpty()) { %>
<section class=" gradient-custom">
  <div class="container ">
    <div class="row d-flex justify-content-center align-items-center ">
      <div class="col-lg-12 ">
        <div class="card" style="border-radius: 10px;">
        
          <div class="card-body p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
              <p class="lead fw-normal mb-0" style="color: #a8729a;">Orders</p>
            
            </div>
            
             <% for (Orders itm : cartitm) { %>
            <div class="card shadow-0 border mb-4">
              <div class="card-body">
                <div class="row">
                  <div class="col-md-2">
                   <% if (itm.getImage() != null) { %>
                                                        <img src="data:image/jpeg;base64, <%= Base64.getEncoder().encodeToString(itm.getImage()) %>"
                                                            alt="<%= itm.getPname() %> Image" class="img-fluid rounded-3"
                                                            style="width: 65px;" />
                                                        <% } else { %>
                                                        <img src="" alt="">
                                                        <% } %>
                  </div>
                  <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                    <p class="text-muted mb-0"><%= itm.getPname() %></p>
                  </div>
                  <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                    <p class="text-muted mb-0 small"><%= itm.getGender() %></p>
                  </div>
                  <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                    <p class="text-muted mb-0 small"><%= itm.getDelivery_status() %></p>
                  </div>
                  <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                    <p class="text-muted mb-0 small">Qty: 1</p>
                  </div>
                  <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                    <p class="text-muted mb-0 small"><%= itm.getPrice() %></p>
                  </div>
                </div>
                <hr class="mb-4" style="background-color: #e0e0e0; opacity: 1;">
                <div class="row d-flex align-items-center">
                  <div class="col-md-2">
                    <p class="text-muted mb-0 small">Track Order</p>
                  </div>
                  <div class="col-md-10"> <div class="progress" style="height: 6px; border-radius: 16px;">
                    <% 
                    String deliveryStatus = itm.getDelivery_status();
                    int progressPercentage = 0;
                    String progressBarColor = "#a8729a"; // Default color

                    if (deliveryStatus.equals("placed")) {
                        progressPercentage = 25;
                    } else if (deliveryStatus.equals("shipped")) {
                        progressPercentage = 50;
                    } else if (deliveryStatus.equals("out for delivery")) {
                        progressPercentage = 75;
                    } else if (deliveryStatus.equals("delivered") || deliveryStatus.equals("canceled")) {
                        progressPercentage = 100;
                        if (deliveryStatus.equals("canceled")) {
                            progressBarColor = "red"; // Change color to indicate canceled
                        }
                    }
                    %>
                    <div class="progress-bar" role="progressbar"
                        style="width: <%= progressPercentage %>%; border-radius: 16px; background-color: <%= progressBarColor %>;"
                        aria-valuenow="<%= progressPercentage %>" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                    <div class="d-flex justify-content-around mb-1">
                    <p class="text-muted mt-1 mb-0 small ms-xl-5">Placed</p>
                     <p class="text-muted mt-1 mb-0 small ms-xl-5">Shipped</p>
                      <p class="text-muted mt-1 mb-0 small ms-xl-5">Out for delivary</p>
                      <p class="text-muted mt-1 mb-0 small ms-xl-5">Delivered</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
             <% } %>
            
           

        </div>
      </div>
    </div>
  </div>
</section>
  <% } else{%>
        <div class="col-md">
        
        <h5 class="mb-3" style="background:white;"><a href="/" class="text-body"><i
                                            class="fas fa-long-arrow-alt-left me-2"></i>Continue shopping</a></h5>
                                    
        <img src="./images/empty carts.png" width="100%;" style="margin-top:-20px;"></div>
       <%} %>
</body>
</html>