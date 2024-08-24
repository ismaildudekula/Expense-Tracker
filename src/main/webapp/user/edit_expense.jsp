<%@page import="com.model.Expense"%>
<%@page import="com.db.HibernateUtility"%>
<%@page import="com.dao.ExpenseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Expense</title>
<%@ include file = "../components/all_css.jsp" %>
</head>
<body>
<c:if test="${empty loggedUser}">
<c:redirect url = "../login.jsp"></c:redirect>
</c:if>
	<%@ include file = "../components/navbar.jsp" %>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		ExpenseDao dao = new ExpenseDao(HibernateUtility.getSessionFactory());
		Expense expense = dao.getExpenseById(id);
	%>
	<div class = "container">
		<div class = "row">
			<div class = "col-md-4 offset-md-4">
				<div class = "card card-sh">
					<div class = "card-header">
						<p class = "fs-3">Edit Expense</p>
						<c:if test="${not empty msg}">
							<p class = "text-center text-success">${msg}</p>
							<c:remove var = "msg" />
						</c:if>
					</div>
					<div class = "card-body">
						<form action="../updateExpense" method = "post">
							<div class = "mb-3">
								<label>Title</label> <input type = "text" name = "title" value = "<%= expense.getTitle() %>" class = "form-control">
							</div>
							<div class = "mb-3">
								<label>Date</label> <input type = "date" name = "date" value = "<%= expense.getDate() %>" class = "form-control">
							</div>
							<div class = "mb-3">
								<label>Time</label> <input type = "time" name = "time" value = "<%= expense.getTime() %>" class = "form-control">
							</div>
							<div class = "mb-3">
								<label>Description</label> <input type = "text" name = "description" value = "<%= expense.getDescription() %>" class = "form-control">
							</div>
							<div class = "mb-3">
								<label>Price</label> <input type = "text" name = "price" value = "<%= expense.getPrice() %>" class = "form-control">
							</div>
							<input type = "hidden" name = "id" value = "<%= expense.getId() %>">
							<button class = "btn btn-success col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file = "../components/all_js.jsp" %>
</body>
</html>