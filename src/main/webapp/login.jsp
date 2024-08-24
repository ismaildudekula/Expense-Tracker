<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<%@ include file = "components/all_css.jsp" %>
	<style type="text/css">
		.card-sh{
			box-shadow: 0px 0px 30px -15px rgb(0,0,0,0.5);
			border-radius: 10px;
			border: none
		}
	</style>
</head>
<body class = "bg-light">
	<%@ include file = "components/navbar.jsp" %>
	
	<div class = "conatiner p-5" >
		<div class = "row">
			<div class = "col-md-6 offset-md-3">
				<div class = "card card-sh">
					<div class = "card-header">
						<h4>Login</h4>
						<c:if test="${not empty msg}">
							<p class = "text-center text-success text-danger">${msg}</p>
							<c:remove var = "msg" />
						</c:if>
					</div>
					<div class = "card-body" >
						<form action = "login" method =  "post">
							<div class = "mb-3">
								<label>Email </label><input type = "text" name = "email" class = "form-control">
							</div>
							<div class = "mb-3">
								<label>Password </label><input type = "password" name = "password" class = "form-control">
							</div>
							<button class = "btn btn-success col-md-12">Submit</button>
							<div class = "text-center m-2">
								Don't have an account? <a href = "register.jsp" class = "text-decoration-none">Create One</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		
		</div>
	</div>


	<%@ include file = "components/all_js.jsp" %>
</body>
</html>