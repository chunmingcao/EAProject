<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Products</title>
</head>
<body>
	<h1>Products</h1>
	<table>
	<c:forEach var="product" items="${products}">
	<tr>
		<td>${product.name}</td>
		<td><a href="${contextPath}/admin/editproduct/${product.id}">edit</a></td>
		<td><a href="${contextPath}/admin/deleteproduct/${product.id}">delete</a></td>
		<td><a href="${contextPath}/product/${product.id}" target="_blank">preview</a></td>
	</tr>
	</c:forEach>
	</table>
	
	<a href="addproduct"> Add a Product</a>
</body>
</html>