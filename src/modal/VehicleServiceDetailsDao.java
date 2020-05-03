package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class VehicleServiceDetailsDao {

	public static List<VehicleServiceDetails> getServices(int model_varient_id)
	{
	List<VehicleServiceDetails> list=new ArrayList<VehicleServiceDetails>();  
    try{  
        Connection con=ConnectionDb.getConnection();  
        PreparedStatement ps = con.prepareStatement("select * from vehicle_service_details where model_varient_id='"+model_varient_id+"'") ;
        ResultSet rs = ps.executeQuery();
        int i =0;
        while(rs.next()){  
        	VehicleServiceDetails vsd = new VehicleServiceDetails();
        	vsd.setServiceId(rs.getInt("service_id"));
        	vsd.setServiceName(rs.getString("service_name"));
        	vsd.setServicePrice(Integer.parseInt(rs.getString("service_price")));
        	vsd.setServiceValidity(rs.getInt("service_validity"));  
        	vsd.setServiceDetails(rs.getString("service_details"));
        	vsd.setModelVarientId(rs.getInt("model_varient_id"));
        	vsd.setServiceValidityKm(rs.getInt("service_validity_km"));
        	
        	list.add(vsd);
        }  
        con.close();  
    }catch(Exception e){e.printStackTrace();}  
    return list;  
}
	
	public static List<VehicleServiceDetails> getSuggestionByKm(int running_km,int model_varient_id,String vehicleNumber)
	{
		History h =	HistoryDao.getAllByNumber(vehicleNumber);
		int pre_running_km = h.getRunningKM();
		int diff = running_km - pre_running_km;
	List<VehicleServiceDetails> list=new ArrayList<VehicleServiceDetails>();  
    try{  
        Connection con=ConnectionDb.getConnection();  
        PreparedStatement ps = con.prepareStatement("select * from vehicle_service_details where vehicle_service_details.model_varient_id = ? AND vehicle_service_details.service_validity_km <= ? ") ;
        ps.setInt(1, model_varient_id);
        ps.setInt(2, diff);
        ResultSet rs = ps.executeQuery();
        int i =0;
        while(rs.next()){  
        	VehicleServiceDetails vsd = new VehicleServiceDetails();
        	vsd.setServiceId(rs.getInt("service_id"));
        	vsd.setServiceName(rs.getString("service_name"));
        	vsd.setServicePrice(Integer.parseInt(rs.getString("service_price")));
        	vsd.setServiceValidity(rs.getInt("service_validity"));  
        	vsd.setServiceDetails(rs.getString("service_details"));
        	vsd.setModelVarientId(rs.getInt("model_varient_id"));
        	vsd.setServiceValidityKm(rs.getInt("service_validity_km"));
        	
        	list.add(vsd);
        }  
        con.close();  
    }catch(Exception e){e.printStackTrace();}  
    return list;  
}
	
	
	
	
	public static VehicleServiceDetails getServicesById(int service_id)
	{
		VehicleServiceDetails vsd=new VehicleServiceDetails();  
    try{  
        Connection con=ConnectionDb.getConnection();  
        PreparedStatement ps = con.prepareStatement("select * from vehicle_service_details where service_id='"+service_id+"'") ;
        ResultSet rs = ps.executeQuery();
        while(rs.next()){  
        	vsd.setServiceId(rs.getInt("service_id"));
        	vsd.setServiceName(rs.getString("service_name"));
        	vsd.setServicePrice(Integer.parseInt(rs.getString("service_price")));
        	vsd.setServiceValidity(rs.getInt("service_validity"));  
        	vsd.setServiceValidityKm(rs.getInt("service_validity_km"));
        	vsd.setServiceDetails(rs.getString("service_details"));
        	vsd.setModelVarientId(rs.getInt("model_varient_id"));
        }  
        con.close();  
    }catch(Exception e){e.printStackTrace();}  
    return vsd;  
}
	public static List<String> getServiceList(int model_varient_id)
	{
		List<String> list=new ArrayList<String>();  
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("select service_name from vehicle_service_details where model_varient_id=?") ;
            ps.setInt(1, model_varient_id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){  
            	String service;
            	service = rs.getString("service_name");
            	list.add(service);
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
        return list;  
	}
	public static List<VehicleServiceDetails> getAllservices()
	{
		List<VehicleServiceDetails> list=new ArrayList<VehicleServiceDetails>();
		try{
			Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("select * from vehicle_service_details");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
            	VehicleServiceDetails vsd = new VehicleServiceDetails();
            	vsd.setServiceId(rs.getInt("service_id"));
            	vsd.setServiceName(rs.getString("service_name"));
            	vsd.setServicePrice(Integer.parseInt(rs.getString("service_price")));
            	vsd.setServiceValidity(rs.getInt("service_validity"));  
            	vsd.setServiceValidityKm(rs.getInt("service_validity_km"));
            	vsd.setServiceDetails(rs.getString("service_details"));
            	vsd.setModelVarientId(rs.getInt("model_varient_id"));
            	list.add(vsd);
            }
            con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return list;
	}
	
	public static int save(VehicleServiceDetails vsd) {
		int status = 0;

		try{  
            java.sql.Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=(PreparedStatement) con.prepareStatement(  
                         "insert into vehicle_service_details (service_name, service_price, service_details, service_validity, model_varient_id,service_validity_km) values (?, ?, ?,?,?, ?)");  
            
            ps.setString(1, vsd.getServiceName());
            ps.setInt(2, vsd.getServicePrice());
            ps.setString(3, vsd.getServiceDetails());
            ps.setInt(4, vsd.getServiceValidity());
            ps.setInt(5, vsd.getModelVarientId());
            ps.setInt(6,vsd.getServiceValidityKm());
              
            status=ps.executeUpdate();   
            System.out.println(status);
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
	}
	
	public static List<VehicleServiceDetails> getServicesByVarientId(int vid) {
		List<VehicleServiceDetails> list = new ArrayList<VehicleServiceDetails>();
		try {
			java.sql.Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=(PreparedStatement) con.prepareStatement("select * from vehicle_service_details where model_varient_id = ?");
            ps.setInt(1, vid);
            java.sql.ResultSet rs = ps.executeQuery();
            int i =0;
            while(rs.next()){  
                VehicleServiceDetails vsd = new VehicleServiceDetails();
                vsd.setServiceId(rs.getInt("service_id"));
            	vsd.setServiceName(rs.getString("service_name"));
            	vsd.setServicePrice(rs.getInt("service_price")); 
            	vsd.setServiceDetails(rs.getString("service_details"));
            	vsd.setServiceValidity(rs.getInt("service_validity"));  
            	vsd.setServiceValidityKm(rs.getInt("service_validity_km"));        	
            	vsd.setModelVarientId(rs.getInt("model_varient_id"));
            	list.add(vsd);
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
        	return list; 
    }

    public static int deleteServiceById(int service_id) {
    	int status = 0;
        try {
            java.sql.Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=(PreparedStatement) con.prepareStatement(  
                         "delete from vehicle_service_details where service_id = ?");
                         
            ps.setInt(1, service_id);

            status=ps.executeUpdate();   
            System.out.println(status);
            con.close();              
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }
	
	
	
	
}
