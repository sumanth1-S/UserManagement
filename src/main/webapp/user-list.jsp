<%@page import="com.xadmin.usermanagement.web.UserServlet"%>
<%@page import="com.xadmin.usermanagement.dao.USerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>User Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>

	<header>
		<nav
			style="background-color: blue">
			<div>
				<a href="#" class="navbar-brand"> User
					Management Application </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
			</ul>
		</nav>
	</header>
	<br>

	<div class="row">
		

		<div class="container">
			<h3 class="text-center">List of Users</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
					New User</a>			
			</div>
				
		
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</a></th>
						<th>name</a></th>
						<th>email</a></th>
						<th>country</a></th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach var="user" items="${listUser}">

						<tr>
							<td><c:out value="${user.id}" /></td>
							<td><c:out value="${user.name}" /></td>
							<td><c:out value="${user.email}" /></td>
							<td><c:out value="${user.country}" /></td>
							<td><a href="edit?id=<c:out value='${user.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?id=<c:out value='${user.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
				<center>
				<div>
				
						<c:if test="${currentPage > 1}">
				            <a href="?page=${currentPage - 1}">&lt</a>
				        </c:if>
						<c:forEach var="i" begin="1" end="${totalPages}">
				            <c:if test="${i == currentPage}">
				                <strong>${i}</strong>
				            </c:if>
				            <c:if test="${i != currentPage}">
				                <a href="?page=${i}">${i}</a>
				            </c:if>
        				</c:forEach>
        				
        				<c:if test="${currentPage < totalPages}">
          				  <a href="?page=${currentPage + 1}">&gt</a>
        				</c:if>
				</div>
				</center>
			</table>
		</div>
	</div>
		
</body>
</html>