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
//String no=request.getParameter("crimeno");
String cn=request.getParameter("case");
String c=request.getParameter("type");
String cr=request.getParameter("crime");
String cd=request.getParameter("desc");
String cs=request.getParameter("address");
String ci=request.getParameter("city");
String s=request.getParameter("state");
String dt=request.getParameter("date");
String t=request.getParameter("time");
String dc=request.getParameter("caught");
String cid=request.getParameter("idd");
//String rid=request.getParameter("ri");

if (conn != null) {
    System.out.println("Connected to database #1");
}
//PreparedStatement pstatement = null;
//System.out.println(no);
System.out.println(cn);
System.out.println(c);
System.out.println(cr);
System.out.println(cd);
System.out.println(cs);
System.out.println(ci);
System.out.println(s);
System.out.println(dt);
System.out.println(t);
System.out.println(dc);
System.out.println(cid);
//System.out.println(rid);

//Statement st1=conn.createStatement();

pstatement=conn.prepareStatement ("INSERT INTO crime_information(Case_No,Type_of_case,Crime,Description,Address_of_crime_scene,City,State,Date,Time,Date_of_caught,Criminal_ID) values (?,?,?,?,?,?,?,?,?,?,?)");

//pstatement.setString(1,no);
pstatement.setString(1,cn);
pstatement.setString(2,c);
pstatement.setString(3,cr);
pstatement.setString(4,cd);
pstatement.setString(5,cs);
pstatement.setString(6,ci);
pstatement.setString(7,s);
pstatement.setString(8,dt);
pstatement.setString(9,t);
pstatement.setString(10,dc);
pstatement.setString(11,cid);
//pstatement.setString(12,rid);

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
session.setAttribute("Case_No",cn);
response.sendRedirect("PUI.jsp");
}
else
{
	response.sendRedirect("CI.jsp");
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