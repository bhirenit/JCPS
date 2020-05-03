package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AppServiceDao {

	public static int save(AppService as){  
        int status=0;  
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "insert into app_service(vehicle_number,service_id,service_name,service_details,service_price) values (?,?,?,?,?)");  
            ps.setString(1,as.getVehicleNumber());	        
            ps.setInt(2, as.getServiceId());
            ps.setString(3,as.getServiceName()); 
            ps.setString(4,as.getServiceDetails());
            ps.setInt(5,as.getServicePrice());
             	        
            status=ps.executeUpdate();      
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    } 
	
	 public static List<AppService> getByNumber(String vehicle_number)
		{
			List<AppService> list=new ArrayList<AppService>();
			try{
				Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select * from app_service where vehicle_number='"+vehicle_number+"' ");
	            ResultSet rs = ps.executeQuery();
	            while(rs.next())
	            {
	            	AppService js=new AppService();
	            	js.setServiceId(rs.getInt("service_id"));
	            	js.setServiceName(rs.getString("service_name"));
	            	js.setServiceDetails(rs.getString("service_details"));
	            	js.setServicePrice(rs.getInt("service_price"));
	            	js.setVehicleNumber(rs.getString("vehicle_number"));
	            	
	            	list.add(js);
	            }
	            con.close();
			}
			catch(Exception e){e.printStackTrace();}
			return list;
		}
	 
	 public static int deleteById(String vehicle_number ,int service_id )
		{
			int status=0;
			try{
				Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("delete from app_service where vehicle_number='"+vehicle_number+"' and service_id='"+service_id+"' ");
	             status = ps.executeUpdate();
	            con.close();
			}
			catch(Exception e){e.printStackTrace();}
			return status;
		}
	
	
}
