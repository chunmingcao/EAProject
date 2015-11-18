<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<t:genericpage>
	<jsp:attribute name="title">Add Category</jsp:attribute>
	<jsp:body>
    <div class="jumbotron">
    <div class="panel panel-primary">
			<div class="panel-heading">
						<h3 class="panel-title">Products</h3>
						<span class="pull-right"><a href="addproduct"> Add a Product</a></span>
					</div>
					<div class="panel-body">
					<table class="table table-striped table-hover table-bordered">
				        <tbody>
				            <tr>
				                <th>Name</th>
				                <th>Price</th>
				                <th>QTY Left</th>
				                <th></th>
				                <th></th>
				            </tr>
				            <c:forEach var="product" items="${products}">
				            
							<tr>
				                <td>${product.name}</td>
				                <td>${product.price}</td>
								<td>${product.quantity}</td>
													<td></td>
				                <td class="col-sm-1 col-md-1"> 
					                 <a href="${contextPath}/admin/editproduct/${product.id}">
					                 <button type="button" class="btn btn-primary"> <span class="glyphicon glyphicon-edit">
					                Edit</span></button></a> 
								</td>
								<td class="col-sm-1 col-md-1"> 
					                <a href="${contextPath}/admin/deleteproduct/${product.id}">
					                 <button type="button" class="btn btn-danger"> <span
																	class="glyphicon glyphicon-remove">
					                Remove</span>
															</button>
													</a> 
								</td>
				            </tr>
							</c:forEach>
				        </tbody>
				    </table>
					</div>
				</div>
		</div>
    </jsp:body>
</t:genericpage>
