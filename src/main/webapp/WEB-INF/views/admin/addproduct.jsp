<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Product</title>
</head>
<body>
	<form:form commandName="product" action="${contextPath}/admin/addproduct" enctype="multipart/form-data" method="post">
	<table>
		<tr>
			<td>Name:</td>
			<td><form:input  path="name"/> </td>
			<td><form:errors path="name" cssClass="error"/> </td>
		</tr>
		
		<tr>
			<td>Category:</td>
			<td><form:select path="category.id">
				<form:option value="0">&nbsp;</form:option>
     			<form:options items="${cateMap}" />
     			</form:select>
			</td>
			<td><form:errors path="category.id" cssClass="error"/> </td>
		</tr>
		
		<tr>
			<td>Price:</td>
			<td><form:input  path="price"/> </td>
			<td><form:errors path="price" cssClass="error"/> </td>
		</tr>
		<tr>
			<td>Quantity:</td>
			<td><form:input  path="quantity"/> </td>
			<td><form:errors path="quantity" cssClass="error"/> </td>
		</tr>
		<tr>
			<td>Picture:</td>
			<td><input type="file" name="pictureFile"> </td>
			<td><!-- form:errors path="quantity" cssClass="error"/--> </td>
		</tr>		
		<tr>
			<td>Description:</td>
			<td><form:textarea path="description" rows="20" cols="50"/> </td>
			<td><form:errors path="description" cssClass="error"/> </td>
		</tr>
	</table>
	<input type="submit" value="Add Product"/>
	</form:form>

</body>
</html>