<%@page import="com.example.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		response.sendRedirect("login.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}

	String errorMessage = (String) request.getAttribute("errorMessage");
	String successMessage = (String) request.getAttribute("successMessage");
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>All gifts-Registration</title>
<style>
.card-body {
    margin-top: 170px;
}
.error-message {
    color: red;
    text-align: center;
    margin-bottom: 10px;
}
.success-message {
    color: green;
    text-align: center;
    margin-bottom: 10px;
}
</style>
<script>
function validateForm() {
    let name = document.forms["registrationForm"]["register-name"].value;
    let email = document.forms["registrationForm"]["register-email"].value;
    let password = document.forms["registrationForm"]["register-password"].value;
    let confirmPassword = document.forms["registrationForm"]["register-confirm-password"].value;

    if (name == "" || email == "" || password == "" || confirmPassword == "") {
        alert("All fields must be filled out");
        return false;
    }

    if (password !== confirmPassword) {
        alert("Passwords do not match");
        return false;
    }

    let emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    if (!emailPattern.test(email)) {
        alert("Please enter a valid email address");
        return false;
    }

    if (password.length < 6) {
        alert("Password must be at least 6 characters long");
        return false;
    }

    return true;
}
</script>
</head>
<body>
    <div class="container">
        <div class="card w-50 mx-auto my-5">
            <div class="card-header text-center">User Registration</div>
            <div class="card-body">
                <% if (errorMessage != null) { %>
                    <div class="error-message"><%= errorMessage %></div>
                <% } %>
                <% if (successMessage != null) { %>
                    <div class="success-message"><%= successMessage %></div>
                <% } %>
                <form name="registrationForm" action="user-register" method="post" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label>Full Name</label>
                        <input type="text" name="register-name" class="form-control" placeholder="Enter your name">
                    </div>
                    <div class="form-group">
                        <label>Email address</label>
                        <input type="email" name="register-email" class="form-control" placeholder="Enter email">
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="register-password" class="form-control" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <label>Confirm Password</label>
                        <input type="password" name="register-confirm-password" class="form-control" placeholder="Confirm Password">
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Register</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <%@include file="/includes/footer.jsp"%>
</body>
</html>
