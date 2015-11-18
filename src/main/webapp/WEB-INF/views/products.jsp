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
	<c:forEach var="product" items="${page.content}">
	<tr>
		<td><a href="${contextPath}/product/${product.id}">${product.name}</a></td>
		<td></td>
	</tr>
	</c:forEach>
	</table>

<!-- Pagination Bar -->
<div th:fragment='paginationbar'>
  <div class='pagination pagination-centered'>
    <ul>
      <c:choose>
      <c:when test="${page.number == 0}">
        <li class='disabled'>
        <span>← First</span>
        </li>
      </c:when>
      <c:otherwise>
        <li>
        <a href='${contextPath}/products?pg=0'>← First</a>
        </li>
      </c:otherwise>
      </c:choose>
      
      <c:choose>
      <c:when test="${page.number==0}">
        <li class='disabled'>
        <span>«</span>
        </li>
      </c:when>
      <c:otherwise>
        <li>
        <a href='${contextPath}/products?pg=${page.number-1}' title='Go to previous page'>«</a>
        </li>
      </c:otherwise>
      </c:choose>

      <c:forEach begin="1" end="${page.totalPages-1}" var="item">
      	
      	  <c:choose>
	      <c:when test="${item == page.number}">
	        <li class='disabled'>
	        <span>${item}</span>
	        </li>
	      </c:when>
	      <c:otherwise>
	        <li>
	        <a href='${contextPath}/products?pg=${item}'>${item}</a>
	        </li>
	      </c:otherwise>
	      </c:choose>
      </c:forEach>
  
      <c:choose>
      <c:when test="${page.number==page.totalPages-1}">
        <li class='disabled'>
        <span>»</span>
        </li>
      </c:when>
      <c:otherwise>
        <li>
        <a href='${contextPath}/products?pg=${page.number+1}' title='Go to next page'>»</a>
        </li>
      </c:otherwise>
      </c:choose>
          
      <c:choose>
      <c:when test="${page.number == page.totalPages-1}">
        <li class='disabled'>
        <span>Last →</span>
        </li>
      </c:when>
      <c:otherwise>
        <li>
        <a href='${contextPath}/products?pg=${page.totalPages}'>Last →</a>
        </li>
      </c:otherwise>
      </c:choose>      
    </ul>
  </div>
</div>
	
</body>
</html>