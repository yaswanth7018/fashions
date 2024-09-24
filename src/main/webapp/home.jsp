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
    <style>
    /* Style for the chatbot container */
.chatbot {
  position: fixed;
  bottom: 20px;
  right: 20px;
  width: 300px;
  background-color: #fff;
  border: 1px solid #ccc;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

/* Style for the chat header */
.chat-header {
  background: linear-gradient(to bottom, #ff5151 50%, #ff5e3a);;
  color: #fff;
  padding: 10px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

/* Style for the close chat button */
.close-chat {
  cursor: pointer;
  font-weight: bold;
  font-size: 20px;
  margin-right: 10px;
}

/* Style for the chat messages */
.chat-box {
  height: 200px;
  overflow-y: scroll;
  padding: 10px;
}

/* Style for chat input and send button */
.chat-input {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px;
}

/* Style for the user input field */
#userMessage {
  flex: 1;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 3px;
  margin-right: 10px;
}

/* Style for the send button */
#sendMessage {
  background: linear-gradient(to bottom, #ff5151 50%, #ff5e3a);;
  color: #fff;
  border: none;
  border-radius: 3px;
  padding: 5px 10px;
  cursor: pointer;
}

/* Style for chat messages */
.message {
  margin: 5px 0;
}

/* Additional styling can be added based on your design preferences */

/* Adjust font styles, colors, and sizes as needed */
/* Style for the chatbot trigger icon */
.chatbot-icon {
  position: fixed;
  bottom: 20px;
  right: 20px;
  background: linear-gradient(to bottom, #ff5151 50%, #ff5e3a);;
  color: #fff;
  border-radius: 50%;
  width: 50px;
  height: 50px;
  text-align: center;
  line-height: 50px;
  cursor: pointer;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

    
    </style>
  </head>
  <body>
    <!-- ====== Header ====== -->
    <header class="header">
      <!-- ====== Navigation ====== -->
   <%@ include file="navbar.jsp" %> 
   
      <!-- ====== Hero Area ====== -->
      <div class="hero">
        <div class="row container d-flex">
          <div class="col">
            <span class="subtitle">Limited Time Only For Winter</span>
            <h1>fash<span class="i">i</span>on</h1>
            <p>LOOK YOUR BEST ON YOUR BEST DAY</p>

            <button class="btn">Explore Now!</button>
          </div>
          <img src="./images/woman-in-cart.png" alt="" />
        </div>
      </div>
    </header>
    <!-- ====== Collection ====== -->
    <section class="section collection">
      <div class="title">
        <span>COLLECTION</span>
        <h2>Our Top Collection</h2>
      </div>
      <div class="filters d-flex">
        <div data-filter="Accessories">Accessories</div>
        <div data-filter="Dresses">Dresses</div>
        <div data-filter="Footwear">Footwear</div>
      </div>

      <div class="products container">
        <div class="swiper mySwiper">
          <div class="swiper-wrapper" id="products">
            <div class="swiper-slide">
              <!-- <div class="product">
                <div class="top d-flex">
                  <img src="./images/product-1.png" alt="" />
                  <div class="icon d-flex">
                    <i class="bx bxs-heart"></i>
                  </div>
                </div>
                <div class="bottom">
                  <h4>Nike Air Men’s Hoodie - Imported Hoodie Red</h4>
                  <div class="d-flex">
                    <div class="price">$150</div>
                    <div class="rating">
                      <i class="bx bxs-star"></i>
                      <i class="bx bxs-star"></i>
                      <i class="bx bxs-star"></i>
                      <i class="bx bxs-star"></i>
                      <i class="bx bxs-star"></i>
                    </div>
                  </div>
                </div>
              </div> -->
            </div>
          </div>
        </div>
        <div class="pagination">
          <div class="custom-pagination"></div>
        </div>
      </div>
    </section>

    <!-- ====== New Arrival ====== -->
    <section class="section new-arrival">
      <div class="title">
        <span>NEW ARRIVAL</span>
        <h2>Latest Collection</h2>
      </div>

      <div class="row container">
        <div class="col col-1">
          <img src="./images/poster-1.png" alt="" />
          <h3>
            2023 Trends <br />
            Women’s Smart Skirt
          </h3>
        </div>
        <div class="col col-2">
          <img src="./images/poster-2.png" alt="" />
          <h3>
            2023 Trends <br />
            Women’s Smart Skirt
          </h3>
        </div>
        <div class="col col-3">
          <img src="./images/poster-3.png" alt="" />
          <h3>
            2023 Trends <br />
            Women’s Smart Shirt <br />
            <span>Discover More:</span>
          </h3>
        </div>
      </div>
    </section>

    <!-- ====== Categories ====== -->
   
    <section class="section categories">
      <div class="title">
        <span>CATEGORIES</span>
        <h2>2023 Latest Collection</h2>
      </div>
<%@ page import="java.util.*" %>
<%@ page import="com.fashion.model.Products" %>
      <%-- Assuming you have a List of Products named 'products' --%>
      <% List<Products> products = (List<Products>) request.getAttribute("products");
      int i = 0; // Start at 0
      %>

      <%-- Check if the 'products' list is not empty --%>
      <% if (products != null && !products.isEmpty()) { %>
        <div class="products container" style="display: flex; flex-wrap: wrap;">
          <% for (Products product : products) { %>
            <% if (i < 6) { %> <!-- Display only 5 products -->
              <div class="product" style="display: inline-block; margin: 10px;">
                <div class="top d-flex">
                  <% if (product.getImage() != null) { %>
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
                    <h4><%= product.getName()%></h4><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <form action="/add-to-cart" method="post">
    <input type="hidden" name="productId" value="<%= product.getId() %>" />
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
              <% i++; %> <!-- Increment the counter -->
            <% } %>
          <% } %>
        </div>
      <% } else { %>
        <p>No products available.</p>
      <% } %>

      <div class="button d-flex">
        <a class="btn loadmore">Load More</a>
      </div>
      <div id="chatbot-icon" class="chatbot-icon">
  <i class="fas fa-comments"></i>
</div>
      <div id="chatbot" class="chatbot">
  <div class="chat-header">
    <h4>Chat with us</h4>
    <span class="close-chat" id="closeChat">X</span>
  </div>
  <div class="chat-box" id="chatBox">
  ${message}
  	<span style="">You:Hi</span><br>
    Bot: Welcome to Fashion Studio How Can I help You
    <br>
    You:Refund My Amount<br>
    Bot:Can You Provide Order Id<br>
    You:125533154552<br>
    Bot:Your Refund Will credit to bank with in 24hr
  </div>
  <div class="chat-input">
    <input type="text" id="userMessage" placeholder="Type your message..." />
    <button id="sendMessage">Send</button>
  </div>
</div>
      
    </section>

    <!-- ====== Statistics ====== -->
    <section class="section statistics">
      <div class="title">
        <span>STATS</span>
        <h2>Our Statistics</h2>
      </div>

      <div class="row container">
        <div class="col">
          <div class="icon">
            <i class="bx bxs-check-square"></i>
          </div>
          <h3>Easy Order System</h3>
          <p>Lorem Ispum is a placeholder text commomly used as a free text.</p>
        </div>
        <div class="col">
          <div class="icon">
            <i class="bx bxs-user"></i>
          </div>
          <h3>On Time Delievery</h3>
          <p>Lorem Ispum is a placeholder text commomly used as a free text.</p>
        </div>
        <div class="col">
          <div class="icon">
            <i class="bx bxs-dollar-circle"></i>
          </div>
          <h3>Money Back Gaurantee</h3>
          <p>Lorem Ispum is a placeholder text commomly used as a free text.</p>
        </div>
        <div class="col">
          <div class="icon">
            <i class="bx bxs-user"></i>
          </div>
          <h3>24/7 Customer Support</h3>
          <p>Lorem Ispum is a placeholder text commomly used as a free text.</p>
        </div>
      </div>
    </section>

    <!-- ====== Blogs ====== -->
    <section class="section blog">
      <div class="title">
        <span>BLOGS</span>
        <h2>Latest News</h2>
      </div>

      <div class="row container">
        <div class="col">
          <div class="top">
            <img src="./images/blog-1.png" alt="" />
          </div>
          <div class="bottom">
            <h3>Trendy</h3>
            <h4>
              Lorem Ispum is a placeholder text commomly used as a free text.
            </h4>
            <span>10 January 2023</span>
          </div>
        </div>
        <div class="col">
          <div class="top">
            <img src="./images/blog-2.png" alt="" />
          </div>
          <div class="bottom">
            <h3>Trendy</h3>
            <h4>
              Lorem Ispum is a placeholder text commomly used as a free text.
            </h4>
            <span>10 January 2023</span>
          </div>
        </div>
        <div class="col">
          <div class="top">
            <img src="./images/blog-3.png" alt="" />
          </div>
          <div class="bottom">
            <h3>Trendy</h3>
            <h4>
              Lorem Ispum is a placeholder text commomly used as a free text.
            </h4>
            <span>10 January 2023</span>
          </div>
        </div>
      </div>
    </section>

    <!-- ====== Footer ====== -->
    <footer class="footer">
      <div class="row container">
        <div class="col">
          <div class="logo d-flex">
            <img src="./images/logo.png" alt="logo" />
          </div>
          <p>
            Lorem ispum is a placeholder text <br />
            commonly used as a free text.
          </p>
          <div class="icons d-flex">
            <div class="icon d-flex">
              <i class="bx bxl-facebook"></i>
            </div>
            <div class="icon d-flex"><i class="bx bxl-twitter"></i></div>
            <div class="icon d-flex"><i class="bx bxl-instagram"></i></div>
            <div class="icon d-flex"><i class="bx bxl-youtube"></i></div>
          </div>
          <p class="color">
            Copyrights 2023 <br />
            @Kluniveristy
          </p>
        </div>
        <div class="col">
          <div>
            <h4>Product</h4>
            <a href="">Download</a>
            <a href="">Pricing</a>
            <a href="">Locations</a>
            <a href="">Server</a>
            <a href="">Countries</a>
            <a href="">Blog</a>
          </div>
          <div>
            <h4>Category</h4>
            <a href="">Men</a>
            <a href="">Women</a>
            <a href="">Kids</a>
            <a href="">Best Seller</a>
            <a href="">New Arrivals</a>
          </div>
          <div>
            <h4>My Account</h4>
            <a href="">My Account</a>
            <a href="">Discount</a>
            <a href="">Returns</a>
            <a href="">Order History</a>
            <a href="">Order Tracking</a>
          </div>
          <div>
            <h4>Contact Us</h4>
            <div class="d-flex">
              <div class="icon"><i class="bx bxs-map"></i></div>
              <span>123 Kl University Vijayawada, Andhra Pradesh, India</span>
            </div>
            <div class="d-flex">
              <div class="icon"><i class="bx bxs-envelope"></i></div>
              <span>fashion@gamil.com</span>
            </div>
            <div class="d-flex">
              <div class="icon"><i class="bx bxs-phone"></i></div>
              <span>+91 6281119113</span>
            </div>
          </div>
        </div>
      </div>
    </footer>

    <!-- ====== Login and Signup Form ====== -->
    <div class="user-form">
      <div class="close-form d-flex"><i class="bx bx-x"></i></div>
      <div class="form-wrapper container">
        <div class="user login">
          <div class="img-box">
            <img src="./images/login.svg" alt="" />
          </div>
          <div class="form-box">
            <div class="top">
              <p>
                Not a member?
                <span data-id="#ff0066">Register now</span>
              </p>
            </div>
            <form action="">
              <div class="form-control">
                <h2>Hello Again!</h2>
                <p>Welcome back you've been missed.</p>
                <input type="text" placeholder="Enter Username" />
                <div>
                  <input type="password" placeholder="Password" />
                  <div class="icon form-icon">
                    <!-- <img src="./images/eye.svg" alt="" /> -->
                  </div>
                </div>
                <span>Recovery Password</span>
                <input type="Submit" value="Login" />
              </div>
              <div class="form-control">
                <p>Or continue with</p>
                <div class="icons">
                  <div class="icon">
                    <img src="./images/search.svg" alt="" />
                  </div>
                  <div class="icon">
                    <img src="./images/apple.svg" alt="" />
                  </div>
                  <div class="icon">
                    <img src="./images/facebook.svg" alt="" />
                  </div>
                  <div class="icon">
                    <img src="./images/github.svg" alt="" />
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>

        <!-- Register -->
        <div class="user signup">
          <div class="form-box">
            <div class="top">
              <p>
                Already a member?
                <span data-id="#1a1aff">Login now</span>
              </p>
            </div>
            <form action="">
              <div class="form-control">
                <h2>Welcome Codevo!</h2>
                <p>It's good to have you.</p>
                <input type="email" placeholder="Enter Email" />
                <div>
                  <input type="password" placeholder="Password" />
                  <div class="icon form-icon">
                    <img src="./images/eye.svg" alt="" />
                  </div>
                </div>
                <div>
                  <input type="password" placeholder="Confirm Password" />
                  <div class="icon form-icon">
                    <img src="./images/eye.svg" alt="" />
                  </div>
                </div>
                <input type="Submit" value="Register" />
              </div>
              <div class="form-control">
                <p>Or continue with</p>
                <div class="icons">
                  <div class="icon">
                    <img src="./images/search.svg" alt="" />
                  </div>
                  <div class="icon">
                    <img src="./images/apple.svg" alt="" />
                  </div>
                  <div class="icon">
                    <img src="./images/facebook.svg" alt="" />
                  </div>
                  <div class="icon">
                    <img src="./images/github.svg" alt="" />
                  </div>
                </div>
              </div>
            </form>
          </div>
          <div class="img-box">
            <img src="./images/trial.svg" alt="" />
          </div>
        </div>
      </div>
    </div>
    <!-- ====== SwiperJs ====== -->
    <script>
 // chatbot.js
    document.addEventListener("DOMContentLoaded", function () {
      const chatbot = document.getElementById("chatbot");
      const chatBox = document.getElementById("chatBox");
      const userMessage = document.getElementById("userMessage");
      const sendMessageButton = document.getElementById("sendMessage");
      const closeChatButton = document.getElementById("closeChat");

      sendMessageButton.addEventListener("click", function () {
        const userText = userMessage.value;
        if (userText.trim() === "") return;

        // Display user message in the chat box
        displayMessage("You", userText);
        userMessage.value = ""; // Clear the input field

        // Here, you can process user's input, send it to a chatbot service, and handle responses
        // For a simple example, you can just reply immediately:
        const botResponse = "This is a chatbot response.";
        displayMessage("Chatbot", botResponse);
      });

      closeChatButton.addEventListener("click", function () {
        chatbot.style.display = "none";
      });

      function displayMessage(sender, text) {
    	  console.log(sender);
        const messageDiv = document.createElement("div");
        messageDiv.classList.add("message");
        messageDiv.innerHTML = `<strong>You:</strong>Hi`;
        chatBox.appendChild(messageDiv);
      }
    });
    document.addEventListener("DOMContentLoaded", function () {
    	  const chatbot = document.getElementById("chatbot");
    	  const chatbotIcon = document.getElementById("chatbot-icon");

    	  chatbotIcon.addEventListener("click", function () {
    	    chatbot.style.display = chatbot.style.display === "block" ? "none" : "block";
    	  });
    	});


    </script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- ====== Custom Script ====== -->
    <script src="./js/product.js"></script>
    <script src="./js/main.js"></script>
  </body>
</html>
