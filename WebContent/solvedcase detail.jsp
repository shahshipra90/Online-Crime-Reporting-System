<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Complain Detail</title>
<link rel="stylesheet" href="Complain Details.css">
</head>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*,java.lang.*" %>
<body>
<jsp:include page="MHeading.jsp"/>
<h5><pre><a href="criminalrecords.jsp">Criminal Records</a>    <a href="complain.jsp">Complains</a>    <a href="PI.jsp">New Record</a>   <a href="logout.jsp">Logout</a> </pre></h5>
<%
                   String vc,em,g,vp,ep,db,aov,aps,c,cd,acs,doc,toc ,reid= "null";
				
				%>
				<%
				if(session==null || session.getAttribute("userid")==null)
				{
					
					
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
                     String refid;                        
					Statement psmnt = connection.createStatement();
					 refid=request.getParameter("ci");
					 int a=Integer.parseInt(refid);
							
  					   
  					 System.out.println(a);
  					 ResultSet rs;
                        rs = psmnt.executeQuery("SELECT * from user_reg where Reference_ID='"+refid+"'");
                        if (rs.next())
                        {
                            vc = rs.getString("Victim_Name");
                            em = rs.getString("Email");
                            g = rs.getString("Victim_Gender");
                            vp = rs.getString("Victim_Phone");
                            ep = rs.getString("Emergency_Phone");
                            db = rs.getString("DOBD");
                            aov = rs.getString("Address_of_Victim");
                            aps = rs.getString("Area_of_Police_Station");
                            c = rs.getString("Crime");
                            cd = rs.getString("Crime_Description");
                            acs = rs.getString("Address_of_Crime_Scene");
                            doc = rs.getString("Date_of_Crime");
                            toc = rs.getString("Time_of_Crime");
                            reid = rs.getString("Reference_ID");
                           %>
<center><table cellspacing="5" cellpadding="5"></center>
<tr>
<td>Victim Name</td>
<td><%=vc %></td>
</tr>
<td>E-mail</td>
<td><%=em %></td>
</tr> 
<tr>
<td>Gender</td>
<td><%=g %></td>
<tr>
<td>Victim's Phone No.</td>
<td><%=vp %> </td>
</tr>
<tr>
<td>Emergency Phone No.</td>
<td><%=ep %></td>
</tr>
<tr>
<td>D.O.B</td>
<td><%=db%></td>
</tr>
<tr>
<td>Address of Victim</td>
<td><%=aov%></td>
</tr>
<tr>
<td>Area of Police Station</td>
<td><%=aps %></td>
</tr>
<tr>
<td>Crime</td>
<td><%=c %></td>
</tr>
<tr>
<td>Crime Description</td>
<td><%=cd %></td>
</tr>
<tr>
<td>Address of crime scene</td>
<td><%=acs%></td>
</tr>

<tr>
<td>Date of Crime</td>
<td><%=doc %></td>
</tr>
<tr>
<td>Time of Crime</td>
<td><%=toc %></td>
</tr>
<tr>

<td colspan="2"><center><a href="complainsolved.jsp"><input type="button" class="button" value="Back"></a></center></td>
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