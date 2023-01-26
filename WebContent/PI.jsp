<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Personal Information</title>
<link rel="stylesheet" href="PI.css">
</head>
<body background="">

<jsp:include page="MHeading.jsp"/>
<h5><pre><a href="criminalrecords.jsp">Criminal Records</a>    <a href="complain.jsp">Complains</a>    <a href="PI.jsp">New Record</a>    <a href="logout.jsp">Logout</a> </pre></h5>

<center>
<table>
<form method="post" enctype="multipart/form-data" action="PIjsp.jsp">
<tr><th colspan="2" bgcolor="black" align="center"><font size="6" color="white">Personal Information</font></th></tr>
<tr>
<td >Image</td>
<td ><input type="file" required name="file"></td>
</tr>
<tr>
<td>Name</td>
<td><input type="text" required name="name"></td>
</tr>
<tr>
<td>Gender</td>
<td><input type="radio" class="radio1" name="gender" value="male">Male  <input type="radio" class="radio2" name="gender" value="female">Female</td>
</tr>
<tr>
<td>Phone No.</td>
<td><input type="number" required maxlength="10" name="phno"></td>
</tr>
<tr>
<td>Address</td>
<td><textarea rows="4" cols="26" name="add"></textarea></td>
</tr>
<tr>
<td>City</td>
<td><input type="text" name="city"></td>
</tr>
<tr>
<td>State</td>
<td><input type="text" name="state"></td>
</tr>
<tr style="width:145px">
<td>Date of birth</td>
<td><input type="date" required name="date" ></td>
</tr>
<tr>
<td>Age</td>
<td><input type="number"  min="1" max="100" name="age"></td>
</tr>
<tr>
<td>Height</td>
<td><input type="text" required name="height"></td>
</tr>
<tr>
<td>Weight</td>
<td><input type="text" required name="weight"></td>
</tr>
<tr>
<td>Blood Group</td>
<td><select style="width:213px;" name="bgrp">
<option value="None">None</option>
<option vaue="A+">A+</option>
<option value="A-">A-</option>
<option value="AB+">AB+</option>
<option value="B+">B+</option>
<option value="B-">B-</option>
<option value="O+">O+</option>
<option vaalue="O-">O-</option>
</select>
<tr>
<td>Eye Color</td>
<td><input type="color" name="eyecolor"></td>
</tr>
<tr>
<td>Hair Color</td>
<td><input type="color" name="haircolor"></td>
</tr>

<tr>
<td>Criminal ID</td>
<td><input type="number" name="id"></td>
</tr>
<tr>
<td align="center"><input type="submit" class="button" value="Submit"></td>
</form>
<td align="center"><a href="criminalrecords.jsp"><input type="submit" class="button" value="Back"></a></td>
</tr>
</table>
</center>

</body>
</html>