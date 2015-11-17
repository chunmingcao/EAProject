<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<t:genericpage>
	<jsp:attribute name="title">Sign Up</jsp:attribute>
	<jsp:body>
    <div class="jumbotron">
        <form:form method="POST" commandName="user"
				class="form-horizontal">
  <fieldset>
    <div id="legend">
      <legend class="">Sign Up</legend>
    </div>
 	<div class="control-group">
		<h3>Basic Info</h3>
	</div>
    <div class="control-group">
      <label class="control-label" for="email">E-mail</label>
      <div class="controls">
      <form:input path="email" value="${user.getEmail()}" name="email"
								placeholder="" class="input-xlarge" />
      </div>
      <p>
							<form:errors path="email" cssClass="error" />
						</p>
    </div>
    
    <div class="control-group">
      <label class="control-label" for="firstName">First Name</label>
      <div class="controls">
      <form:input path="firstName" id="email" placeholder=""
								class="input-xlarge" />
      </div>
    </div>
 	
 	<div class="control-group">
      <label class="control-label" for="lastName">Last Name</label>
      <div class="controls">
      <form:input path="lastName" id="email" placeholder=""
								class="input-xlarge" />
      </div>
    </div>
    
    <div class="control-group">
      <label class="control-label" for="password">Password</label>
      <div class="controls">
      <form:password path="password" id="password" placeholder=""
								class="input-xlarge" />
      </div>
    </div>
 
    <div class="control-group">
      <label class="control-label" for="passwordConfirm">Password Confirm</label>
      <div class="controls">
      <form:password path="passwordConfirm" id="password" placeholder=""
								class="input-xlarge" />
      </div>
    </div>
 	
	<div class="control-group">
		<h3>Address Info</h3>
		<div class="control-group">
	      <label class="control-label" for="shippingAddress.city">City</label>
	      <div class="controls">
	      <form:input path="shippingAddress.city" placeholder=""
									class="input-xlarge" />
	      </div>
    </div>
    <div class="control-group">
	      <label class="control-label" for="shippingAddress.state">State</label>
	      <div class="controls">
	      <form:input path="shippingAddress.state" placeholder=""
									class="input-xlarge" />
	      </div>
    </div>
    <div class="control-group">
	      <label class="control-label" for="shippingAddress.zip">Zip</label>
	      <div class="controls">
	      <form:input path="shippingAddress.zip" placeholder=""
									class="input-xlarge" />
	      </div>
    </div>
    
	</div>	
	
    <div class="control-group">
      <!-- Button -->
      <div class="controls">
        <button class="btn btn-success">Register</button>
      </div>
    </div>
  </fieldset>
</form:form>
</div>
    </jsp:body>
</t:genericpage>