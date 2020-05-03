package modal;

import java.sql.*;


public class ConnectionDb {
	
		 public static Connection getConnection(){  
		        Connection con=null;  
		        try{  
		            Class.forName("com.mysql.jdbc.Driver");  
		            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/jcps","root","");
		        }catch(Exception e){System.out.println(e);}  
		        return con; 
		    }


	}


