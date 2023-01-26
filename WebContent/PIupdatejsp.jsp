
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*,java.lang.*" %>
<body>
<%
                    //String firstname = request.getParameter("accommodation_name");
					//int id=0;
					String name,gen,phn,add,ct,st,dt,a,ht,wt,bg,ec,hc,cid="null";
					String im,n,g,ph,ci,s,ae="null";
				
					//String type,cid;
					%>
					<%
					
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
					 //im=request.getParameter("file");
					 n=request.getParameter("name");
					 g=request.getParameter("gender");
					 ph=request.getParameter("phno");
					 a=request.getParameter("add");
					 ci=request.getParameter("city");
					 s=request.getParameter("state");
					 dt=request.getParameter("date");
					 ae=request.getParameter("age");
					 ht=request.getParameter("height");
					 wt=request.getParameter("weight");
					 bg=request.getParameter("bgrp");
					 ec=request.getParameter("eyecolor");
					 hc=request.getParameter("haircolor");
					 cid=request.getParameter("id");
					 int dem=Integer.parseInt(cid);
					 //System.out.println(im);
					 System.out.println(n);
					 System.out.println(g);
					 Long p=Long.parseLong(ph);
					 System.out.println(ph);
					 
					 System.out.println(a);
					 System.out.println(ci);
					 System.out.println(s);
					 System.out.println(dt);
					 System.out.println(ae);
					 int ag=Integer.parseInt(ae);
					 System.out.println(ht);
					 int h=Integer.parseInt(ht);
					 System.out.println(wt);
				
					 int w=Integer.parseInt(wt);
					 System.out.println(bg);
					 System.out.println(ec);
					 System.out.println(hc);
					// System.out.println(cid);
					 
					 System.out.println(dem);
					 
					 String sb="UPDATE  personal_information set Name=?,Gender=?,Phone=?,Address=?,City=?,State=?,DOB=?,Age=?,Height=?,Weight=?,Blood_Group=?,Eye_Color=?,Hair_Color=? where Criminal_ID="+dem;
					 //String sb="UPDATE personal_information set Age=? where Criminal_ID="+dem;
					PreparedStatement ps=conn.prepareStatement(sb);
					// System.out.println("11");
					//ps.setString(1,im);
					 ps.setString(1,n);
					 ps.setString(2,g);
					 ps.setLong(3,p);
					 ps.setString(4,a);
					 ps.setString(5,ci);
					 ps.setString(6,s);
					 ps.setString(7,dt);
					 ps.setInt(8,ag);
					 ps.setInt(9,h);
					 ps.setInt(10,w);
					 ps.setString(11,bg);
					 ps.setString(12,ec);
					 ps.setString(13,hc);
					// ps.setInt(1,ag);
					int i= ps.executeUpdate();
					 if(i>0)
					 {
						 session.setAttribute("Criminal_ID",cid);
						 response.sendRedirect("updatedCI.jsp");
					 }
					 else
					 {
						 
					 }
					                        
					                    }    
					                   
					                    
					                    catch(Exception e)
					                    {
					System.out.println(e);
					                    }
					                    
					                        %>

                        
</body>
</html>