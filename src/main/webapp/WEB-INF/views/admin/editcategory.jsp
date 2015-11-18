<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<t:genericpage>
	<jsp:attribute name="title">Add Category</jsp:attribute>
	<jsp:body>
    <div class="jumbotron">
    <div class="panel panel-primary">
			<div class="panel-heading">
						<h3 class="panel-title">Add Category</h3>
					</div>
					<div class="panel-body">
					<form:form commandName="category" action="addcategory" method="POST" class="form-horizontal"
						role="form">
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">Name</label>
								<div class="col-sm-9">
								<form:input  path="name"/>
								</div>
								<span><form:errors path="name" cssClass="alert-danger" /></span>
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