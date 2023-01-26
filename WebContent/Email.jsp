<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Email</title>
<link rel="stylesheet" href="Email.css">
</head>
<body  background="F:\College\Project\Project Finalized Items\Finalized Images\bg3.jpg">

<jsp:include page="MHeading.jsp"/>


<center><table cellpadding="10">
<form action="Mail" method="post">
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>
<tr><td colspan="2"><b><span class="sf">Enter Your E-mail</span></b></td></tr>
<tr>
<td><div class="pom-agile">
				<span class="fa fa-user-o" aria-hidden="true">
				
				</span>
				<input placeholder="E-mail" name="mail" class="user" type="email" required></div></td>
</tr>

<!-- id-->
<%
int randomPin=(int)(Math.random()*9000)+1000;
String otp=String.valueOf(randomPin);
//out.print(otp);
%>
</tr>
<input type="text" hidden name="id" value="<%=otp%>">
<tr>
<tr>
<td colspan="2"><b><input type="Submit" class="button" value="Send OTP"></b></td>
</tr>
</form>
<td style="padding-top:20px;"><center><a href="Instruction Page.jsp"><input type="submit" class="button"  value="Back"></a></center></td>
</tr>
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>

</table></center>
</body>
</html>