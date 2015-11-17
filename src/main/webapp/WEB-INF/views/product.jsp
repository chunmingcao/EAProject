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
	<h1>${product.name}</h1>
	<p>${product.category.name}</p>
	<p>${product.description}</p>
	<p>${product.price}</p>
	
	<form action="">
	
	<table>
	<tr>
		<td>
		<select>
<c:forEach begin="1" end="${product.quantity}" var="val">
  <option value="${val}">
    <c:out value="${val}"/>
  </option>
</c:forEach>
		</select>
		</td>
		<td><button>Add To Cart</button></td>
	</tr>

	</table>
	</form>
</body>
</html>