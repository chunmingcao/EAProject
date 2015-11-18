<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<t:genericpage>
	<jsp:attribute name="title">Sign Up</jsp:attribute>
	<jsp:body>
    <div class="jumbotron">
        <p><image src="${contextPath}/${product.image}" width="200"/></p>
		<h1>${product.name}</h1>
		<p>Category: <a href="${contextPath}/product/category/${product.category.id}">${product.category.name}</a></p>
		<p>${product.description}</p>
		<p>Price:${product.price}</p>
		<form:form commandName="cart" action="${contextPath}/cart/addProduct">
		
		<table>
		<tr>
			<td>
			<form:select path="quantity">
				<c:forEach begin="1" end="${product.quantity}" var="val">
				  <option value="${val}">
				    <c:out value="${val}"/>
				  </option>
				</c:forEach>
			</form:select>
			</td>
			<td>
			<form:hidden path="product.id" value="${product.id}"/>
			<button>Add To Cart</button>
			</td>
		</tr>
	
		</table>
		</form:form>
    </div>
    </jsp:body>
</t:genericpage>