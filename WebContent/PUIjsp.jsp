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
Class.forName("com.mysql.jdbc.Driver");
PreparedStatement pstatement = null;
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs", "root", "");
Statement st=conn.createStatement();
String s=request.getParameter("start");
String e=request.getParameter("end");
String j=request.getParameter("jail");
String se=request.getParameter("sent");
String c=request.getParameter("court");
String ci=request.getParameter("city");
String d=request.getParameter("decision");
String sta=request.getParameter("status");
String cno=request.getParameter("caseno");

if (conn != null) {
    System.out.println("Connected to database #1");
}
//PreparedStatement pstatement = null;
System.out.println(s);
System.out.println(e);
System.out.println(j);
System.out.println(se);
System.out.println(c);
System.out.println(ci);
System.out.println(d);
System.out.println(sta);
System.out.println(cno);

//Statement st1=conn.createStatement();

pstatement=conn.prepareStatement ("INSERT INTO punishment_information(Start_Date,End_Date,Jail_Name,Sentenced_For,Court_Name,City,Time_taken_by_court_to_take_decision,Current_Status,Case_No) values (?,?,?,?,?,?,?,?,?)");

pstatement.setString(1,s);
pstatement.setString(2,e);
pstatement.setString(3,j);
pstatement.setString(4,se);
pstatement.setString(5,c);
pstatement.setString(6,ci);
pstatement.setString(7,d);
pstatement.setString(8,sta);
pstatement.setString(9,cno);

//pstatement.setString(14,"null");
int i= pstatement.executeUpdate();

/*
int i=st.executeUpdate ("INSERT INTO user_reg(Victim_Name, Email,Gender,Victim's_Phone,Emergency_Phone,DOB,Address_of_Victim,Area_of_Police_Station,Crime,Crime_Description,Address_of_Crime_Scene,Date_of_Crime,Time_of_Crime) VALUES ('"+n+"', '"+e+"','"+g+"','"+p+"','"+ph+"','"+d+"','"+a+"','"+ar+"','"+c+"','"+cd+"','"+add+"','"+dt+"','"+t+"')");
*/
//int i=st1.executeUpdate("INSERT INTO user_reg(Victim_Name, Email,Gender,Victim's_Phone,Emergency_Phone,DOB,Address_of_Victim,Area_of_Police_Station,Crime,Crime_Description,Address_of_Crime_Scene,Date_of_Crime,Time_of_Crime) VALUES ('"+n+"', '"+e+"','"+g+"','"+p+"','"+ph+"','"+d+"','"+a+"','"+ar+"','"+c+"','"+cd+"','"+add+"','"+dt+"','"+t+"')");
/*
if(i>0)
{
String message = "data inserted successfully!!!!";
response.sendRedirect("thanku.jsp");
}
else
{
	response.sendRedirect("reg1.jsp");
}
*/
if(i>0)
{
String message = "data inserted successfully!!!!";
session.setAttribute("Case_No",cno);
response.sendRedirect("CSB.jsp");
}
else
{
	response.sendRedirect("PUI.jsp");
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