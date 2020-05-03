package modal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VehicleModelDao {
	public static int save(VehicleModel vm) {
		int status = 0;

		try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "insert into vehicle_model(vehicle_model_name, vehicle_company_id) values (?, ?)");  
            
            ps.setString(1, vm.getVehicleModelName());
            ps.setInt(2, vm.getVehicleCompanyId());
              
            status=ps.executeUpdate();   
            System.out.println(status);
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
	}

	public static List<VehicleModel> getModelsByCompanyId(String cid) {
		List<VehicleModel> list = new ArrayList<VehicleModel>();
		try {
			Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("select * from vehicle_model where vehicle_company_id = ?");
            ps.setString(1, cid);
            java.sql.ResultSet rs = ps.executeQuery();
            int i =0;
            while(rs.next()){  
            	VehicleModel vm = new VehicleModel();
            	vm.setVehicleModelName(rs.getString("vehicle_model_name"));
            	vm.setVehicleModelId(rs.getInt("vehicle_model_id"));
            	vm.setVehicleCompanyId(rs.getInt("vehicle_company_id"));
            	list.add(vm);
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
        	return list; 
	}

	 public static List<VehicleModel> getModels(){ 
		 List<VehicleModel > list=new ArrayList<VehicleModel>();  
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("select * from vehicle_model") ;
            java.sql.ResultSet rs = ps.executeQuery();
            int i =0;
            while(rs.next()){  
            	VehicleModel vm = new VehicleModel();
            	vm.setVehicleModelName(rs.getString("vehicle_model_name"));
            	vm.setVehicleModelId(rs.getInt("vehicle_model_id"));
            	list.add(vm);
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
        return list;  
	}
	public static String getModelName(int vehicle_model_id)
	{
		String vehicle_model_name = null ;
		 try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select vehicle_model_name from vehicle_model where vehicle_model_id ='"+vehicle_model_id+"' ") ;
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	vehicle_model_name = rs.getString("vehicle_model_name");
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}  
	        return vehicle_model_name;
	}
	

	
	public static VehicleModel getById(int vehicle_model_id)
	 {
		 VehicleModel vm = new VehicleModel();
		 try{  
		        Connection con=ConnectionDb.getConnection();  
		        PreparedStatement ps = con.prepareStatement("select * from vehicle_model where vehicle_model_id='"+vehicle_model_id+"'") ;
		        ResultSet rs = ps.executeQuery();
		        while(rs.next()){  
		        	vm.setVehicleModelId(rs.getInt("vehicle_model_id"));
		        	vm.setVehicleModelName(rs.getString("vehicle_model_name"));
		        	vm.setVehicleCompanyId(rs.getInt("vehicle_company_id"));
		        }  
		        con.close();  
		    }catch(Exception e){e.printStackTrace();}  
		 return vm;
	 }
}