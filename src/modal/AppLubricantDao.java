package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AppLubricantDao {



		public static int save(AppLubricant al){  
	        int status=0;  
	        try{  
	            Connection con= ConnectionDb.getConnection();  
	           PreparedStatement ps=con.prepareStatement(  
	                         "insert into app_lubricant(vehicle_number,lubricant_id,lubricant_name,lubricant_price) values (?,?,?,?)");  
	            
	            ps.setString(1, al.getVehicleNumber());
	            ps.setInt(2, al.getLubricantId());
	            ps.setString(3,al.getLubricantName()); 		           
	            ps.setInt(4,al.getLubricantPrice());
	            	 	        
	            status=ps.executeUpdate();      
	            con.close();  
	        }catch(Exception ex){ex.printStackTrace();}  
	          
	        return status;  
	    }
		 public static List<AppLubricant> getByNumber(String vehicle_number)
			{
				List<AppLubricant> list=new ArrayList<AppLubricant>();
				try{
					Connection con=ConnectionDb.getConnection();  
		            PreparedStatement ps = con.prepareStatement("select * from app_lubricant where vehicle_number='"+vehicle_number+"'");
		            ResultSet rs = ps.executeQuery();
		            while(rs.next())
		            {
		            	AppLubricant jl=new AppLubricant();
		            	jl.setLubricantId(rs.getInt("lubricant_id"));
		            	jl.setLubricantName(rs.getString("lubricant_name"));
		            	jl.setLubricantPrice(rs.getInt("lubricant_price"));
		            	jl.setVehicleNumber(rs.getString("vehicle_number"));
		            	
		            	
		            	
		            	list.add(jl);
		            }
		            con.close();
				}
				catch(Exception e){e.printStackTrace();}
				return list;
			}
		 public static int deleteById(String vehicle_number,int lubricant_id )
			{
				int status=0;
				try{
					Connection con=ConnectionDb.getConnection();  
		            PreparedStatement ps = con.prepareStatement("delete from app_lubricant where vehicle_number='"+vehicle_number+"' and lubricant_id='"+lubricant_id+"' ");
		             status = ps.executeUpdate();
		            con.close();
				}
				catch(Exception e){e.printStackTrace();}
				return status;
			}
	
	
	
}
