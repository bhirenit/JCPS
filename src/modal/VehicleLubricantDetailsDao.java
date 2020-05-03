package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class VehicleLubricantDetailsDao {

	public static int save(VehicleLubricantDetails vld){  
		  
        int status=0;  
        try{  
        	Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=(PreparedStatement) con.prepareStatement(  
                         "insert into vehicle_lubricant_details (lubricant_name, lubricant_price, lubricant_quantity, lubricant_labour,lubricant_validity, model_varient_id,lubricant_validity_km,lubricant_validity_km) values (?, ?, ?,?, ?, ?,?,?)");  
            
            ps.setString(1, vld.getLubricantName());
            ps.setInt(2, vld.getLubricantPrice());
            ps.setInt(3, vld.getLubricantQuantity());
            ps.setInt(4, vld.getLubricantLabour());
            ps.setInt(5, vld.getLubricantValidity());
            ps.setInt(6, vld.getModelVarientid());
            ps.setInt(7,vld.getLubricantValidityKm());
            ps.setBoolean(8, vld.isLubricantSuggestflag());
              
            status=ps.executeUpdate();     
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }
	public static List<VehicleLubricantDetails> getLubricants(int model_varient_id)
	{
	List<VehicleLubricantDetails> list=new ArrayList<VehicleLubricantDetails>();  
    try{  
        Connection con=ConnectionDb.getConnection();  
        PreparedStatement ps = con.prepareStatement("select * from vehicle_lubricant_details where model_varient_id='"+model_varient_id+"'") ;
        ResultSet rs = ps.executeQuery();
        while(rs.next()){  
        	VehicleLubricantDetails vld = new VehicleLubricantDetails();
        	vld.setLubricantId(rs.getInt("lubricant_id"));
        	vld.setLubricantName(rs.getString("lubricant_name"));
        	vld.setLubricantPrice(rs.getInt("lubricant_price"));
        	vld.setLubricantQuantity(rs.getInt("lubricant_quantity"));
        	vld.setLubricantLabour(rs.getInt("lubricant_labour"));
        	vld.setLubricantValidity(rs.getInt("lubricant_validity"));
        	vld.setModelVarientid(rs.getInt("model_varient_id"));
        	vld.setLubricantValidityKm(rs.getInt("lubricant_validity_km"));
        	vld.setLubricantSuggestflag(rs.getBoolean("lubricant_suggest_flag"));
        	list.add(vld);
        }  
        con.close();  
    }catch(Exception e){e.printStackTrace();}  
    return list;  
}

	public static int deleteLubricantById(int lubricant_id) {
    	int status = 0;
        try {
            java.sql.Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=(PreparedStatement) con.prepareStatement(  
                         "delete from vehicle_lubricant_details where lubricant_id = ?");
                         
            ps.setInt(1, lubricant_id);

            status=ps.executeUpdate();   
            System.out.println(status);
            con.close();              
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }
	
	public static List<String> getLubricantList(int model_varient_id) {
			List<String> list=new ArrayList<String>();  
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select lubricant_name from vehicle_lubricant_details where model_varient_id=?") ;
	            ps.setInt(1, model_varient_id);
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	String part;
	            	part = rs.getString("lubricant_name");
	            	list.add(part);
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}  
	        return list;  
	}	
	public static VehicleLubricantDetails getLubricantsById(int lubricant_id)
	{
		VehicleLubricantDetails vld=new VehicleLubricantDetails();  
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("select * from vehicle_lubricant_details where lubricant_id=?") ;
            ps.setInt(1, lubricant_id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){  
            	vld.setLubricantId(rs.getInt("lubricant_id"));
            	vld.setLubricantName(rs.getString("lubricant_name"));
            	vld.setLubricantPrice(rs.getInt("lubricant_price"));
            	vld.setLubricantLabour(rs.getInt("lubricant_labour"));
            	vld.setLubricantValidity(rs.getInt("lubricant_validity"));
            	vld.setModelVarientid(rs.getInt("model_varient_id"));
            	vld.setLubricantValidityKm(rs.getInt("lubricant_validity_km"));
            	vld.setLubricantSuggestflag(rs.getBoolean("lubricant_suggest_flag"));
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
        return vld;  
	}
	
	 public static List<VehicleLubricantDetails> getLubricantsByVarientId(int vid) {
			List<VehicleLubricantDetails> list = new ArrayList<VehicleLubricantDetails>();
			try {
				java.sql.Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps=(PreparedStatement) con.prepareStatement("select * from vehicle_lubricant_details where model_varient_id = ?");
	            ps.setInt(1, vid);
	            java.sql.ResultSet rs = ps.executeQuery();
	            int i =0;
	            while(rs.next()){  
	                VehicleLubricantDetails vld = new VehicleLubricantDetails();
	                vld.setLubricantId(rs.getInt("lubricant_id"));
	                vld.setLubricantName(rs.getString("lubricant_name"));
	                vld.setLubricantPrice(rs.getInt("lubricant_price"));
	                vld.setLubricantQuantity(rs.getInt("lubricant_quantity"));
	                vld.setLubricantLabour(rs.getInt("lubricant_labour"));
	                vld.setLubricantValidity(rs.getInt("lubricant_validity"));
	            	vld.setModelVarientid(rs.getInt("model_varient_id"));
	            	vld.setLubricantValidityKm(rs.getInt("lubricant_validity_km"));
	            	vld.setLubricantSuggestflag(rs.getBoolean("lubricant_suggest_flag"));
	            	list.add(vld);
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}  
	        	return list; 
	    }
	
	 
	 public static List<VehicleLubricantDetails> getSuggestionByKm(int running_km,int model_varient_id,String vehicleNumber)
		{
			History h =	HistoryDao.getAllByNumber(vehicleNumber);
			int pre_running_km = h.getRunningKM();
			int diff = running_km - pre_running_km;
		List<VehicleLubricantDetails> list=new ArrayList<VehicleLubricantDetails>();  
	    try{  
	        Connection con=ConnectionDb.getConnection();  
	        PreparedStatement ps = con.prepareStatement("select * from vehicle_lubricant_details where vehicle_lubricant_details.model_varient_id = ? AND vehicle_lubricant_details.lubricant_validity_km <= ? ") ;
	        ps.setInt(1, model_varient_id);
	        ps.setInt(2, diff);
	        ResultSet rs = ps.executeQuery();
	        while(rs.next()){  
	        	VehicleLubricantDetails vld = new VehicleLubricantDetails();
	        	vld.setLubricantId(rs.getInt("lubricant_id"));
	        	vld.setLubricantName(rs.getString("lubricant_name"));
	        	vld.setLubricantPrice(rs.getInt("lubricant_price"));
	        	vld.setLubricantQuantity(rs.getInt("lubricant_quantity"));
	        	vld.setLubricantLabour(rs.getInt("lubricant_labour"));
	        	vld.setLubricantValidity(rs.getInt("lubricant_validity"));
	        	vld.setModelVarientid(rs.getInt("model_varient_id"));
	        	vld.setLubricantValidityKm(rs.getInt("lubricant_validity_km"));
	        	vld.setLubricantSuggestflag(rs.getBoolean("lubricant_suggest_flag"));
	        	list.add(vld);
	        }  
	        con.close();  
	    }catch(Exception e){e.printStackTrace();}  
	    return list;  
	}
	
	
}


