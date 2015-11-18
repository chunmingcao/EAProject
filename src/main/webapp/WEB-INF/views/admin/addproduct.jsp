<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<t:genericpage>
	<jsp:attribute name="title">Add Product</jsp:attribute>
	<jsp:body>
    <div class="jumbotron">
    <div class="panel panel-primary">
			<div class="panel-heading">
						<h3 class="panel-title">Add Product</h3>
					</div>
					<div class="panel-body">
					<form:form commandName="product" action="addproduct" method="POST" class="form-horizontal"
						role="form" enctype="multipart/form-data">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-4 control-label">Name</label>
								<div class="col-sm-4">
								<form:input  path="name"/>
								</div>
								<span><form:errors path="name" cssClass="alert-danger" /></span>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-4 control-label">Category</label>
								<div class="col-sm-4">
								<form:select path="category.id">
								<form:option value="0">&nbsp;</form:option>
				     			<form:options items="${cateMap}" />
				     			</form:select>
								</div>
								<span><form:errors path="category.id" cssClass="alert-danger" /></span>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-4 control-label">Price</label>
								<div class="col-sm-4">
								<form:input  path="price"/>
								</div>
								<span><form:errors path="price" cssClass="alert-danger" /></span>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-4 control-label">Quantity</label>
								<div class="col-sm-4">
								<form:input  path="quantity"/>
								</div>
								<span><form:errors path="quantity" cssClass="alert-danger" /></span>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-4 control-label">Profile Picture</label>
								<div class="col-sm-4">
								<input type="file" name="pictureFile">
								</div>
								<span><form:errors path="pictureFile" cssClass="alert-danger" /></span>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-4 control-label">Description</label>
								<div class="col-sm-4">
								<form:textarea  path="description" cols="40" rows="10"/>
								</div>
								<span><form:errors path="description" cssClass="alert-danger" /></span>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-success">Save</button>
								</div>
							</div>
					
					</form:form>
					</div>
				</div>
		</div>
    </jsp:body>
</t:genericpage>