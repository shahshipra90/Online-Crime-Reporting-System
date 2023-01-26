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
		
					//Statement st=conn.createStatement();
					String p=request.getParameter("pass");
					String cp=request.getParameter("cpass");
					
					//String ps="";

					
					//.out.println(p);
					//int pw=Integer.parseInt(p);
					 
					 
				
					
					  
					 //System.out.println(cid);
					 if(p.equals(cp))
					 {
					 String sb="UPDATE  police_login_master set  password=?";
					 //String sb="UPDATE personal_information set Age=? where Criminal_ID="+dem;
					PreparedStatement pstatement=conn.prepareStatement(sb);
					// System.out.println("11");
					
pstatement.setString(1,p);

int i= pstatement.executeUpdate();
					 
					// int i;
					 if(i>0)
{
	
	 response.sendRedirect("Police login.jsp");
	 
}
					 else{}
}
					 else{%>
<script>



alert("Password doesn't match, please enter again!");
//response.sendRedirect("alert1.jsp");
window.location="new password.jsp";
</script><%

	 
}
                       
                   }    
                  
                   
                   catch(Exception e)
                   {
System.out.println(e);
                   }
					
                       %>
</body>
</html>