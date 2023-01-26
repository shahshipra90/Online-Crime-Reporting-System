package CNMail;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;


import SendMail.Mailer;

/**
 * Servlet implementation class CNMail
 */
@WebServlet("/CNMail")
public class CNMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CNMail() {
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
		String id = request.getParameter("id");
		try 
		{
        	//Connection conn = null;
        	 Class.forName("com.mysql.jdbc.Driver").newInstance();
        	Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ocrs","root", "");
        	 if (conn != null) {
                 System.out.println("Connected to database #1");
             }
        	 else{
        		 
        	 }
        		Statement psmnt = (Statement) conn.createStatement();
        		String rno=request.getParameter("refid");
        		System.out.println(rno);
//        		/int rid=Integer.parseInt(rno);
        		 String sb="UPDATE  user_reg set  complain_status=?, Case_No=? where Reference_ID="+rno;
				 //String sb="UPDATE personal_information set Age=? where Criminal_ID="+dem;
				PreparedStatement pstatement=(PreparedStatement) conn.prepareStatement(sb);
				
				pstatement.setString(1,"Reported");
				pstatement.setString(2,id);
				int i= pstatement.executeUpdate();
				if(i>0)
				{
					 //response.sendRedirect(".jsp");
					//System.out.print("done");
					 
				}
				else
				{
					System.out.print("not");
				}
				                       
				                   }    
				                  
				                   
				                   catch(Exception e)
				                   {
				System.out.println(e);
				                   }
				                   
		
		response.setContentType("text/html");
		String m = request.getParameter("mail");
		
		//String message = "data inserted successfully!!!!";
		  PrintWriter out = response.getWriter();  
	      
		   
		    String subject="OCRS"; 
		    id  = "Your Case Number is : " +id;  
		    //String msg=request.getParameter("msg");  
		    //out.print("done");
		    CNemail.send(m, subject, id);
		    		      
		    out.println("<script type=\"text/javascript\">");
		    out.println("alert('Complain Reported!');");
		    out.println("location='complain.jsp';");
		    out.println("</script>");
		    //out.print("message has been sent successfully");  
		    out.close(); 
		//session.setAttribute("Case_No",cno);
		//response.sendRedirect("complain.jsp);
		
		
	}

}
