<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<t:genericpage>
	<jsp:attribute name="title">Sign Up</jsp:attribute>
	<jsp:body>
    <div class="jumbotron">
    <div class="panel panel-primary">
			<div class="panel-heading">
						<h3 class="panel-title">Sign Up</h3>
					</div>
					<div class="panel-body">
					<form:form method="POST" commandName="user" class="form-horizontal"
						role="form">
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">Email</label>
								<div class="col-sm-9">
									<form:input path="email" value="${user.getEmail()}"  />
								</div>
								<span><form:errors path="email" cssClass="alert-danger" /></span>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">Password</label>
								<div class="col-sm-9">
									<form:password path="password" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">Confirm Password</label>
								<div class="col-sm-9">
									<form:password path="passwordConfirm" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">First Name</label>
								<div class="col-sm-9">
									<form:input path="firstName" placeholder="First Name" />
								</div>
							</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">Last Name</label>
								<div class="col-sm-9">
									<form:input path="lastName" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">City</label>
								<div class="col-sm-9">
									<form:input path="shippingAddress.city" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">State</label>
								<div class="col-sm-9">
									<form:input path="shippingAddress.state" placeholder="" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">Zip</label>
								<div class="col-sm-9">
									<form:input path="shippingAddress.zip" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">Zip</label>
								<div class="col-sm-9">
									<form:input path="shippingAddress.zip" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-success">Sign Up</button>
								</div>
							</div>
					
					</form:form>
					</div>
				</div>
		</div>
    </jsp:body>
</t:genericpage>