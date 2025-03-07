<%@page import="com.example.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        response.sendRedirect("index.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }

    // Retrieve error message if exists
    String errorMessage = (String) request.getAttribute("errorMessage");
%>
<!DOCTYPE html>
<html>
<head>
<title>All gifts-login</title>
<link rel="stylesheet" href="style.css">
<style>
.login-container{
margin-top:200px;
}
body{
background-image: url('Lback.jpg');
}
.search-bar button {
    padding: 6px 12px;
    border: none;
    background-color: #f0f0f0;
    color: #333;
    border-radius: 0 4px 4px 0;
    cursor: pointer;
    margin-inline-end: 40px;
}
.search-bar button:hover {
    background-color: #e91e63;
    color: white;
}

.login-container {
    max-width: 400px;
    margin: 40px auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    background: rgba(255, 255, 255, 0.8); /* Add a semi-transparent white background for readability */
}
.login-container {
    padding: 20px;
    margin-top:200px;
}
h2 {
    margin-top: 0;
    text-align: center;
}
.input-container {
    position: relative;
    width: 100%; /* Ensure the input container takes the full width */
    margin-bottom: 20px;
}

.icon {
    position: absolute;
    left: 10px;
    top: 50%;
    transform: translateY(-50%);
    color: #999;
}

input[type="email"], input[type="password"] {
    padding: 10px 10px 10px 40px; /* Adjust padding to make room for the icon */
    border: 1px solid #ccc;
    border-radius: 5px;
    width: 100%; /* Ensure the input field takes the full width */
    box-sizing: border-box; /* Ensure padding is included in the width calculation */
}
input[type="password"] {
    padding: 10px 10px 10px 40px; /* Adjust padding to make room for the icon */
    border: 1px solid #ccc;
    border-radius: 5px;
    width: 100%; /* Ensure the input field takes the full width */
    box-sizing: border-box; /* Ensure padding is included in the width calculation */
}


button[type="submit"],
button[type="button"],
button.google-login {
    background-color: #ff1493; /* Set the button to thick pink */
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    width: 100%; /* Ensure the buttons take the full width */
    margin-bottom: 10px;
}

button[type="submit"]:hover {
    background-color: #d01378; /* Darker shade of pink for hover */
}

.or {
    display: flex;
    justify-content: center;
    margin: 20px 0;
}

.or span {
    font-size: 14px;
    color: #666;
}

button.google-login {
    background-color: #4285F4;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 10px;
}

button.google-login:hover {
    background-color: #357ae8;
}

button.google-login i {
    font-size: 16px;
}


</style>
</head>
<body>
	<%@include file="/includes/head.jsp"%>
	<div class="container">
        <div class="login-container">
            <h2>Login</h2>
            <% if (errorMessage != null) { %>
                <div class="error-message"><%= errorMessage %></div>
            <% } %>
            <form action="user-login" method="POST">
                <div class="input-container">
                    <i class="fas fa-user icon"></i>
                    <input type="email" name="login-email" class="form-control" id="email" placeholder="Email ID / Mobile Number" required>
                </div>
                <div class="input-container">
                    <i class="fas fa-lock icon"></i>
                    <input type="password" name="login-password" class="form-control" id="password" placeholder="Password" required>
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
                <a href="register.jsp"><button type="button" class="btn btn-primary">Register</button></a>
                <p>By continuing, you agree to Winni Terms of Use and Privacy Policy.</p>
                <div class="or">
                    <span>------------Or-----------</span>
                </div>
                <button type="button" class="google-login">
                    <i class="fab fa-google"></i> Continue with Google
                </button>
            </form>
        </div>
    </div>
	<%@include file="/includes/footer.jsp"%>
</body>
</html>
