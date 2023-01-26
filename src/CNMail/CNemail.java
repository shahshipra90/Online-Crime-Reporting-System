package CNMail;
import java.util.Properties;  

import javax.mail.*;  
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeMessage; 
public class CNemail {

	public static void send(String to, String subject, String msg) {
		// TODO Auto-generated method stub
		  
				final String user="shahshipra1999@gmail.com";//change accordingly  
				final String pass="Mumbaicalling";  
				  
				//1st step) Get the session object    
				Properties props = new Properties();  
				 // String host = "localhost";
				  String host = "localhost";
				  props.setProperty("mail.smtp.host", host);
				props.put("mail.smtp.host","smtp.gmail.com");//change accordingly  
				props.put("mail.smtp.auth", "true");  
				
				props.put("mail.smtp.starttls.enable", "true");	
				   props.put("mail.smtp.port", "587");
				Session session = Session.getDefaultInstance(props,  
				 new javax.mail.Authenticator() {  
				  protected PasswordAuthentication getPasswordAuthentication() {  
				   return new PasswordAuthentication(user,pass);  
				   }  
				});  
				//2nd step)compose message  
				try {  
				 MimeMessage message = new MimeMessage(session);  
				 message.setFrom(new InternetAddress(user));  
				 message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
				 message.setSubject(subject);  
				 message.setText(msg);  
				   
				 //3rd step)send message  
				 Transport.send(message);  
				  
				 System.out.println("Done");  
				  
				 } catch (MessagingException e) {  
				    throw new RuntimeException(e);  
				 }  
				      
				}  
				

	}


