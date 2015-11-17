<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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