<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Category</title>
</head>
<body>
	<form:form commandName="category" action="addcategory" method="post">
	<table>
		<tr>
			<td>Name:</td>
			<td><form:input  path="name"/> </td>
			<td><form:errors path="name" cssClass="error"/> </td>
		</tr>
	</table>
	<input type="submit" value="Add Category"/>
	</form:form>

</body>
</html>