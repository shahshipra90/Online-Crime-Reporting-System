 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Punishment Information</title>
<link rel="stylesheet" href="PUI.css">
</head>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*,java.lang.*" %>
<body>
<jsp:include page="MHeading.jsp"/>
<h5><pre><a href="criminalrecords.jsp">Criminal Records</a>    <a href="complain.jsp">Complains</a>    <a href="PI.jsp">New Record</a>    <a href="logout.jsp">Logout</a> </pre></h5>
<table>
<form action="PUIjsp.jsp" method="post">
<tr>
<th colspan="2" bgcolor="black" align="center"><font size="6" color="white">Punishment Information</font></th>
</tr>
<%
                    //String firstname = request.getParameter("accommodation_name");
					//int id=0;
					//String no="null";
					//String type,cid;
					%>
					<%
					   String cn = (String)session.getAttribute("Case_No");
                   
                           %>
                         
<tr>

<td><input type="text" value="<%=cn %>" required name="caseno" hidden></td>
</tr>
<%
               /*            
                        }
                    }    
                   
                    
                    catch(Exception e)
                    {

                    }
                  */  
                        %>
                        
                        

<tr>
<td>Start Date</td>
<td><input type="date" required name="start"></td>
</tr>
<tr>
<td>End Date</td>
<td><input type="date" required name="end"></td>
</tr>
<tr>
<td>Jail Name</td>
<td><input type="text" required name="jail"></td>
</tr>
<tr>
<td>Sentenced For</td>
<td><input type="text" required name="sent"></td>
</tr>
<tr>
<td>Court Name</td>
<td><input type="text" name="court"></td>
</tr>
<tr>
<td>City</td>
<td><input type="text" name="city"></td>
</tr>
<tr>
<td>Time taken by court to take decision</td>
<td><input type="text" name="decision"></td>
</tr>
<tr>
<td>Current Status</td>
<td><select style="width:215px;" name="status">
<option value="None">None</option>
<option value="In Jail">In Jail</option>
<option value="Bail">Bail</option>
<option value="Relased">Relased</option>
</select></td>
</tr>
<tr>
<td align="center"><input type="submit" class="button" value="Submit"></td>
</form>
<td align="center"><a href="CI.jsp"><input type="button" class="button" value="Back"></a></td>
</tr>
</table>
</body>
</html>