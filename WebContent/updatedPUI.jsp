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

<%
String sd,ed,jn,sf,cn,cy,tt,cs="null";
                    
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
					 Integer cno = (Integer)session.getAttribute("Case_No");
					  System.out.println(cno);
                        ResultSet rs;
                        rs = psmnt.executeQuery("SELECT * from punishment_information where Case_No='"+cno+"'");
                        if (rs.next())
                        {
                        	
                        	sd=rs.getString("Start_Date");
                            ed=rs.getString("End_Date");
                            jn=rs.getString("Jail_Name");
                            sf=rs.getString("Sentenced_For");
                            cn=rs.getString("Court_Name");
                            cy=rs.getString("City");
                            tt=rs.getString("Time_taken_by_court_to_take_decision");
                            cs=rs.getString("Current_Status");
                        
                           
                           %>
<jsp:include page="MHeading.jsp"/>
<h5><pre><a href="criminalrecords.jsp">Criminal Records</a>    <a href="complain.jsp">Complains</a>    <a href="PI.jsp">New Record</a>    <a href="logout.jsp">Logout</a> </pre></h5>
<table>
<form action="PUIupdatedjsp.jsp" method="post">
<tr>
<th colspan="2" bgcolor="black" align="center"><font size="6" color="white">Punishment Information</font></th>
</tr>
<tr>

<td><input type="text" value="<%=cno %>" required name="caseno" hidden></td>
</tr>
<tr>
<td>Start Date</td>
<td><input type="date" value="<%=sd %>"required name="start"></td>
</tr>
<tr>
<td>End Date</td>
<td><input type="date" value="<%=ed %>" required name="end"></td>
</tr>
<tr>
<td>Jail Name</td>
<td><input type="text" value="<%=jn %>" required name="jail"></td>
</tr>
<tr>
<td>Sentenced For</td>
<td><input type="text" value="<%=sf%>" required name="sent"></td>
</tr>
<tr>
<td>Court Name</td>
<td><input type="text" value="<%=cn %>" name="court"></td>
</tr>
<tr>
<td>City</td>
<td><input type="text" value="<%=cy %>" name="city"></td>
</tr>
<tr>
<td>Time taken by court to take decision</td>
<td><input type="text" value="<%=tt %>" name="decision"></td>
</tr>
<tr>
<td>Current Status</td>
<td><select style="width:215px;" name="status">
<option value="<%=cs %>" selected><% out.print(cs);%></option>
<option value="In Jail">In Jail</option>
<option value="Bail">Bail</option>
<option value="Released">Released</option>
</select></td>
</tr>

                         


<tr>
<td align="center"><input type="submit" class="button" value="Submit"></td>
</form>
<td align="center"><a href="updatedCI.jsp"><input type="button" class="button" value="Back"></a></td>
</tr>
</table>
<%
                           
                        }
                    }    
                   
                    
                    catch(Exception e)
                    {
System.out.println(e);
                    }
                    
					}                        %>
</body>
</html>