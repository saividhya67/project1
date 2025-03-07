<%@ page import="com.example.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Details</title>
    <style>
        .product-details {
            width: 50%;
            margin: 0 auto;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 10px;
        }
        .product-details img {
            max-width: 100%;
            height: auto;
        }
        .product-details h2 {
            margin: 0 0 10px;
        }
        .product-details p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <div class="product-details">
        <%
            Product product = (Product) request.getAttribute("product");
            if (product != null) {
        %>
            <h2><%= product.getName() %></h2>
            <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
            <p><strong>Category:</strong> <%= product.getCategory() %></p>
            <p><strong>Price:</strong> $<%= product.getPrice() %></p>
        <%
            } else {
        %>
            <p>Product not found.</p>
        <%
            }
        %>
    </div>
</body>
</html>
