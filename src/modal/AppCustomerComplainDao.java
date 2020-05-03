package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AppCustomerComplainDao {

	public static int save(AppCustomerComplain acc){  
		  
        int status=0;  	
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "insert into app_customer_complain(vehicle_number,customer_complain) values (?,?)");  
            
            ps.setString(1, acc.getVehicleNumber());
            ps.setString(2, acc.getCustomerComplain());
              
            status=ps.executeUpdate();   
            System.out.println(status);
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }
	public static int deleteById(int complain_id)
	{
		int status=0;
		try{
			Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("delete from app_customer_complain where complain_id='"+complain_id+"' ");
             status = ps.executeUpdate();
            con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return status;
	}
public static List<AppCustomerComplain> getAll(String vehicle_number)
{
	List<AppCustomerComplain> list = new ArrayList<AppCustomerComplain>();
	try{
		 Connection con=ConnectionDb.getConnection();  
         PreparedStatement ps=con.prepareStatement("select * from app_customer_complain where vehicle_number ='"+vehicle_number+"'");
         ResultSet rs = ps.executeQuery();
         while(rs.next())
         {
        	 AppCustomerComplain acc = new AppCustomerComplain();
        	
        	 acc.setCustomerComplain(rs.getString("customer_complain"));
        	 acc.setVehicleNumber(rs.getString("vehicle_number"));
        	 list.add(acc);
         }
		}catch(Exception e){e.printStackTrace();}
	return list;
}
public static int delete(String vehicle_number)
{
	int status=0;
	try{
		Connection con=ConnectionDb.getConnection();  
        PreparedStatement ps = con.prepareStatement("delete from app_customer_complain where vehicle_number='"+vehicle_number+"' ");
         status = ps.executeUpdate();
        con.close();
	}
	catch(Exception e){e.printStackTrace();}
	return status;
}
	
}
