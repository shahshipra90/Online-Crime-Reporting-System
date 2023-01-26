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

<jsp:include page="MHeading.jsp"/>
<h5><pre><a href="criminalrecords.jsp">Criminal Records</a>    <a href="complain.jsp">Complains</a>    <a href="PI.jsp">New Record</a>    <a href="logout.jsp">Logout</a> </pre></h5>
<center><table>
<form action="CIjsp.jsp" method="post">
<tr>
<tr><th colspan="2" bgcolor="black" align="center"><font size="6" color="white">Crime Information</font></th></tr>


<%
                    //String firstname = request.getParameter("accommodation_name");
					//int id=0;
					//String id="null";
					//String type,cid;
					%>
					<%
                    /*try 
					{
                    	 Class.forName("com.mysql.jdbc.Driver").newInstance();
                    	Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ocrs","root", "");
                    	 if (connection != null) {
                             System.out.println("Connected to database #1");
                         }
                    	 else{
                    		 
                    	 }
                        // psmnt = connection.prepareStatement("INSERT INTO personal_information (AD_NAME,AD_DES,AD_IMG) values (?,?,?)");                        Statement psmnt = connection.createStatement();
					Statement psmnt = connection.createStatement();*/
					//String cid=request.getParameter("id");
                       // ResultSet rs;
                        String cid = (String)session.getAttribute("Criminal_ID");
                       // String rid = (String)request.getAttribute("Reference_ID");
                       // session.getAttribute("Criminal_ID");
                       /*
                       rs = psmnt.executeQuery("SELECT * from personal_information where Criminal_ID=");
                       
                        if (rs.next())
                        {
                            //id = rs.getString("ID");
                           id=rs.getString("Criminal_ID");
                           
                           
                           //type=rs1.getString("Type_of_case");
                           */
                           %>
                         
<tr>
<td><input type="number" value="<%=cid %>" hidden name="idd" ></td>
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
<td>Case No</td>
<td><input type="number" required name="case"></td>
</tr>
<tr>
<td>Type of case</td>
<td>
<select name="type">
<option value="None">None</option>
<option value="Major">Major</option>
<option value="Minor">Minor</option>
</td>
</tr>
<tr>
<td>Crime</td>
<td><input type="text" required name="crime"></td>
</tr>

<tr>
<td>Crime</br>Description</td>
<td><textarea rows="4" cols="26" required name="desc"></textarea></td>
</tr>

<tr>
<td>Address of crime</br>scene</td>
<td><textarea rows="4" cols="26" name="address"></textarea></td>
</tr>
<tr>
<td>City</td>
<td><input type="text" name="city"></td>
</tr>
<tr>
<td>State</td>
<td><input type="text" name="state"></td>
</tr>
<tr>
<td>Date<br/> of crime</td>
<td><input type="date" required name="date"></td>
</tr>
<tr>
<td>Time<br/> of crime</td>
<td><input type="time" required name="time"></td>
</tr>

<tr>
<td>Date of<br/> caught</td>
<td><input type="date" required name="caught"></td>
</tr>
<tr>
<td align="center"><input type="submit" class="button" value="Submit"></td>
</form>
<td align="center"><a href="PI.jsp"><input type="button" class="button" value="Back"></a></td>
</tr>
</table>
</center>
</body>
</html>