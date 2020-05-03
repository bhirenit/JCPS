package schedule;

import java.util.TimerTask;
import javaConstants.Constants;

public class Testing extends TimerTask
{

	public void run()
	{
				
                GMailServer sender = new GMailServer(Constants.setFrom, Constants.setPassword);
	            try {
			    sender.sendMail(Constants.subject,Constants.msg,Constants.setFrom,Constants.emailTO);
			    Constants.count++;
			    
			}
                   catch (Exception e) {
			     e.printStackTrace();
			}  
	            	
				System.out.println("Email Sent Succesfully...");
				if(Constants.count>=2)
					this.cancel();

	        }
}