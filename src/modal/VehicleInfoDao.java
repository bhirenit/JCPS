package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class VehicleInfoDao {
	public static int save(VehicleInfo vi){  
	    int status=0;  
	    try{  
	        Connection con=ConnectionDb.getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	                     "insert into vehicle_info(vehicle_number,vin_number,vehicle_company,company_model, model_varient,engine_number,fuel_type,vehicle_type,interior_color,exterior_color) values (?,?,?,?,?,?,?,?,?,?)");  
	       
	        ps.setString(1,vi.getVehicleNumber()); 
	        ps.setString(2,vi.getVinNumber());
	        ps.setInt(3,vi.getVehicleCompany());  
	        ps.setInt(4,vi.getCompanyModel());  
	        ps.setInt(5,vi.getModelVarient());  
	        ps.setString(6, vi.getEngineNumber());
	       ps.setString(7,vi.getFuelType());
	       ps.setString(8,vi.getVehicleType());
	       ps.setString(9, vi.getInteriorColor());
	       ps.setString(10,vi.getExteriorColor());   
	       
	        status=ps.executeUpdate();  
	        con.close();  
	    }catch(Exception ex){ex.printStackTrace();}  
	      
	    return status;  
	}
	
	public static int update(VehicleInfo vi){  
	    int status1=0;  
	    try{  
	        Connection con=ConnectionDb.getConnection();  
	        PreparedStatement ps=con.prepareStatement("update vehicle_info set vin_number=?, engine_number=? ,fuel_type=?,vehicle_type=?,interior_color=?,exterior_color=?  where vehicle_number =? ");
	      
	        ps.setString(1,vi.getVinNumber());
	        
	        ps.setString(2, vi.getEngineNumber());
	       ps.setString(3,vi.getFuelType());
	       ps.setString(4,vi.getVehicleType());
	       ps.setString(5, vi.getInteriorColor());
	       ps.setString(6,vi.getExteriorColor());   
	       ps.setString(7,vi.getVehicleNumber()); 
	       
	        status1=ps.executeUpdate();  
	        con.close();  
	    }catch(Exception ex){ex.printStackTrace();}  
	      
	    return status1;  
	}
	
	
	
	public static int getModelByNumber(String vehicle_number)
	{
		int company_model = 0;
		try{
		 Connection con=ConnectionDb.getConnection();  
         PreparedStatement ps=con.prepareStatement("select company_model from vehicle_info where vehicle_number ='"+vehicle_number+"'");
         ResultSet rs = ps.executeQuery();
         while(rs.next())
         {
        	 company_model = rs.getInt("company_model");
         }
		}catch(Exception e){e.printStackTrace();}
		return company_model;
	}
	public static boolean checkVehicleNumber(String vehicle_number) {
		boolean b = false;
		try{
			 Connection con=ConnectionDb.getConnection();  
	         PreparedStatement ps=con.prepareStatement("select vehicle_number from history where vehicle_number ='"+vehicle_number+"'");
	         ResultSet rs = ps.executeQuery();
	         if(rs.next())
	         {
	          b = true;
	         }
			}catch(Exception e){e.printStackTrace();}
			return b;
	}  

	public static int getVarientByNumber(String vehicle_number) {
		int model_varient = 0;
		try{
		 Connection con=ConnectionDb.getConnection();  
         PreparedStatement ps=con.prepareStatement("select model_varient from vehicle_info where vehicle_number ='"+vehicle_number+"'");
         ResultSet rs = ps.executeQuery();
         while(rs.next())
         {
         model_varient = rs.getInt("model_varient");
         }
		}catch(Exception e){e.printStackTrace();}
		return model_varient;
	}
	public static VehicleInfo getAllByNumber(String vehicle_number) {
		VehicleInfo vi = new VehicleInfo();
		try{
		 Connection con=ConnectionDb.getConnection();  
         PreparedStatement ps=con.prepareStatement("select * from vehicle_info where vehicle_number ='"+vehicle_number+"'");
         ResultSet rs = ps.executeQuery();
         while(rs.next())
         {
        	 	vi.setVehicleNumber(rs.getString("vehicle_number"));
		        vi.setVinNumber(rs.getString("vin_number"));
		        vi.setEngineNumber(rs.getString("engine_number"));
		        vi.setVehicleCompany(rs.getInt("vehicle_company"));
		        vi.setCompanyModel(rs.getInt("company_model"));
		        vi.setModelVarient(rs.getInt("model_varient"));
		        vi.setVehicleType(rs.getString("vehicle_type"));
		        vi.setFuelType(rs.getString("fuel_type"));
		        vi.setInteriorColor(rs.getString("interior_color"));
		        vi.setExteriorColor(rs.getString("exterior_color"));
        
         }
		}catch(Exception e){e.printStackTrace();}
		return vi;
	}
	public static int getCountOfVehicleType(String vehicle_type)
	 {
		    int i=0;
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select count(vehicle_number) as total from vehicle_info where vehicle_type = ?") ;
	            ps.setString(1, vehicle_type);
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	i = rs.getInt("total");
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return i;
	 }
	public static int getCountOfFuelType(String fuel_type)
	 {
		    int i=0;
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select count(vehicle_number) as total from vehicle_info where fuel_type = ?") ;
	            ps.setString(1, fuel_type);
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	i = rs.getInt("total");
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return i;
	 }
}
