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
String userid = request.getParameter("username");

String pwd = request.getParameter("password");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs","root", "");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from police_login_master where username='" + userid + "' and password='" + pwd + "'");
if (rs.next()) {
    session.setAttribute("userid", userid);
    //out.println("welcome " + userid);
    //out.println("<a href='logout.jsp'>Log out</a>");
    //session.setAttribute("username",userid);
    response.sendRedirect("complain.jsp");
} else {%>
<script>



alert("Login UnSuucess!");
//response.sendRedirect("alert1.jsp");
window.location="Police login.jsp";
</script><%

    //out.println("Invalid password <a href='Police login.jsp'>try again</a>");
}
    %>

</body>
</html>