<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Police Login</title>
<link rel="stylesheet" href="policelogin.css">
</head>
<body background="bg3.jpg">
<jsp:include page="MHeading.jsp"/>
<center><table cellpadding="10">
<form method="post" action="Policeloginjsp.jsp">
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>

<tr><td colspan="2"><b><span class="sf">Staff Login</span></b></td></tr>
<tr></tr>
<tr></tr>
<tr>
<td><div class="pom-agile">
	<span class="fa fa-user-o" aria-hidden="true">
					</span>
				
<input placeholder="Police Id" name="username" class="pass" type="text"  required></div></td>
</tr>
<tr>
<td><div class="pom-agile">
<span class="fa fa-key" aria-hidden="true">
</span>
<input placeholder="Password" name="password" class="pass" type="password" required></div></td>
</tr>
<tr><td><a href="forgot password.jsp"><span class="fp"><b>Forget Password?</b></span></a></td></tr>
<tr></tr>
<tr></tr>
<tr>
<td colspan="2"><b><input type="submit" class="button" value="Login"></b></td>
</tr>
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>
</form>
</table></center>
</body>
</html>