<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.css" rel="stylesheet" />
    <style>
        @media (min-width: 1025px) {
            .h-custom {
                height: 100vh !important;
            }
        }
    </style>
</head>

<body>
    <section class="h-100 h-custom" style="background-color: #eee;">
        <%@ page import="java.util.*" %>
        <%@ page import="com.fashion.model.Cart" %>
        <%long total=0; %>
        <% List<Cart> cartitm = (List<Cart>) request.getAttribute("cartitems"); %>
        <% if (cartitm != null && !cartitm.isEmpty()) { %>
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col">
                    <div class="card">
                        <div class="card-body p-4">
                            <div class="row">
                                <div class="col-lg-7">
                                    <h5 class="mb-3"><a href="/" class="text-body"><i
                                            class="fas fa-long-arrow-alt-left me-2"></i>Continue shopping</a></h5>
                                    <hr>
                                    <div class="d-flex justify-content-between align-items-center mb-4">
                                        <div>
                                            <p class="mb-1">Shopping cart</p>
                                            <p class="mb-0">You have <%= cartitm.size() %> items in your cart</p>
                                        </div>
                                        <div>
                                            <p class="mb-0"><span class="text-muted">Sort by:</span> <a href="#!"
                                                    class="text-body">price <i class="fas fa-angle-down mt-1"></i></a></p>
                                        </div>
                                    </div>
                                    <% for (Cart itm : cartitm) { %>
                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between">
                                                <div class="d-flex flex-row align-items-center">
                                                    <div>
                                                        <% if (itm.getImage() != null) { %>
                                                        <img src="data:image/jpeg;base64, <%= Base64.getEncoder().encodeToString(itm.getImage()) %>"
                                                            alt="<%= itm.getName() %> Image" class="img-fluid rounded-3"
                                                            style="width: 65px;" />
                                                        <% } else { %>
                                                        <img src="" alt="">
                                                        <% } %>
                                                    </div>
                                                    <div class="ms-3">
                                                        <h5><%= itm.getName() %></h5>
                                                        <p class="small mb-0"><%= itm.getCategory() %>,<%= itm.getGender() %></p>
                                                    </div>
                                                </div>
                                                <div class="d-flex flex-row align-items-center">
                                                    <div style="width: 50px;">
                                                        <h5 class="fw-normal mb-0"></h5>
                                                    </div>
                                                    <div style="width: 80px;">
                                                        <h5 class="mb-0"><%= itm.getPrice() %></h5>
                                                        <% total+=Long.parseLong(itm.getPrice()); %>
                                                    </div>
                                                    <a href="/deleteCartItem?id=<%= itm.getId() %>" style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <% } %>
                                </div>
                                <div class="col-lg-5">
                                    <div class="card bg-primary text-white rounded-3">
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between">
                                                <p class="mb-2">Subtotal</p>
                                                <p class="mb-2">&#8377;<%=total %> </p>
                                                <%total +=20; %>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <p class="mb-2">Shipping</p>
                                                <p class="mb-2">&#8377;40.00</p>
                                            </div>
                                            <div class="d-flex justify-content-between mb-4">
                                                <p class="mb-2">Total (Incl. taxes)</p>
                                                <p class="mb-2">&#8377;<%=total %></p>
                                            </div>
                                              <form action="orderaddress" method="post">
                                <input type="hidden" name="cartitems" value="<%= cartitm %>" />
                                <input type="hidden" name="totalPrice" value="<%= total %>" />
                                <button type="submit" class="btn btn-info btn-block btn-lg">
                                    <div class="d-flex justify-content-between">
                                        <span>&#8377;<%= total %></span>
                                        <span>Checkout <i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                                    </div>
                                </button>
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
        <% } else{%>
        <div class="col-md">
        
        <h5 class="mb-3" style="background:white;"><a href="/" class="text-body"><i
                                            class="fas fa-long-arrow-alt-left me-2"></i>Continue shopping</a></h5>
                                    
        <img src="./images/empty carts.png" width="100%;" style="margin-top:-20px;"></div>
       <%} %>
    </section>
    <!-- MDB -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.js"></script>
</body>
</html>
