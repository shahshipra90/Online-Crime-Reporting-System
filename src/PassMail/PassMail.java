package PassMail;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import SendMail.Mailer;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class PassMail
 */
@WebServlet("/PassMail")
public class PassMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PassMail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html"); 
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		//PreparedStatement pstatement = null;
		Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs", "root", "");
		Statement st=(Statement) conn.createStatement();
		String mail=request.getParameter("mail");
		String id=request.getParameter("id");
		if (conn != null) {
		    System.out.println("Connected to database #1");
		}
		System.out.println(mail);
		System.out.println(id);
		PreparedStatement pstatement = null;
		pstatement=(PreparedStatement) conn.prepareStatement ("INSERT INTO forgot_password(Mailid,OneTimePass) values (?,?)");

		pstatement.setString(1,mail);
		pstatement.setString(2,id);
		int i= pstatement.executeUpdate();
		if(i>0)
		{
		String message = "data inserted successfully!!!!";
		 PrintWriter out = response.getWriter();  
	      
		    //String a=request.getParameter("to");  
		    String subject="OCRS";  
		    //String msg=request.getParameter("msg");  
		      id  = "Your Confirmation code : " +id;    
		    fpemail.send(mail, subject, id);  
		   // out.print("message has been sent successfully");  
		   out.println("<script type=\"text/javascript\">");
		    //out.println("alert('Your complain will be reported soon!');");
		    out.println("location='fpotp.jsp';");
		    out.println("</script>");
		    out.close(); 
		   // alert("Wrong OTP, Please try again!");
		
		//response.sendRedirect("fpotp.jsp");
		}
		else
		{
			 PrintWriter out = null;
			out.println("<script type=\"text/javascript\">");
			    //out.println("alert('Your complain will be reported soon!');");
			    out.println("location='forgot password.jsp';");
			    out.println("</script>");
			//response.sendRedirect("forgot password.jsp");
		}
		}
		catch(Exception e)
		{
			System.out.print(e);
		}

	}

}
