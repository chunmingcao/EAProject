<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Categories</title>
</head>
<body>
	<h1>Categories</h1>
	<table>
	<c:forEach var="category" items="${categories}">
	<tr>
		<td>${category.name}</td>
		<td><a href="editcategory/${category.id}">edit</a></td>
		<td><a href="deletecategory/${category.id}">delete</a></td>
	</tr>
	</c:forEach>
	</table>
	
	<a href="addcategory"> Add a Category</a>
</body>
</html>