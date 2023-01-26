<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%
 /*try{
    String un = request.getParameter("username");    
    String psd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from police_login_master where username='" + un + "' and password='" + psd + "'");
    System.out.println(un);
    if (rs.next()) {
        session.setAttribute("username", un);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        //System.out.println("1");
        response.sendRedirect("complain.jsp");
    } else {
       
    	response.sendRedirect("Police login.jsp");
      }
 }

catch(Exception e)
{
	System.out.println(e);
}*/
//String area = request.getParameter("area");

String refno = request.getParameter("rn");
int a=Integer.parseInt(refno);

  //System.out.println(refid);
// System.out.println(a);
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs","root", "");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from user_reg where  Reference_ID='" + a + "'");
if (rs.next()) {
    session.setAttribute("Reference_ID",a );
    //out.println("welcome " + userid);
    //out.println("<a href='logout.jsp'>Log out</a>");
    response.sendRedirect("checkstatus.jsp");
} else {
	%>
	<script>

  

    alert("Login UnSuucessful, Please try again!");
    //response.sendRedirect("alert1.jsp");
    window.location="user login.jsp";
    </script><%
 
    //out.println("Invalid password <a href='user login.jsp'>try again</a>");
}
    %>

</body>
</html>