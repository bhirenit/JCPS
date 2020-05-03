package schedule;

import javaConstants.Constants;

public class ReadPropertiesFile
{
	public  static void readConfig(String to, String msg , String subject) throws Exception
	{
		try
		{

		    Constants.setFrom = "vgecit2020@gmail.com";
		    Constants.setPassword = "16017011600132";
		    Constants.emailTO = to;	 
		    Constants.msg = msg ;
		    Constants.subject = subject;

		}
		catch(Exception e)
		{
            throw new Exception(e);
		}

	}

}