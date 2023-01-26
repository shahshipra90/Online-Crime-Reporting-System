	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Personal Information</title>
<link rel="stylesheet" href="PI.css">
</head>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*,java.lang.*" %>
<body>

<jsp:include page="MHeading.jsp"/>
<h5><pre><a href="criminalrecords.jsp">Criminal Records</a>    <a href="complain.jsp">Complains</a>    <a href="PI.jsp">New Record</a>    <a href="logout.jsp">Logout</a> </pre></h5>
<%
                    //String firstname = request.getParameter("accommodation_name");
					//int id=0;
					String name,gen,phn,add,ct,st,dt,a,ht,wt,bg,ec,hc,cid="null";
					String n,g,p,ci,s,ag,h,w="null";
					//String type,cid;
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
                    	//Connection conn = null;
                    	 Class.forName("com.mysql.jdbc.Driver").newInstance();
                    	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ocrs","root", "");
                    	 if (conn != null) {
                             System.out.println("Connected to database #1");
                         }
                    	 else{
                    		 
                    	 }
                                             
					Statement psmnt = conn.createStatement();
					// im=request.getParameter("file");
					 n=request.getParameter("name");
					 g=request.getParameter("gender");
					 p=request.getParameter("phno");
					 a=request.getParameter("add");
					 ci=request.getParameter("city");
					 s=request.getParameter("state");
					 dt=request.getParameter("date");
					 ag=request.getParameter("age");
					 h=request.getParameter("height");
					 w=request.getParameter("weight");
					 bg=request.getParameter("bgrp");
					 ec=request.getParameter("eyecolor");
					 hc=request.getParameter("haircolor");
					 cid=request.getParameter("ci");
					 int dem=Integer.parseInt(cid);
					 System.out.println(dem);
                        ResultSet rs;
                        rs = psmnt.executeQuery("SELECT * from personal_information where Criminal_ID='"+dem+"'");
                        
                       
                        //ps.setString(15,dem);
                       
                        if (rs.next())
                        {
                        	name = rs.getString("Name");
                            gen=rs.getString("Gender");
                            phn=rs.getString("Phone");
                            add=rs.getString("Address");
                            ct=rs.getString("City");
                            st=rs.getString("State");
                            dt=rs.getString("DOB");
                            a=rs.getString("Age");
                            ht=rs.getString("Height");
                            wt=rs.getString("Weight");
                            bg=rs.getString("Blood_Group");
                            ec=rs.getString("Eye_Color");
                            hc=rs.getString("Hair_Color");
                            //cid=rs.getInt("Criminal_ID"); 
                        
                           %>
                           
                          	</div>
<center>
<table>
<form action="PIupdatejsp.jsp">
<tr><th colspan="2" bgcolor="black" align="center"><font size="6" color="white">Personal Information</font></th></tr>

<tr>
<td>Name</td>
<td><input type="text" value="<%=name%>" required name="name"></td>
</tr>
<tr>
<td>Gender</td>
<td><select style="width:213px;" value="<%=gen%>" name="gender">
<option value="<%=gen %>" selected><% out.print(gen);%></option>
<option vaue="Male">Male</option>
<option value="Female">Female</option>

</select></td>
</tr>
<tr>
<td>Phone No.</td>
<td><input type="number" required maxlength="10" value="<%=phn%>" name="phno"></td>
</tr>
<tr>
<td>Address</td>
<td><textarea rows="4" cols="26"  name="add"><%=add%></textarea></td>
</tr>
<tr>
<td>City</td>
<td><input type="text" value="<%=ct%>" name="city"></td>
</tr>
<tr>
<td>State</td>
<td><input type="text" value="<%=st%>" name="state"></td>
</tr>
<tr style="width:145px">
<td>Date of birth</td>
<td><input type="date" value="<%=dt%>"required name="date" ></td>
</tr>
<tr>
<td>Age</td>
<td><input type="number" value="<%=a%>" min="1" max="100" name="age"></td>
</tr>
<tr>
<td>Height</td>
<td><input type="text" value="<%=ht%>" required name="height"></td>
</tr>
<tr>
<td>Weight</td>
<td><input type="text" value="<%=wt%>" required name="weight"></td>
</tr>
<tr>
<td>Blood Group</td>
<td><select style="width:213px;" value="<%=bg%>" name="bgrp">
<option value="<%=bg%>" selected><% out.print(bg);%></option>
<option vaue="A+">A+</option>
<option value="A-">A-</option>
<option value="AB+">AB+</option>
<option value="B+">B+</option>
<option value="B-">B-</option>
<option value="O+">O+</option>
<option vaalue="O-">O-</option>
</select></td>
</tr>
<tr>
<td>Eye Color</td>
<td><input type="color" value="<%=ec%>" name="eyecolor"></td>
</tr>
<tr>
<td>Hair Color</td>
<td><input type="color" value="<%=hc%>" name="haircolor"></td>
</tr>
<tr>
<!-- <td>Criminal ID</td>-->
<td><input type="number" value="<%=dem%>" name="id" hidden></td>
</tr>
<tr>
<td align="center"><input type="submit" class="button" value="Submit"></td>
</form>

<td align="center"><a href="criminalrecords.jsp"><input type="submit" class="button" value="Back"></a></td>
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