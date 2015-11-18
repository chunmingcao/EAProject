<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>

<t:genericpage>
    <jsp:attribute name="title">Sign In</jsp:attribute>
    <jsp:body>
        <form:form action="signin" method="POST" commandName="user" class="form-horizontal">
  <fieldset>
    <div id="legend">
      <legend class="">Sign In</legend>
    </div>
    <div class="control-group">
      <label class="control-label" for="email">E-mail</label>
      <div class="controls">
      <form:input path="email" id="email" name="email" placeholder="" class="input-xlarge"/>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="password">Password</label>
      <div class="controls">
      <form:password path="password" id="password" placeholder="" class="input-xlarge"/>
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
    </jsp:body>
</t:genericpage>

<%-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign In</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous"></head>
<body>
<div class="container">
<form:form action="signin" method="POST" commandName="user" class="form-horizontal">
  <fieldset>
    <div id="legend">
      <legend class="">Sign In</legend>
    </div>
    <div class="control-group">
      <label class="control-label" for="email">E-mail</label>
      <div class="controls">
      <form:input path="email" id="email" name="email" placeholder="" class="input-xlarge"/>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="password">Password</label>
      <div class="controls">
      <form:password path="password" id="password" placeholder="" class="input-xlarge"/>
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

</body>
</html> --%>