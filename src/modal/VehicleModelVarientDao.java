package modal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VehicleModelVarientDao {

    public static int save(VehicleModelVarient vm) {
        int status = 0;

        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "insert into vehicle_model_varient(model_varient_name, vehicle_model_id) values (?, ?)");  
            
            ps.setString(1, vm.getModelVarientName());
            ps.setInt(2, vm.getVehicleModelId());
              
            status=ps.executeUpdate();   
            System.out.println(status);
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }

	public static List<VehicleModelVarient> getVarientsByModelId(String mid) {
		List<VehicleModelVarient> list = new ArrayList<VehicleModelVarient>();
		try {
			Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("select * from vehicle_model_varient where vehicle_model_id = ?");
            ps.setString(1, mid);
            java.sql.ResultSet rs = ps.executeQuery();
            int i =0;
            while(rs.next()){  
            	VehicleModelVarient vm = new VehicleModelVarient();
            	vm.setModelVarientName(rs.getString("model_varient_name"));
            	vm.setVehicleModelId(rs.getInt("vehicle_model_id"));
            	vm.setModelVarientId(rs.getInt("model_varient_id"));
            	list.add(vm);
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
        	return list; 
	}
	

	public static String getVarientName(int vehicle_model_id)
	{
		String model_varient_name = null ;
		 try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select model_varient_name from vehicle_model_varient where vehicle_model_id ='"+vehicle_model_id+"' ") ;
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	model_varient_name = rs.getString("model_varient_name");
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}  
	        return model_varient_name;
	}
	
}
