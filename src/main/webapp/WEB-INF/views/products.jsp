<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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
<sec:authorize access="hasRole('ROLE_ANONYMOUS')">
LOGIN
</sec:authorize>
<sec:authorize access="hasRole('ROLE_USER')">
ADD TO CART
</sec:authorize>
	<h1>Products</h1>
	<table>
	<c:forEach var="product" items="${products}">
	<tr>
		<td><a href="${contextPath}/product/${product.id}">${product.name}</a></td>
		<td></td>
	</tr>
	</c:forEach>
	</table>
	
</body>
</html>