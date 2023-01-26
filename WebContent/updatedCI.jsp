<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Crime Information</title>
<link rel="stylesheet" href="CI.css">
</head>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*,java.lang.*" %>
<body>
<%
String noc,cno,toc,c,cd,aoc,ci,s,dof,dc,cid="null"; 

//Time tof;
					%>
					<%
					if(session==null || session.getAttribute("userid")==null)
					{
						//System.out.println("hii");
						response.sendRedirect("Police login.jsp"); 
					}

					else
					{
                    try 
					{
                    	 Class.forName("com.mysql.jdbc.Driver").newInstance();
                    	Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ocrs","root", "");
                    	 if (connection != null) {
                             System.out.println("Connected to database #1");
                         }
                    	 else{
                    		 
                    	 }
                                             
					Statement psmnt = connection.createStatement();
					 cid = (String)session.getAttribute("Criminal_ID");
					
                        ResultSet rs;
                        rs = psmnt.executeQuery("SELECT * from crime_information where Criminal_ID='"+cid+"'");
                        		
                        if (rs.next())
                        {
                        	   
                               cno=rs.getString("Case_No");
                               toc=rs.getString("Type_of_Case");
                               c=rs.getString("Crime");
                               cd=rs.getString("Description");
                               aoc=rs.getString("Address_of_crime_scene");
                               ci=rs.getString("City");
                               s=rs.getString("State");
                               dof=rs.getString("Date");
                               //tof=rs.getTime("Time");
  System.out.print(rs.getTime("Time"));
                               dc=rs.getString("Date_of_caught");
                               //cid=rs.getString("Criminal_ID");
                               //int de=Integer.parseInt(cid);
                               
                        
                           
                           %>
<jsp:include page="MHeading.jsp"/>
<h5><pre><a href="criminalrecords.jsp">Criminal Records</a>    <a href="complain.jsp">Complains</a>    <a href="PI.jsp">New Record</a>    <a href="logout.jsp">Logout</a> </pre></h5>
<center><table>
<form action="CIupdatedjsp.jsp" method="post">
<tr>
<tr><th colspan="2" bgcolor="black" align="center"><font size="6" color="white">Crime Information</font></th></tr>

<tr>
<!--<td>Case No</td> -->
<td><input type="number" placeholder="546" value="<%=cno %>"  required name="case" hidden></td>
</tr>
<tr>
<td>Type of case</td>
<td>
<select name="type"  value="<%=toc%>">
<option value="<%=toc %>" selected><% out.print(toc);%></option>
<option value="Major">Major</option>
<option value="Minor">Minor</option>
</td>
</tr>
<tr>
<td>Crime</td>
<td><input type="text" required  value="<%=c %>" name="crime"></td>
</tr>

<tr>
<td>Crime</br>Description</td>
<td><textarea  rows="4" cols="26" required name="desc"><%=cd %></textarea>  </td>
</tr>

<tr>
<td>Address of crime</br>scene</td>
<td><textarea  rows="4" cols="26" name="address"> <%=aoc%></textarea></td>
</tr>
<tr>
<td>City</td>
<td><input type="text" name="city"  value="<%=ci %>"></td>
</tr>
<tr>
<td>State</td>
<td><input type="text" name="state"  value="<%=s %>"></td>
</tr>
<tr>
<td>Date<br/> of crime</td>
<td><input type="date" required name="date"   value="<%=dof %>"></td>
</tr>
<td>Time<br/> of crime</td>
<td><input type="timestamp" required name="time"  value=" <%=rs.getTime("Time")%>"></td>
</tr>
<tr>
<td>Date of<br/> caught</td>
<td><input type="date" required name="caught"  value="<%=dc %>"></td>
</tr>
<tr>
<!-- <td>cr</td>-->
<td><input type="number"  value="<%=cid %>" name="id" hidden></td>
</tr>
<tr>
<td align="center"><input type="submit" class="button" value="Submit"></td>
</form>
<td align="center"><a href="updatedPI.jsp"><input type="button" class="button" value="Back"></a></td>
</tr>
</table>
</center>
<%
                           
                        }     
                    }    
                   
                    
                    catch(Exception e)
                    {
System.out.println(e);
                    }
					}
                        %>
</body>
</html>