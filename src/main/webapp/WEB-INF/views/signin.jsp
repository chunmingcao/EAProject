<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign In</title>
</head>
<body>
	<form action="signin" method="post">
	<table>
		<tr>
			<td>Email:</td>
			<td><input type="text" name="email" value="${user.email}" /> </td>
		</tr>
		<tr>
			<td>Password:</td>
			<td><input type="text" name="password" value="${user.password}" /> </td>
		</tr>
		<tr>
			<td>Password Confirm:</td>
			<td><input type="text" name="passwordConfirm" value="${user.passwordConfirm}" /> </td>
		</tr>
	</table>
	<input type="submit" value="Sign In"/>
	</form>

</body>
</html>