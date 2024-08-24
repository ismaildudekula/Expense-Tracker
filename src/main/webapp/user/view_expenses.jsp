<%@page import="java.util.List"%>
<%@page import="com.model.User"%>
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
<title>View All Expenses</title>
<%@ include file = "../components/all_css.jsp" %>

<style type="text/css">
		.card-sh{
			box-shadow: 0px 0px 30px -15px rgb(0,0,0,0.5);
			border-radius: 10px;
			border: none
		}
	</style>

</head>
<body>
<c:if test="${empty loggedUser}">
<c:redirect url = "../login.jsp"></c:redirect>
</c:if>
<%@ include file = "../components/navbar.jsp" %>

	<div class = "container mt-2">
		<div class = "row">
			<div class = "col-md-12">
				<div class = "card card-sh m-2">
					<div class = "card-header">
						<h4>All Expenses</h4>
						<c:if test="${not empty msg}">
							<p class = "text-center text-success">${msg}</p>
							<c:remove var = "msg" />
						</c:if>
					</div>
					<div class = "card-boby" >
					 	<table class="table">
							  <thead>
							    <tr>
							      <th scope="col">Title</th>
							      <th scope="col">Description</th>
							      <th scope="col">Date</th>
							      <th scope="col">Time</th>
							      <th scope="col">Price</th>
							      <th scope="col">Action</th>
							    </tr>
							  </thead>
							  <tbody>
							  	<%
							  		User user = (User)session.getAttribute("loggedUser");
							  		ExpenseDao expenseDao = new ExpenseDao(HibernateUtility.getSessionFactory());
							  		List<Expense> list = expenseDao.allExpenses(user);
							  	
							  		for(Expense expense : list){
							  	%>
							  	
							  		<tr>
							      		<th scope="row"><%= expense.getTitle() %></th>
							      		<td><%= expense.getDescription() %></td>
							      		<td><%= expense.getDate() %></td>
							      		<td><%= expense.getTime() %></td>
							      		<td><%= expense.getPrice() %></td>
							      		<td>
							      			<a href="edit_expense.jsp?id=<%=expense.getId()%>" class = "btn btn-small btn-primary me-1">Edit</a>
							      			<a href="../deleteExpense?id=<%=expense.getId()%>" class = "btn btn-small btn-danger ">Delete</a>
							      		</td>
							      		
							    	</tr>	
							  	
							  	<% } %>
							    
							  </tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file = "../components/all_js.jsp" %>
</body>
</html>