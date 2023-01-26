<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Details</title>
<link rel="stylesheet" href="details.css">
</head>
<%@page import="java.sql.*,java.util.*"%>
<body>
	<jsp:include page="MHeading.jsp" />
	<h5>
		<pre>
			<a href="criminalrecords.jsp">Criminal Records</a>    <a
				href="complain.jsp">Complains</a>    <a href="PI.jsp">New Record</a>    <a
				href="logout.jsp">Logout</a> </pre>
	</h5>
	<div class="container">
		<%
                    
					String name,gen,phno,add,ct,st,dt,a,ht,wt,bg,ec,hc,cid,im="";
					String noc,cno,toc,c,cd,aoc,ci,s,dof,dc,tof="";
					String sd,ed,jn,sf,cn,cy,tt,cs="";
					String ps,nop,pid,ph,des,exp="";
					String nam,mail,g,phone,ep,date,ad,refid="";
					
					%>
		<%
		if(session==null || session.getAttribute("userid")==null)
		{
			//System.out.println("hii");
			response.sendRedirect("Police login.jsp"); 
		}

		else
		{
			 

		
                    try 
					{
                    	 Class.forName("com.mysql.jdbc.Driver").newInstance();
                    	Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ocrs","root", "");
                    	 if (connection != null) {
                             System.out.println("Connected to database #1");
                         }
                    	 else{
                    		 
                    	 }
                                             Statement psmnt = connection.createStatement();
                                             //Statement psmnt1 = connection.createStatement();
                                             //Statement psmnt2 = connection.createStatement();
                                             //Statement psmnt3 = connection.createStatement();
			
					cid=request.getParameter("cid");
					cno=request.getParameter("cn");
					
					  //cid = (String)session.getAttribute("Criminal_ID");
					 System.out.println(cid);
					 System.out.println(cno);
                        ResultSet rs,rs1;
                        //rs = psmnt.executeQuery("SELECT * from personal_information where criminal_id");
                        //rs = psmnt1.executeQuery("SELECT * from crime_information");
                        //rs = psmnt2.executeQuery("SELECT * from punishment_information");
                        //rs = psmnt3.executeQuery("SELECT * from case_solved_by_information");
                        //rs = psmnt.executeQuery("SELECT * from personal_information,crime_information,punishment_information,case_solved_by_information where personal_information.Criminal_ID=cid and crime_information.Criminal_ID=personal_information.Criminal_ID and punishment_information.Case_No=crime_information.Case_No and case_solved_by_information.Case_No=crime_information.Case_No");
                       /* rs = psmnt.executeQuery ("SELECT * "+ 
                                                
                    "FROM"+
                        "personal_information"+
                    "INNER JOIN"+
                        "crime_information ON crime_information.Criminal_ID = personal_information.Criminal_ID"+
                    "INNER JOIN"+
                        "punishment_information ON  punishment_information.Case_No = crime_information.Case_No"+
                    "INNER JOIN"+
                   "case_solved_by_information ON case_solved_by_information.Case_No = crime_information.Case_No where personal_information.Criminal_ID='"+cid+"'");
                     */ 
                    
                      rs = psmnt.executeQuery("select personal_information.*, crime_information.*,punishment_information.*,case_solved_by_information.*,user_reg.Victim_Name,user_reg.Email,user_reg.Victim_Gender,user_reg.Victim_Phone,user_reg.DOBD,user_reg.Address_of_Victim,user_reg.Reference_ID from personal_information, crime_information, punishment_information,case_solved_by_information,user_reg where crime_information.Case_No='"+cno+"' && case_solved_by_information.Case_No='"+cno+"'&& punishment_information.Case_No='"+cno+"' && personal_information.Criminal_ID='"+cid+"'");
                       //rs1 = psmnt.executeQuery("Select * from victim_information where Reference_ID='"+refid+"'");
                       
                     if (rs.next())
                        {
                    	    im = rs.getString("Image");
                    	    //System.out.println(im);
                            name = rs.getString("Name");
                            gen=rs.getString("Gender");
                            phno=rs.getString("Phone");
                            add=rs.getString("Address");
                            ct=rs.getString("City");
                            st=rs.getString("State");
                            dt=rs.getString("DOB");
                            a=rs.getString("Age");
                            ht=rs.getString("Height");
                            wt=rs.getString("Weight");
                            bg=rs.getString("Blood_Group");
                            ec=rs.getString("Eye_Color");
                            hc=rs.getString("Hair_Color");
                            cid=rs.getString("Criminal_ID");
                        
                            //noc=rs.getString("No_of_Crime");
                            cno=rs.getString("Case_No");
                            toc=rs.getString("Type_of_Case");
                            c=rs.getString("Crime");
                            cd=rs.getString("Description");
                            aoc=rs.getString("Address_of_crime_scene");
                            ci=rs.getString("City");
                            s=rs.getString("State");
                            
                            dof=rs.getString("Date");
                            tof=rs.getString("Time");
                            dc=rs.getString("Date_of_caught");
                       
                            sd=rs.getString("Start_Date");
                            ed=rs.getString("End_Date");
                            jn=rs.getString("Jail_Name");
                            sf=rs.getString("Sentenced_For");
                            cn=rs.getString("Court_Name");
                            cy=rs.getString("City");
                            tt=rs.getString("Time_taken_by_court_to_take_decision");
                            cs=rs.getString("Current_Status");
                        
                        
                            ps=rs.getString("Police_Station");
                            nop=rs.getString("Police_Name");
                            pid=rs.getString("Police_ID");
                            ph=rs.getString("Phone_No");
                            des=rs.getString("Designation");
                            exp=rs.getString("Experience");
                        
                    //rs1 = psmnt.executeQuery("Select user_reg.Victim_Name, user_reg.Email, user_reg.Victim_Gender, user_reg.Victim_Phone, user_reg.DOBD, user_reg.Address_of_Victim, user_reg.Reference_ID from user_reg where Case_No='"+cno+"'");
                    //if (rs1.next())
                    
                            nam=rs.getString("Victim_Name");
                            mail=rs.getString("Email");
                            g=rs.getString("Victim_Gender");
                            phone=rs.getString("Victim_Phone");
                            //ep=rs.getString("Emer_Phn");
                            date=rs.getString("DOBD");
                            ad=rs.getString("Address_of_Victim");
                            refid=rs.getString("Reference_ID");
                            
                        
                        
                           
                           
                           //type=rs.getString("Type_of_case");
                           
                           %>



		<div class="r">
			<fieldset>
				<legend>
					<h2>Personal Information</h2>
				</legend>
				<img src="Imagess/<%=im%>" height="200px" width="200px" class="img"/>
				<pre>
				
Name : <%=name %>
Gender : <%=gen %>
Phone No. <%=phno %> 
Address : <%=add %>
City : <%=ct %>
State : <%=st %>
Date of birth : <%=dt %>
Age : <%=a %>
Height : <%=ht %>
Weight : <%=wt %>
Blood Group : <%=bg %>
Eye Color : <%=ec %>
Hair Color : <%=hc %>
Criminal ID : <%=cid %>
</pre>
			</fieldset>
		</div>
		<div class="r" style="margin-top: 95px">
			<fieldset>
				<legend>
					<h2>Crime Information</h2>
				</legend>
				<pre>

Case No. : <%=cno %>
Type of crime : <%=toc %>
Crime : <%=c %>
Crime Description : <%=cd %>
Address Of Crime : <%=aoc %>
City : <%=ci %>
State : <%=s %>
Date of Crime: <%=dof %>
Time of Crime: <%=tof %>
Date caught : <%=dc %>
</pre>
			</fieldset>
		</div>
		<div class="r" style="margin-top: 5px">
			<fieldset>
				<legend>
					<h2>Punishment Information</h2>
				</legend>
				<pre>
Start Date : <%=sd %>
End Date : <%=ed %>
Jail Name : <%=jn %>
Sentenced For : <%=sf %>
Court Name : <%=cn %>
City : <%=cy %>
Time taken by court to take decision : <%=tt %>
Current Status : <%=cs %>
</pre>
			</fieldset>
		</div>
		<div class="r" style="margin-top: -68px">
			<fieldset>
				<legend>
					<h2>Case Solved By Information</h2>
				</legend>
				<pre>
Police Station : <%=ps %>
Name of officer : <%=nop %>
Police ID : <%=pid %>
Phone Number : <%=ph %>
Designation : <%=des %>
Experience : <%=exp %>
</pre>
			</fieldset>
		</div>
		<div class="r" style="margin-top: -110px">
			<fieldset>
				<legend>
					<h2>Victim Information</h2>
				</legend>
				<pre>
Victim Name : <%=nam %>
Email : <%=mail %>
Gender : <%=g %>
Phone Number : <%=phone %>
Date of Birth : <%=date %>
Address : <%=ad %>
Reference_ID : <%=refid %>
</pre>
			</fieldset>
		</div>
		<%
                        
                        } 
                    
                    }
					
                    catch(Exception e)
                    {
System.out.println(e);
                    }
		}
                        %>
	</div>
</body>
</html>