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
                <img class="group list-group-image" src="${contextPath}/${product.image}" width="300" height="150" />
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
</div>
    
    </jsp:body>
</t:genericpage>