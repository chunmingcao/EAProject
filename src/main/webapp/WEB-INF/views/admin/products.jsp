<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<t:genericpage>
	<jsp:attribute name="title">Products</jsp:attribute>
	<jsp:body>
    <div class="jumbotron">
        <h1>Products</h1>
	<table>
	<c:forEach var="product" items="${products}">
	<tr>
		<td>${product.name}</td>
		<td><a href="${contextPath}/admin/editproduct/${product.id}">edit</a></td>
		<td><a href="${contextPath}/admin/deleteproduct/${product.id}">delete</a></td>
	</tr>
	</c:forEach>
	</table>
	
	<a href="addproduct"> Add a Product</a>
    </div>
    </jsp:body>
</t:genericpage>