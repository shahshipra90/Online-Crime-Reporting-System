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
					
				String cno="null";
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
					//String cid=request.getParameter("idd");
					System.out.println(cn);
					 int nc=Integer.parseInt(cn);

					//System.out.println(c);
					
					System.out.println(cr);
					System.out.println(cd);
					System.out.println(cs);
					System.out.println(ci);
					System.out.println(s);
					System.out.println(dt);
					System.out.println(t);
					System.out.println(dc);
					//System.out.println(cid);
					//System.out.println(cid);
					 
				
					
					  
					 //System.out.println(cid);
					 
					 String sb="UPDATE  crime_information set Case_No=?, Type_of_case=?,Crime=?,Description=?,Address_of_crime_scene=?,City=?,State=?,Date=?,Time=?,Date_of_caught=? where Case_No="+cn;
					 //String sb="UPDATE personal_information set Age=? where Criminal_ID="+dem;
					PreparedStatement ps=conn.prepareStatement(sb);
					// System.out.println("11");
					
ps.setString(1,cn);
ps.setString(2,c);
ps.setString(3,cr);
ps.setString(4,cd);
ps.setString(5,cs);
ps.setString(6,ci);
ps.setString(7,s);
ps.setString(8,dt);
ps.setString(9,t);
ps.setString(10,dc);
//ps.setString(11,cid);
int i= ps.executeUpdate();
if(i>0)
{
	session.setAttribute("Case_No",nc); 
	response.sendRedirect("updatedPUI.jsp");
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