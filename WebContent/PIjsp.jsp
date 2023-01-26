<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@page import="java.sql.* ,java.util.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<body>
<%
                    
                    	
String itemName = "";     	 
 String n="";
 String g="";
 String ad="";
 String ci="";
 String s="";
 String dt="";
 String ag="";
 String h="";
 String w="";
 String bg="";
 String ec="";
 String hc="";
 String ph="";
 String cidd=""; 
 int cid;
 Long p;
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
Class.forName("com.mysql.jdbc.Driver");
PreparedStatement pstatement;
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs", "root", "");
Statement st=conn.createStatement();
//String im=request.getParameter("file");
	 try
	 {
	 String ImageFile="";
	 
	 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	 if (!isMultipart)
	 {
	 }
	 else
	 {
	 FileItemFactory factory = new DiskFileItemFactory();
	 ServletFileUpload upload = new ServletFileUpload(factory);
	 //List items = null;
	 List items = null;
	 try
	 {
	 items = upload.parseRequest(request);
	 }
	 catch (FileUploadException e)
	 {
		 
	 e.getMessage();
	 }
	  
	 Iterator itr = items.iterator();
	 while (itr.hasNext())
	 {
	 FileItem item = (FileItem) itr.next();
	 if (item.isFormField())
	 {
	 String name = item.getFieldName();
	 //System.out.println(items);
	 String value = item.getString();
	 //System.out.println(value);
	 if(name.equals("name"))
	 {
	 n=value;
	
	 }
	 else if (name.equals("gender"))
	 {
		 g=value;
		 System.out.println(g);
	 }
	 else if (name.equals("phno"))
	 {
		 ph=value;
		p=Long.parseLong(ph);
	 }
	 else if (name.equals("add"))
	 {
		 ad=value;
	 }
	 else if (name.equals("city"))
	 {
		 ci=value;
	 }
	 else if (name.equals("state"))
	 {
		 s=value;
	 }
	 else if (name.equals("date"))
	 {
		 dt=value;
	 }
	 else if (name.equals("age"))
	 {
		 ag=value;
	 }
	 else if (name.equals("height"))
	 {
		 h=value;
	 }
	 else if (name.equals("weight"))
	 {
		 w=value;
	 }
	 else if (name.equals("bgrp"))
	 {
		 bg=value;
	 }
	 else if (name.equals("eyecolor"))
	 {
		 ec=value;
	 }
	 else if (name.equals("haircolor"))
	 {
		 hc=value;
	 }
	 else if (name.equals("id"))
	 {
		 cidd=value;
		cid=Integer.parseInt(cidd);
	 }
	 }
	 else
	 {
	 try
	 {
		 
	 itemName = item.getName();
	 //System.out.println(itemName);
	
	 int a=itemName.length();
	 itemName = itemName.replace(File.separatorChar,'/');
	 int sep = itemName.lastIndexOf("/");
	 itemName=itemName.substring(sep+1,a);
	 System.out.println(itemName);
	 File savedFile = new File("C:/shipra/online crime reporting system/WebContent/Imagess/"+itemName);
	 //System.out.println(itemName);
	 
	 item.write(savedFile);
	
	 }
	 catch (Exception e)
	 {
		 //System.out.println("1");
	// out.println("Error"+e.getMessage());
	 }
	 }
	 }
	
	
	 }
	 }
	 catch (Exception e){
	 out.println(e.getMessage());
	 }
//itemName=request.getParameter("file");

//String n=request.getParameter("name");
/*String g=request.getParameter("gender");
String p=request.getParameter("phno");
String a=request.getParameter("add");
String ci=request.getParameter("city");
String s=request.getParameter("state");
String dt=request.getParameter("date");
String ag=request.getParameter("age");
String h=request.getParameter("height");
String w=request.getParameter("weight");
String bg=request.getParameter("bgrp");
String ec=request.getParameter("eyecolor");
String hc=request.getParameter("haircolor");
String cid=request.getParameter("id");
*/




if (conn != null) {
    System.out.println("Connected to database #1");
}
//PreparedStatement pstatement = null;
//System.out.println(itemName);
System.out.println(n);
System.out.println(g);
System.out.println(ph);
System.out.println(ad);
System.out.println(ci);
System.out.println(s);
System.out.println(dt);
System.out.println(ag);
System.out.println(h);
System.out.println(w);
System.out.println(bg);
System.out.println(ec);
System.out.println(hc);
System.out.println(cidd);
 cid=Integer.parseInt(cidd);
 p=Long.parseLong(ph);





//Statement st1=conn.createStatement();

pstatement=conn.prepareStatement ("INSERT INTO personal_information(Image,Name,Gender,Phone,Address,City,State,DOB,Age,Height,Weight,Blood_Group,Eye_Color,Hair_Color,Criminal_ID) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

pstatement.setString(1,itemName);
pstatement.setString(2,n);
pstatement.setString(3,g);
pstatement.setLong(4,p);
pstatement.setString(5,ad);
pstatement.setString(6,ci);
pstatement.setString(7,s);
pstatement.setString(8,dt);
pstatement.setString(9,ag);
pstatement.setString(10,h);
pstatement.setString(11,w);
pstatement.setString(12,bg);
pstatement.setString(13,ec);
pstatement.setString(14,hc);
pstatement.setInt(15,cid);

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
session.setAttribute("Criminal_ID",cidd);
response.sendRedirect("CI.jsp");
}
else
{
	response.sendRedirect("PI.jsp");
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