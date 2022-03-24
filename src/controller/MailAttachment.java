package controller;

import java.io.File;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class MailAttachment {
	public static void send(String to,String subject,String msg,String path){  
	
		 // Recipient's email ID needs to be mentioned.

	      // Sender's email ID needs to be mentioned

	
	      MailCredentials mailCredentials = new MailCredentials();

	      final String username = mailCredentials.getUsername();
	      final String password = mailCredentials.getPassword();
	      	     
	      String host = mailCredentials.getHost();
	      
	      Properties props = mailCredentials.getProperties();

	      // Get the Session object.
	      Session session = getSession(props, username, password);

	      try {
	         // Create a default MimeMessage object.
	         Message message = new MimeMessage(session);

	         // Set From: header field of the header.
	         message.setFrom(new InternetAddress(username));

	         // Set To: header field of the header.
	         message.setRecipients(Message.RecipientType.TO,
	            InternetAddress.parse(to));

	         // Set Subject: header field
	         message.setSubject(subject);

	         // Create the message part
	         BodyPart messageBodyPart = new MimeBodyPart();

	         // Now set the actual message
	         messageBodyPart.setText(subject);

	         // Create a multipar message
	         Multipart multipart = new MimeMultipart();

	         // Set text message part
	         multipart.addBodyPart(messageBodyPart);

	         // Part two is attachment
	         attachMessage(messageBodyPart, path, multipart);

	         // Send the complete message parts
	         message.setContent(multipart);

	         // Send message
	         Transport.send(message);

	         System.out.println("Sent message successfully....");
	  
	      } catch (MessagingException e) {
	         throw new RuntimeException(e);
	      }
	}
	
	// Get the Session object.
	//Refactoring-Extract method
		//Extracted method: [getSession()] 
		//From class: [MailAttachment]
		// Why? -> The block of code dedicated to get the session object, so that can be done by 
		//		   introducing the getSession() method and call that method from the class.
	public static Session getSession(Properties props, String username, String password)
	{
		return Session.getInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(username, password);
					}
				});
	}
	
	
	//Refactoring-Extract method
		//Extracted method: [attachMessage()] 
		//From class: [MailAttachment]
		// Why? -> The block of code dedicated to attach the message to the pdf file, so that can be done by 
		//		   introducing the attachMessage() method and call that method from the class.
	public static void attachMessage(BodyPart messageBodyPart, String path, Multipart multipart)
	{
        messageBodyPart = new MimeBodyPart();
        String filename = path;
        DataSource source = new FileDataSource(filename);
        try {
			messageBodyPart.setDataHandler(new DataHandler(source));
			messageBodyPart.setFileName("Jobcard.pdf");
	        multipart.addBodyPart(messageBodyPart);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        	
	}
}
