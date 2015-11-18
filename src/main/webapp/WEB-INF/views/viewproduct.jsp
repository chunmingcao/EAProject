<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${product.name}</title>
</head>
<body>
<form action="<c:url value="/addToCart"/>" method="POST">
	        <input type="submit" name="addToCart" value="Add To Cart" />
	        <input type="hidden" name="id" value="${product.id}" />
	    	
	<h1>${product.name}</h1>
	<table>
	<tr>
		<td>${product.name}</td>
		<td>${product.price}</td>
		<td>${product.description}</td>
		<td><a href="deletecategory/${category.id}">delete</a></td>
	</tr>
	</table>
	
	<a href="addcategory"> Add a Category</a>
	</form>
</body>

</html>