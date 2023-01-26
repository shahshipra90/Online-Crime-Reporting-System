<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ page import="java.io.*,java.sql.*,java.util.zip.*,java.lang.*" %>
<title>Criminal Records</title>
<link rel="stylesheet" href="criminalrecords.css">
</head>
<body background="F:\College\Project\Project Finalized Items\Finalized Images\bg.jpg">
<jsp:include page="MHeading.jsp"/>
<h5><pre><a href="criminalrecords.jsp">Criminal Records</a>    <a href="complain.jsp">Complains</a>    <a href="PI.jsp">New Record</a>    <a href="logout.jsp">Logout</a> </pre></h5>

<%
                    //String firstname = request.getParameter("accommodation_name");
					//int id=0;
					String name=null;
					String type=null;
					//String type,cid;
					int cid;
					String img=null;
					String cno=null;
					
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
                                             
					Statement psmnt = connection.createStatement();
					
                        ResultSet rs;
                        rs = psmnt.executeQuery("SELECT personal_information.Image, personal_information.Name, personal_information.Criminal_ID,crime_information.Case_No, crime_information.Type_of_case from personal_information inner join crime_information on crime_information.Criminal_ID= personal_information.Criminal_ID ");
                       String s[]=new String[10];
                       //int a= new int[5];
                       int i=0;
                        while (rs.next())
                        {
                        	  img=rs.getString("Image");
                            name=rs.getString("Name");
                            cid=rs.getInt("Criminal_ID");
                          cno=rs.getString("Case_No");
                          // rs1 = psmnt1.executeQuery("SELECT * from crime_information where (Criminal_ID = '+123')");
                           type=rs.getString("Type_of_case");
                           //img=rs.getString("Image");
                           
                           %>
                           <div class="container" style="margin-top:50px">
             <%System.out.println(img); %>           
	<img src="Imagess/<%=img%>" height="105px" width="105px" class="img"/>
   
<pre>Name : <%=name %>
Type : <%=type%>
Criminal ID :<%=cid %>

</pre>
<form action="details.jsp" method="post">


<input type="submit" class="button" value="View">
<input type="hidden" name="cid" value="<%=cid %>" >
<input type="hidden" name="cn" value="<%=cno %>"> 
 </form> 
<form action="updatedPI.jsp" method="post">
<input type="submit" class="button" value="Update">
<input type="hidden" name="ci" value="<%=cid %>"> </form> 



</div>
                           
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