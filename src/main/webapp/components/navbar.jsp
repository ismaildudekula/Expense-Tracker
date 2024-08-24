<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>

<nav class="navbar navbar-expand-lg bg-dark bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-money-bills"></i> Xpenses</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
    
      <c:if test="${not empty loggedUser }">
      
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      
      	<li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="add_expense.jsp"><i class="fa-solid fa-plus"></i> Add New</a>
	    </li>
	    <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="view_expenses.jsp"><i class="fa-solid fa-list"></i> View All</a>
	    </li>
      
      </ul>
      
      </c:if>
      
      
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
      
      	<c:if test="${not empty loggedUser}">
      		<li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="#"><i class="fa-solid fa-user"></i> ${loggedUser.fullname}</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="../logout"><i class="fa-solid fa-right-to-bracket"></i> Logout</a>
	        </li>
      	</c:if>
      	<c:if test="${empty loggedUser }">
      		<li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="register.jsp"><i class="fa-solid fa-user"></i> Register</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="login.jsp"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
	        </li>
      	</c:if>
	        
        
      </ul>
 
    </div>
  </div>
</nav>