package modal;

import java.sql.*;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


public class VehiclePartDetailsDao {

	public static int save(VehiclePartDetails vpd) {
		int status = 0;

		try{  
           Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=(PreparedStatement) con.prepareStatement(  
                         "insert into vehicle_part_details(part_name, part_price, part_quantity, part_validity,part_labour, model_varient_id) values (?, ?, ?, ?, ?, ?)");  
            
            ps.setString(1, vpd.getPartName());
            ps.setInt(2, vpd.getPartPrice());
            ps.setInt(3, vpd.getPartQuantity());
            ps.setInt(4, vpd.getPartValidity());
            ps.setInt(5, vpd.getPartLabour());
            ps.setInt(6, vpd.getModelVarientId());
              
            status=ps.executeUpdate();   
            System.out.println(status);
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
	}

	public static List<VehiclePartDetails> getPartsByVarientId(int vid) {
		List<VehiclePartDetails> list = new ArrayList<VehiclePartDetails>();
		try {
			java.sql.Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=(PreparedStatement) con.prepareStatement("select * from vehicle_part_details where model_varient_id = ?");
            ps.setInt(1, vid);
            java.sql.ResultSet rs = ps.executeQuery();
            int i =0;
            while(rs.next()){  
                VehiclePartDetails vpd = new VehiclePartDetails();
                vpd.setPartId(rs.getInt("part_id"));
            	vpd.setPartName(rs.getString("part_name"));
            	vpd.setPartPrice(rs.getInt("part_price"));
            	vpd.setPartQuantity(rs.getInt("part_quantity"));
            	 vpd.setPartValidity(rs.getInt("part_validity"));
            	vpd.setPartLabour(rs.getInt("part_labour"));
            	vpd.setModelVarientId(rs.getInt("model_varient_id"));
            	list.add(vpd);
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
        	return list; 
    }
    
    public static int deletePartById(int part_id) {
    	int status = 0;
        try {
            java.sql.Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=(PreparedStatement) con.prepareStatement(  
                         "delete from vehicle_part_details where part_id = ?");
                         
            ps.setInt(1, part_id);

            status=ps.executeUpdate();   
            System.out.println(status);
            con.close();              
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }
    
    public static int update(VehiclePartDetails vpd) {
    	int status = 0;
    	
    	try {
            java.sql.Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=(PreparedStatement) con.prepareStatement(  
                         "update vehicle_part_details set part_name = ?, part_price = ?, part_quantity = ?,part_validity = ?, part_labour = ? where part_id = ?");
                         
            ps.setString(1, vpd.getPartName());
            ps.setInt(2, vpd.getPartPrice());
            ps.setInt(3, vpd.getPartQuantity());
            ps.setInt(4, vpd.getPartValidity());
            ps.setInt(5, vpd.getPartLabour());
            ps.setInt(6, vpd.getPartId());

            status=ps.executeUpdate();   
            System.out.println(status);
            con.close();              
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    	
    	return status;
    }
	
	
	public static List<VehiclePartDetails> getAllParts()
	{
		List<VehiclePartDetails> list=new ArrayList<VehiclePartDetails>();
		try{
			Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("select * from vehicle_part_details");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
            	VehiclePartDetails vpd=new VehiclePartDetails();
            	vpd.setPartId(rs.getInt("part_id"));
            	vpd.setPartName(rs.getString("part_name"));
            	vpd.setPartPrice(rs.getInt("part_price"));
            	vpd.setPartQuantity(rs.getInt("part_quantity"));
            	vpd.setPartLabour(rs.getInt("part_labour"));
            	vpd.setPartValidity(rs.getInt("part_validity"));
            	vpd.setModelVarientId(rs.getInt("model_varient_id"));
            	list.add(vpd);
            }
            con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return list;
	}
	public static int getnextEl(List<String> partList,String part_name)
	{
		Iterator<String> itr=partList.iterator();
		int quantity=0;
		int flag=0 ;
           while(itr.hasNext()){ 
           	String tpart_name=itr.next();
           	 quantity = Integer.parseInt(itr.next());
           	if(part_name==tpart_name){flag=1;}
           }
           if(flag==1)
           {
        	   return quantity;
           }
           else{
		return 1;}
	}
	public static List<VehiclePartDetails> getParts(int model_varient_id)
	{
		List<VehiclePartDetails> list=new ArrayList<VehiclePartDetails>();  
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("select * from vehicle_part_details where model_varient_id=?") ;
            ps.setInt(1, model_varient_id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){  
            	VehiclePartDetails vpd = new VehiclePartDetails();
            	vpd.setPartId(rs.getInt("part_id"));
            	vpd.setPartName(rs.getString("part_name"));
            	vpd.setPartPrice(rs.getInt("part_price"));
            	vpd.setPartQuantity(rs.getInt("part_quantity"));
            	vpd.setPartLabour(rs.getInt("part_labour"));
            	vpd.setPartValidity(rs.getInt("part_validity"));
            	vpd.setModelVarientId(rs.getInt("model_varient_id"));
            	list.add(vpd);
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
        return list;  
	}
	public static VehiclePartDetails getPartsById(int part_id)
	{
		VehiclePartDetails vpd=new VehiclePartDetails();  
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("select * from vehicle_part_details where part_id=?") ;
            ps.setInt(1, part_id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){  
            	vpd.setPartId(rs.getInt("part_id"));
            	vpd.setPartName(rs.getString("part_name"));
            	vpd.setPartPrice(rs.getInt("part_price"));
            	vpd.setPartQuantity(rs.getInt("part_quantity"));
            	vpd.setPartLabour(rs.getInt("part_labour"));
            	vpd.setPartValidity(rs.getInt("part_validity"));
            	vpd.setModelVarientId(rs.getInt("model_varient_id"));
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
        return vpd;  
	}
	public static List<String> getPartList(int model_varient_id)
	{
		List<String> list=new ArrayList<String>();  
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("select part_name from vehicle_part_details where model_varient_id=?") ;
            ps.setInt(1, model_varient_id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){  
            	String part;
            	part = rs.getString("part_name");
            	list.add(part);
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
        return list;  
	}
	
	
}
