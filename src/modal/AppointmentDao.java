package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDao {

	public static int save(Appointment app){  
		  
        int status=0;  	
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "insert into appointment(vehicle_number) values (?)");  
            
            ps.setString(1, app.getVehicleNumber());
            
            status=ps.executeUpdate();   
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
	}
	
	public static int update(Appointment app){  
		  
        int status=0;  	
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=con.prepareStatement("update appointment set work_type='"+app.getWorkType()+"' , request_date = '"+app.getRequestDate()+"',running_km = '"+app.getRunningKM()+"',request_time = '"+app.getRequestTime()+"' where vehicle_number = '"+app.getVehicleNumber()+"' ");  
            
            status=ps.executeUpdate();   
            System.out.println(status);
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }
	
	 public static int getCount()
	 {
		  int count = 0;
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select * from appointment") ;
	            
	             
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	count++;
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return count;
	 }
	
	 public static List<Appointment> getList()
	 {
		 List<Appointment> list=new ArrayList<Appointment>();  
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select * from appointment ") ;
	            
	             
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	Appointment app = new Appointment();
	            	app.setVehicleNumber(rs.getString("vehicle_number"));
	            	app.setRequestDate(rs.getString("request_date"));
	            	app.setRequestTime(rs.getString("request_time"));
	            	app.setRunningKM(rs.getInt("running_km"));
	            	app.setWorkType(rs.getString("work_type"));
	            	list.add(app);
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return list;
	 }
	 
	 public static Appointment getAll()
	 {
		 Appointment app = new Appointment();
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select * from appointment") ;
	            
	             
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	
	            	app.setVehicleNumber(rs.getString("vehicle_number"));
	            	app.setRequestDate(rs.getString("request_date"));
	            	app.setRequestTime(rs.getString("request_time"));
	            	app.setRunningKM(rs.getInt("running_km"));
	            	app.setWorkType(rs.getString("work_type"));
	            	
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return app;
	 }
	
	 public static void delete(String vehicle_number)
		{
			try{Connection con=ConnectionDb.getConnection();  

	        PreparedStatement ps = con.prepareStatement("delete from app_lubricant where vehicle_number='"+vehicle_number+"'");

	        PreparedStatement ps1 = con.prepareStatement("delete from app_service where vehicle_number='"+vehicle_number+"'");

	        PreparedStatement ps2 = con.prepareStatement("delete from app_customer_complain where vehicle_number='"+vehicle_number+"'");
	        
	        PreparedStatement ps3 = con.prepareStatement("delete from appointment where vehicle_number='"+vehicle_number+"'");
	        
	       int status1=ps.executeUpdate();
	       int status2=ps1.executeUpdate();
	       int status3=ps2.executeUpdate();
	       int status4=ps3.executeUpdate();
	        if(status1>0&&status2>0&&status3>0&&status4>0){  
	        	System.out.println("Deleted");        	
	        }  
	        con.close();  
	    }catch(Exception e){e.printStackTrace();}
		}
	
	 public static boolean checkVehicleNumberAppointment(String vehicle_number) {
			boolean b = false;
			try{
				 Connection con=ConnectionDb.getConnection();  
		         PreparedStatement ps=con.prepareStatement("select vehicle_number from jobcard_info where vehicle_number ='"+vehicle_number+"'");
		         ResultSet rs = ps.executeQuery();
		         if(rs.next())
		         {
		          b = true;
		         }
				}catch(Exception e){e.printStackTrace();}
				return b;
		}  
	 
}
