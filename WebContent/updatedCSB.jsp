<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case Solved By Information</title>
<link rel="stylesheet" href="CSB.css">
</head>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*,java.lang.*" %>
<body>
<jsp:include page="MHeading.jsp"/>
<h5><pre><a href="criminalrecords.jsp">Criminal Records</a>    <a href="complain.jsp">Complains</a>    <a href="PI.jsp">New Record</a>    <a href="logout.jsp">Logout</a> </pre></h5>
<%
String ps,nop,pid,ph,des,exp="null";
int cno;
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
					  cno = (Integer)session.getAttribute("Case_No");
                        ResultSet rs;
                        rs = psmnt.executeQuery("SELECT * from case_solved_by_information where Case_No='"+cno+"'");
                        if (rs.next())
                        {

                            ps=rs.getString("Police_Station");
                            nop=rs.getString("Police_Name");
                            pid=rs.getString("Police_ID");
                            ph=rs.getString("Phone_No");
                            des=rs.getString("Designation");
                            exp=rs.getString("Experience");
                            //cno=rs.getString("Case_No");
                        
                        
                           
                           %>
<table>
<form action="CSBupdatedjsp.jsp" method="post">
<tr>
<th colspan="2" bgcolor="black" align="center"><font size="6" color="white">Case Solved By Information</font></th>
</tr>
<tr>
<td>Police Station</td>
<td><select style="width:215px;" name="ps" >
<option value="<%=ps%>" selected><% out.print(ps);%></option>
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
</tr>
<tr>
<td>Name of officer</td>
<td><input type="text" required name="nof" value="<%=nop %>"></td>
</tr>
<tr>
<td>Police Id</td>
<td><input type="text" placeholder="5461" required name="pid" value="<%=pid %>"></td>
</tr>
<tr>
<td>Phone Number</td>
<td><input type="text" name="pno" value="<%=ph %>"></td>
</tr>

<tr> 
<td>Designation</td>
<td><select name="desg">
<option value="<%=des%>" selected><% out.print(des);%></option>
<option>Commissioner</option>
<option>Supritendent</option>
<option>Deputy Supritendent</option>
<option>Inspector</option>
<option>Sub-Inspector</option>
<option>Head-Constable</option>
<option>Constable</option>
</select></td>
</tr>
<tr>
<td>Experience</td>
<td><input type="text" name="exp" value="<%=exp %>"></td>
</tr>
<tr>
<!-- <td>cn</td>-->
<td><input type="number" name="caseno" value="<%=cno %>" hidden></td>
</tr>
<tr>
<td align="center"><input type="submit" class="button" value="Submit"></td>
</form>
<td align="center"><a href="updatedPUI.jsp"><input type="button" class="button" value="Back"></a></td>
</tr>
</table>
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
