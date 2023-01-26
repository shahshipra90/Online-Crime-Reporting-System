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
                    		String rno=request.getParameter("ci");
                    		System.out.println(rno);
                    		int rid=Integer.parseInt(rno);
                    		 String sb="UPDATE  user_reg set  Status=? where Reference_ID="+rid;
        					 //String sb="UPDATE personal_information set Age=? where Criminal_ID="+dem;
        					PreparedStatement pstatement=conn.prepareStatement(sb);
        					
        					pstatement.setString(1,"Solved");
        					int i= pstatement.executeUpdate();
        					if(i>0)
        					{
        						 response.sendRedirect("PI.jsp");
        						 
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