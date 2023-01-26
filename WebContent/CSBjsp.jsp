 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<%@page import="java.sql.* ,java.util.*"%>               
<body>
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
	 //PreparedStatement pstatement = null;
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs", "root", "");
Statement st=conn.createStatement();
String p=request.getParameter("ps");
String n=request.getParameter("nof");
String pi=request.getParameter("pid");
String ph=request.getParameter("pno");
String d=request.getParameter("desg");
String e=request.getParameter("exp");
String cno=request.getParameter("caseno");
//int ph = Integer.parseInt(pho);
if (conn != null) {
         System.out.println("Connected to database #1");
     }

System.out.println(p);
System.out.println(n);
System.out.println(pi);
System.out.println(ph);
System.out.println(d);
System.out.println(e);
System.out.println(cno);
Statement st1=conn.createStatement();

int i=st1.executeUpdate("insert into case_solved_by_information(Police_Station,Police_Name,Police_ID,Phone_No,Designation,Experience,Case_No)values('"+p+"','"+n+"','"+pi+"','"+ph+"','"+d+"','"+e+"','"+cno+"')");

/*
pstatement=conn.prepareStatement ("INSERT INTO case_solved_by_information(Police Station,Name of Officer,Police ID,Phone No,Designation,Experience) VALUES (?,?,?,?,?,?)");
pstatement.setString(1,p);
pstatement.setString(2,n);
pstatement.setString(3,pi);
pstatement.setString(4,ph);
//pstatement.setInt(4,ph);
pstatement.setString(5,d);
pstatement.setString(6,e);

int i= pstatement.executeUpdate();*/

if(i>0)
{%>
<script>



alert("Data Inserted Successfully!");
//response.sendRedirect("alert1.jsp");
window.location="criminalrecords.jsp";
</script><%

String message = "data inserted successfully!!!!";
session.setAttribute("Case_No",cno);
//response.sendRedirect("Victim.jsp");

}
else
{%>
<script>



alert("Something went wrong, Please try again!");
//response.sendRedirect("alert1.jsp");
window.location="CSB.jsp";
</script><%

	response.sendRedirect("CSB.jsp");
}
}
catch(Exception e)
{
	System.out.print(e);
}
}
%>
</body>
</html> 