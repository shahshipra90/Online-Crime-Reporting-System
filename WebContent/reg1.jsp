<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<link rel="stylesheet" href="reg.css">
</head>
<body>
<jsp:include page="MHeading.jsp"/>

<form action="SendMail" method="post">
<div class="table1">
<table align="Center" cellspacing="0" cellpadding="0">
<tr>
<td>Victim Name</td><td><input type="text" placeholder="Eg: Arjun Shah" name="name" required ></td>
<td>E-mail</td><td><input type="text" placeholder="Eg: abc@gmail.com" name="email" required></td>
</tr>
<tr >
<td>Gender</td><td><input type="radio" class="radio1" name="gender" value="male">Male</td><td colspan="2"><input type="radio" class="radio2" name="gender" value="female">Female</td>
</tr>
<tr>
<td>Victim's <br>Phone No.</td><td><input type="number" name="phnno"></td>
<td>Emergency <br>Phone No.</td><td><input type="number" name="phno" required ></td>
</tr>
<tr>
<td>D.O.B</td><td><input type="date" name="dob"/></td>
<td>Address <br>of Victim</td><td><textarea rows="4" cols="16" name="add" required></textarea></td>
</tr>
<tr>
<td>Area of <br> Police Station</td>
<td><select style="width:216px" name="area" required>
<option value="None">None</option>
<option value="Akota">Akota</option>
<option value="Alkapuri">Alkapuri</option>
<option value="Atladra">Atladra</option>
<option value="Chhanni">Chhanni</option>
<option value="City Area">City Area</option>
<option value="Fatehpura">Fatehpura</option>
<option value="Fatehgunj">Fatehgunj</option>
<option value="Gorwa">Gorwa</option>
<option value="Gotri">Gotri</option>
<option value="Karelibaug">Karelibaug</option>
<option value="Makarpura">Makarpura</option>
<option value="Manjalpur">Manjalpur</option>
<option value="Nava Yard">Nava Yard</option>
<option value="Nizampura">Nizampura</option>
<option value="Panigate">Panigate</option>
<option value="Raopura">Raopura</option>
<option value="Sama">Sama</option>
<option value="Sayajigunj">Sayajigunj</option>
<option value="Tandalja">Tandalja</option>
<option value="Vasna">Vasna</option>
</select></td>
<td> Crime</td>
<td><select style="width:218px" name="crime" required>
<option value="None">None</option>
<option value="Communal Riots">Communal Riots</option>
<option value="Dowery">Dowery</option>
<option value="Mental Harassment">Mental Harassment</option>
<option value="Violenece against Women">Violenece against Women</option>
<option value="Child Labour">Child Labour</option>
<option value="Child Abuse">Child Abuse</option>
<option value="Damage to Public Property">Damage to Public Property</option>
<option value="Theft">Theft</option>
<option value="Fraud">Fraud</option>
<option value="Bribe Cases">Bribe Cases</option>
<option value="Drug Possession">Drug Possession</option>
</tr>
<tr>
<td>Crime <br>Description</td><td><textarea rows="4" cols="16" name="desc" required></textarea></td>
<td>Address of <br>Crime Scene</td><td><textarea rows="4" cols="16" name="addr" required></textarea></td>
</tr>
<tr>
<td>Date of <br>Crime</td><td><input type="date" name="date" required></td>
<td>Time of <br>Crime</td><td><input type="time" name="time" required></td>
</tr>
<%
int randomPin=(int)(Math.random()*9000)+1000;
String otp=String.valueOf(randomPin);
//out.print(otp);
%><input type="" hidden name="refid"  value="<%=otp%>">
<input type="" hidden name="status">
<tr>
<td colspan="2"><center><input type="submit" class="button" value="Submit"></center></td>

</div>
</form>
<td colspan="2"><center><a href="Instruction Page.jsp"><input type="button" class="button" value="Back"></a></center></td>
</tr>
</table>
</body>
</html>