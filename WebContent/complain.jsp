<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Complains</title>
<link rel="stylesheet" href="complain.css">
</head>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*,java.lang.*" %>
<body >

<jsp:include page="MHeading.jsp"/>
<h5><pre><a href="criminalrecords.jsp">Criminal Records</a>    <a href="complain.jsp">Complains</a>    <a href="PI.jsp">New Record</a>    <a href="complainsolved.jsp">Solved Cases</a>    <a href="logout.jsp">Logout</a> </pre></h5>



<%
    String vc,gen,cr,dt,t,btn="null";
   
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
			
				
                        ResultSet rs;
                        rs = psmnt.executeQuery("SELECT * from user_reg where Status='Unsolved'");
                        String s[]=new String[20];
                        int i=0;
                        int refid;
                       // request.setAttribute("Reference_ID",refid);
                        %>
                       <center> <table cellpadding="10px">
<tr>
<th>Name</th>
<th>Gender</th>
<th>Crime</th>
<th>Date</th>
<th>Time </th>
<th colspan="2"></th>
</tr>
                        <%
                        while (rs.next())
                        {
                        	
                        
                        vc=rs.getString("Victim_Name");
                        gen=rs.getString("Victim_Gender");
                        cr=rs.getString("Crime");
                        dt=rs.getString("Date_of_Crime");
                        t=rs.getString("Time_of_Crime");
                        refid=rs.getInt("Reference_ID"); 
                        btn=rs.getString("complain_status");
                        %>


<tr>
<td><%=vc %></td>
<td><%=gen %></td>
<td><%=cr %></td>
<td><%=dt %></td>
<td><%=t %></td>


<form action="Complain Details.jsp" method="post">
<td style="padding-left:40px;"><input type="submit" class="button" value="<%=btn%>"></td>
<input type="hidden" name="ci" value="<%=refid %>"> </form>
<td><a href="complainsolved.jsp"><form method="post" action="statusjsp.jsp"><input type="hidden" name="ci" value="<%=refid %>"><input type="submit" class="button" value="Solved"></form></a></td>
</tr> 



<%
                           
                        }
                    }    
                   
                    
                    catch(Exception e)
                    {
System.out.println(e);
                    }

                        }%>

</table></center>
</body>
</html>