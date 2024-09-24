<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
</head>
<body>
    <h1>Product List</h1>
<%@ page import="java.util.*" %>
<%@ page import="com.fashion.model.Products" %>

<%-- Assuming you have a List of Products named 'products' --%>
<% List<Products> products = (List<Products>) request.getAttribute("products"); %>

<%-- Check if the 'products' list is not empty --%>
<% if (products != null && !products.isEmpty()) { %>
    <h1>Product List</h1>
    <% for (Products product : products) { %>
        <div>
            <h2><%= product.getName() %></h2>
            <p><%= product.getDis() %></p>
            <p>Price: <%= product.getPrice() %></p>
            <p>Quantity: <%= product.getQuantity() %></p>
            <p>Gender: <%= product.getGender() %></p>
            <p>Category: <%= product.getCategory() %></p>
            
            <!-- Display the image -->
            <% if (product.getImage() != null) { %>
                <img src="data:image/jpeg;base64, <%= Base64.getEncoder().encodeToString(product.getImage()) %>" alt="<%= product.getName() %> Image" />
            <% } else { %>
                <p>No image available</p>
            <% } %>
        </div>
    <% } %>
<% } else { %>
    <p>No products available.</p>
<% } %>
</body>
</html>
