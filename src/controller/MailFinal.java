package controller;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.util.*;

public class MailFinal {
		public static void send(String to,String subject,String msg){  
			  
			final String user="vgecit2020@gmail.com";//change accordingly  
			final String pass="16017011600132";  
			  
			//1st step) Get the session object    
			Properties ps = new Properties();  
			ps.put("mail.smtp.host", "smtp.gmail.com");//change accordingly  
			ps.put("mail.smtp.auth", "true");
			ps.put("mail.smtp.starttls.enable","true");
			ps.put("mail.smtp.port", 587); 
			Session session = Session.getDefaultInstance(ps,  
			 new javax.mail.Authenticator() {  
			  protected PasswordAuthentication getPasswordAuthentication() {  
			   return new PasswordAuthentication(user,pass);  
			   }  
			});   
			try {  
				
					MimeMessage message = new MimeMessage(session);  
					message.setFrom(new InternetAddress(user));  
					message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
					message.setSubject(subject);  
					message.setContent(msg,"text/html");  
					Transport.send(message);  
					System.out.println("Done");  
			 } catch (MessagingException e) {  
			    throw new RuntimeException(e);  
			 }
		  }

}
