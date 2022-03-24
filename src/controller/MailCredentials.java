package controller;
import java.util.Properties;

//Refactoring-Extract Class: 
//Extracted class: [MailCredentials] 
//From 		class: [MailAttachment]
//Why? -> MailAttachment class contains the functionality to attach the messsage to the mail body, that needs the 
//		  Session object to connect with the current session, so in that case credentials are not the integral part of
//		  MailAttachment class. Because of that MailCredentials class is extracted from MailAttachment to handle
//		  Credential information.

public class MailCredentials {
	final String username = "vgecit2020@gmail.com";//change accordingly
    final String password = "16017011600132";//change accordingly
    String host = "smtp.gmail.com";
	Properties properties;
    
	public String getUsername()
	{
		return username;
	}
	
	public String getPassword()
	{
		return password;
	}
	
	public String getHost()
	{
		return this.host;
	}
	
	public Properties getProperties()
	{
		Properties props = new Properties();
	      props.put("mail.smtp.auth", "true");
	      props.put("mail.smtp.starttls.enable", "true");
	      props.put("mail.smtp.host", host);
	      props.put("mail.smtp.port", "587");
	      return props;
	}
}
