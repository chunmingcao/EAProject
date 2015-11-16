<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Category</title>
</head>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<body>
	<form:form commandName="category" action="${contextPath}/admin/editcategory/${id}" method="post">
	<table>
		<tr>
			<td>Name:</td>
			<td><form:input  path="name"/> </td>
			<td><form:errors path="name" cssClass="error"/> </td>
		</tr>
	</table>
	<input type="submit" value="Edit Category"/>
	</form:form>

</body>
</html>