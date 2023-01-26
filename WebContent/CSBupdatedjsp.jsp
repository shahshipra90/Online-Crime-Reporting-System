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
					String p=request.getParameter("ps");
					String n=request.getParameter("nof");
					String pi=request.getParameter("pid");
					String ph=request.getParameter("pno");
					String d=request.getParameter("desg");
					String e=request.getParameter("exp");
					String cno=request.getParameter("caseno");

					System.out.println(p);
					System.out.println(n);
					System.out.println(pi);
					System.out.println(ph);
					System.out.println(d);
					System.out.println(e);
					System.out.println(cno);
					int nc=Integer.parseInt(cno);
					 
					System.out.println(nc); 
				
					
					  
					 //System.out.println(cid);
					 
					 String sb="UPDATE  case_solved_by_information set  Police_Station=?,Police_Name=?,Police_ID=?,Phone_No=?,Designation=?,Experience=? where Case_No="+nc;
					 //String sb="UPDATE personal_information set Age=? where Criminal_ID="+dem;
					PreparedStatement pstatement=conn.prepareStatement(sb);
					// System.out.println("11");
					
pstatement.setString(1,p);
pstatement.setString(2,n);
pstatement.setString(3,pi);
pstatement.setString(4,ph);
pstatement.setString(5,d);
pstatement.setString(6,e);
int i= pstatement.executeUpdate();
if(i>0)
{
	%>
	<script>

  

    alert("Data Updated Succesfully!");
    //response.sendRedirect("alert1.jsp");
    window.location="criminalrecords.jsp";
    </script><%
 
	//session.setAttribute("Case_No",nc);
	 //response.sendRedirect("updatedvictim.jsp");
	 
}
else
{%>
<script>



alert("Something went wrong, Please try again!");
//response.sendRedirect("alert1.jsp");
window.location="updatedCSB.jsp";
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