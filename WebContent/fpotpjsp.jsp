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
String refno = request.getParameter("otp");
int a=Integer.parseInt(refno);


  //System.out.println(refid);
//out.println(a);
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs","root", "");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from forgot_password where  OneTimePass='" + a + "'");
if (rs.next()) {
   // session.setAttribute("Reference_ID",a );
    //out.println("welcome " + userid);
    //out.println("<a href='logout.jsp'>Log out</a>");
    response.sendRedirect("new password.jsp");
} else {
	%>
	<script>

  

    alert("Wrong OTP, Please try again!");
    //response.sendRedirect("alert1.jsp");
    window.location="forgot password.jsp";
    </script><%
 
    //out.println("Invalid password <a href='user login.jsp'>try again</a>");
}
%>
</body>
</html>