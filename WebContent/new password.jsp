<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forget Password</title>
<link rel="stylesheet" href="newpassword.css">
</head>
<body background="F:\College\Project\Project Finalized Items\Finalized Images\bg3.jpg">
<jsp:include page="MHeading.jsp"/>

<center><table cellpadding="10">
<form action="newpasswordjsp.jsp" method="post">
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>
<tr><td colspan="2"><b><span class="sf">Change Password</span></b></td></tr>
<tr>
<td><div class="pom-agile">
					<span class="fa fa-key" aria-hidden="true"></span>
					<input placeholder="Password" name="pass" class="pass" type="password" required></div></td>
</tr>
<tr>
<td><div class="pom-agile">
					<span class="fa fa-key" aria-hidden="true"></span>
					<input placeholder="Password" name="cpass" class="pass" type="password" required></div></td>
</tr>

<tr>
<td colspan="2"><b><input type="submit" class="button" value="Change"></b></td>
</tr>
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>
</table></center>
</body>
</html>