<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
<title><%@attribute name="title" fragment="true" %></title>
</head>
  <body>
  	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="${contextPath}">Fair Store</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          
          <ul class="nav navbar-nav">
            <sec:authorize access="hasRole('ROLE_ADMIN')">
          		<li class="active"><a href="${contextPath}/admin/products">Products</a></li>
          		<li class="active"><a href="${contextPath}/admin/category">Category</a></li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_ANONYMOUS','ROLE_USER')">
          		<li><a href="${contextPath}/products">Products</a></li>
		  	</sec:authorize>
		  	<sec:authorize access="hasRole('ROLE_USER')">
          		<li><a href="${contextPath}/cart/mycart">My Carts</a></li>
		  	</sec:authorize>
          </ul>
          <ul class="nav navbar-nav navbar-right">
          	<sec:authorize access="isAnonymous()">
          		<li><a href="${contextPath}/login">Login</a></li>
            
            	<li><a href="${contextPath}/signup">Signup</a></li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
          		<li><a href="#"><sec:authentication property="principal.username"/></a></li>
            
            	<li><a href="${contextPath}/logout">Logout</a></li>
			</sec:authorize>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <div class="container">
    	<jsp:doBody/>
    </div>
  </body>
</html>