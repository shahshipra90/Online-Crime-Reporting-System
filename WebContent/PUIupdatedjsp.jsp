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
		
					String s=request.getParameter("start");
					String e=request.getParameter("end");
					String j=request.getParameter("jail");
					String se=request.getParameter("sent");
					String c=request.getParameter("court");
					String ci=request.getParameter("city");
					String d=request.getParameter("decision");
					String sta=request.getParameter("status");
					String cno=request.getParameter("caseno");

					System.out.println(s);
					System.out.println(e);
					System.out.println(j);
					System.out.println(se);
					System.out.println(c);
					System.out.println(ci);
					System.out.println(d);
					System.out.println(sta);
					System.out.println(cno);
					
					 int nc=Integer.parseInt(cno);
					 
				
					
					  
					 //System.out.println(cid);
					 
					 String sb="UPDATE  punishment_information set  Start_Date=?,End_Date=?,Jail_Name=?,Sentenced_For=?,Court_Name=?,City=?,Time_taken_by_court_to_take_decision=?,Current_Status=? where Case_No="+nc;
					 //String sb="UPDATE personal_information set Age=? where Criminal_ID="+dem;
					PreparedStatement pstatement=conn.prepareStatement(sb);
					// System.out.println("11");
					
pstatement.setString(1,s);
pstatement.setString(2,e);
pstatement.setString(3,j);
pstatement.setString(4,se);
pstatement.setString(5,c);
pstatement.setString(6,ci);
pstatement.setString(7,d);
pstatement.setString(8,sta);
//pstatement.setString(9,cno);
int i= pstatement.executeUpdate();
if(i>0)
{
	session.setAttribute("Case_No",nc);
	 response.sendRedirect("updatedCSB.jsp");
	 
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