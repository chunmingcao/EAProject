<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign In</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous"></head>
<body>
<div class="container">
<form action="login" method="POST"  class="form-horizontal">
  <fieldset>
    <div id="legend">
      <legend class="">Sign In</legend>
    </div>
    <c:if test="${error eq true} }">
    	<p>error:${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
    </c:if>
    <div class="control-group">
      <label class="control-label" for="email">E-mail</label>
      <div class="controls">
      <input id="email" name="email" placeholder="" class="input-xlarge"/>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="password">Password</label>
      <div class="controls">
      <input type="password" name="password" placeholder="" class="input-xlarge"/>
      </div>
    </div>
	
    <div class="control-group">
      <!-- Button -->
      <div class="controls">
        <button class="btn btn-success">Register</button> <input type="submit" value="Login"/>
      </div>
    </div>
  </fieldset>
</form>
</div>

</body>
</html>