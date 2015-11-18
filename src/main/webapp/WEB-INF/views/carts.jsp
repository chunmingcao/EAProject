<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Products</title>
</head>
<body>
	<h1>My Cart</h1>
	<table>
	<c:forEach var="cart" items="${cart.}">
	<tr>
		<td>${cart.product.name}</td>
		<td><a href="deleteproduct/${product.id}">delete</a></td>
		<a href="<c:url value="/jsp/index.htm"/>">TEST</a>
		
		<td><a href="<c:url value="/addToCart/${product.id}"/>">Add To Cart</a></td>
	</tr>
	</c:forEach>
	</table>
	
	<a href="addproduct"> Add Product</a>
</body>
</html>