	package SendMail;
	
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
	
	/**
	 * Servlet implementation class SendMail
	 */
	@WebServlet("/SendMail")
	public class SendMail extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
	    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMail() {
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
		String n=request.getParameter("name");
		String e=request.getParameter("email");
		String g=request.getParameter("gender");
		String p=request.getParameter("phnno");
		String ph=request.getParameter("phno");
		String d=request.getParameter("dob");
		String a=request.getParameter("add");
		String ar=request.getParameter("area");
		String c=request.getParameter("crime");
		String cd=request.getParameter("desc");
		String add=request.getParameter("addr");
		String dt=request.getParameter("date");
		String t=request.getParameter("time");
		String r=request.getParameter("refid");
		String sta=request.getParameter("status");
		if (conn != null) {
		    System.out.println("Connected to database #1");
		}
		PreparedStatement pstatement = null;
		System.out.println(n);
		System.out.println(e);
		System.out.println(g);
		System.out.println(p);
		System.out.println(ph);
		System.out.println(d);
		System.out.println(a);
		System.out.println(ar);
		System.out.println(c);
		System.out.println(cd);
		System.out.println(add);
		System.out.println(dt);
		System.out.println(t);
		Statement st1=(Statement) conn.createStatement();

		pstatement=(PreparedStatement) conn.prepareStatement ("INSERT INTO user_reg (Victim_Name,Email,Victim_Gender,Victim_Phone,Emergency_Phone,DOBD,Address_of_Victim,Area_of_Police_Station,Crime,Crime_Description,Address_of_Crime_Scene,Date_of_Crime,Time_of_Crime,Reference_ID,Status) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

		pstatement.setString(1,n);
		pstatement.setString(2,e);
		pstatement.setString(3,g);
		pstatement.setString(4,p);
		pstatement.setString(5,ph);
		pstatement.setString(6,d);
		pstatement.setString(7,a);
		pstatement.setString(8,ar);
		pstatement.setString(9,c);
		pstatement.setString(10,cd);
		pstatement.setString(11,add);
		pstatement.setString(12,dt);
		pstatement.setString(13,t); 
		pstatement.setString(14,r); 
		pstatement.setString(15,"Unsolved");
		//pstatement.setString(14,"null");
		int i= pstatement.executeUpdate();

		/*	
		int i=st.executeUpdate ("INSERT INTO user_reg(Victim_Name, Email,Gender,Victim's_Phone,Emergency_Phone,DOB,Address_of_Victim,Area_of_Police_Station,Crime,Crime_Description,Address_of_Crime_Scene,Date_of_Crime,Time_of_Crime) VALUES ('"+n+"', '"+e+"','"+g+"','"+p+"','"+ph+"','"+d+"','"+a+"','"+ar+"','"+c+"','"+cd+"','"+add+"','"+dt+"','"+t+"')");
		*/
		//int i=st1.executeUpdate("INSERT INTO user_reg(Victim_Name, Email,Gender,Victim's_Phone,Emergency_Phone,DOB,Address_of_Victim,Area_of_Police_Station,Crime,Crime_Description,Address_of_Crime_Scene,Date_of_Crime,Time_of_Crime) VALUES ('"+n+"', '"+e+"','"+g+"','"+p+"','"+ph+"','"+d+"','"+a+"','"+ar+"','"+c+"','"+cd+"','"+add+"','"+dt+"','"+t+"')");
		/*
		if(i>0)
		{
		String message = "data inserted successfully!!!!";
		response.sendRedirect("thanku.jsp");
		}
		else
		{
			response.sendRedirect("reg1.jsp");
		}
		*/
		if(i>0)
		{
		String message = "data inserted successfully!!!!";
		 PrintWriter out = response.getWriter();  
	      
		    //String a=request.getParameter("to");  
		    String subject="OCRS";  
		    //String msg=request.getParameter("msg");  
		    r  = "Your Reference ID is : " +r;  
		    Mailer.send(e, subject, r);  
		   // out.print("message has been sent successfully");  
		    out.println("<script type=\"text/javascript\">");
		    out.println("alert('Your complain will be reported soon!');");
		    out.println("location='Instruction Page.jsp';");
		    out.println("</script>");
		    out.close(); 
		    //request.setAttribute("Reference_Id",r)
;		   // alert("Wrong OTP, Please try again!");
		
		//response.sendRedirect("thanku.jsp");
		}
		else
		{
			response.sendRedirect("reg1.jsp");
		}
		}
		catch(Exception e)
		{
			System.out.print(e);
		}
	}

}
