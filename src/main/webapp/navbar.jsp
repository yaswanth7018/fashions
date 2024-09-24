<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <!-- Font Awesome -->
    <link
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
        rel="stylesheet"
    />
    <!-- Google Fonts -->

    <!-- Option 1: Include in HTML -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <style>
        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content a {
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="row container d-flex">
            <div class="col col-2">
                <img alt="" src="./images/logo.png" style="width:200px; height:70px">
            </div>

            <div class="nav-list d-flex">
                <a href="/">Home</a>
                
                 <div class="dropdown">
                 <a href="/men">Men</a>
                        <div class="dropdown-content">
                            <a href="/tshirts">T-Shirts</a>
                            <a href="/casulaShirts">Casual Shirts</a>
                             <a href="/formalshirts">Formal Shirts</a>
                              <a href="/sweatshirts">SweatShirts</a>
                               <a href="/jackets">Jackets</a>
                                <a href="/jeens">Jeens&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                 <a href="/causaltrousera">Causal Trousers</a>
                                  <a href="/trackjoggers">Traack Pants & Joggers</a>
                              
                               
                        </div>
                    </div>
                    
                <div class="dropdown">
                 <a href="/men">Women</a>
                        <div class="dropdown-content">
                            <a href="/kurtas">kurtas & Suits</a>
                            <a href="/sarees">Sarees     &</a>
                             <a href="/skirts">Skirts</a>
                              <a href="/womensweatshirts">SweatShirts</a>
                               <a href="/womenjackets">Jackets</a>
                                <a href="/wjeens">Jeens&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                 <a href="/dress">Dress</a>
                                  <a href="/ethnicware">Ethnic Ware</a>
                              
                               
                        </div>
                    </div>
                <a href="">Today Offers</a>
                <a href="">Designer?</a>
            </div>

            <div class="icons d-flex">
                <div class="icon d-flex"><i class="bx bx-search"></i></div>
                <% String message = (String)request.getAttribute("ename"); %>
                <% if (message != null) { %>
                    <span>Hi ${ename} .</span>
                     <div class="dropdown">
                        <i class="fas fa-user-large"></i>
                        <div class="dropdown-content">
                            <a href="/account">Account</a>
                            <a href="/myorders">Order</a>
                            <a href="/logout">Logout</a>
                        </div>
                    </div>
      <a href="/cart">
      <span>&nbsp;&nbsp;</span>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
            </svg>
            <%@ page import="java.util.*" %>
<%@ page import="com.fashion.model.Cart" %>
<% List<Cart> products = (List<Cart>) request.getAttribute("cartItems");
      int i = 0; // Start at 0
      %>
            <span id="cart-count">${cartcount}</span>
        </a>          <% } else { %>
                    <a href="/login">Login</a>
                <% } %>
            </div>

            <!-- Hamburger -->
            <div class="hamburger">
                <i class="bx bx-menu-alt-right"></i>
            </div>
        </div>
    </nav>
</body>
</html>
