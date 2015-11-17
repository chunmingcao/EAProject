<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<t:genericpage>
	<jsp:attribute name="title">Products</jsp:attribute>
	<jsp:body>
    <div class="jumbotron">
      <h3>Products</h3>
		<table>
		<c:forEach var="product" items="${products}">
		<tr>
			<td><a href="${contextPath}/product/${product.id}">${product.name}</a></td>
			<td></td>
		</tr>
		</c:forEach>
		</table>
    </div>
    </jsp:body>
</t:genericpage>