<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<t:genericpage>
	<jsp:attribute name="title">Products</jsp:attribute>
	<jsp:body>
	<div class="container">
    <div class="well well-sm">
        <strong>Category Title</strong>
        <div class="btn-group">
            <a href="#" id="list" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th-list">
            </span>List</a> <a href="#" id="grid" class="btn btn-default btn-sm"><span
                class="glyphicon glyphicon-th"></span>Grid</a>
        </div>
    </div>
    <div id="products" class="row list-group">
    <c:forEach var="product" items="${products}">
		<div class="item  col-xs-4 col-lg-4">
            <div class="thumbnail">
                <img class="group list-group-image" src="${contextPath}/${product.image}" width="300" height="250" />
                <div class="caption">
                    <h4 class="group inner list-group-item-heading"> ${product.description} </h4>
                    <p class="group inner list-group-item-text">${product.description}</p>
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <p class="lead">${product.price}</p>
                        </div>
                        <div class="col-xs-12 col-md-6">
                        <a class="btn btn-success" href="${contextPath}/product/${product.id}">Add to cart</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</c:forEach>
    </div>
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
</div>
    
    </jsp:body>
</t:genericpage>

