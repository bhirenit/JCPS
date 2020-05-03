package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class JcPartDao {

	 public static int save(JcPart jp){  
	        int status=0;  
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps=con.prepareStatement(  
	                         "insert into jc_part(jobcard_number,part_id,part_name,part_price,part_quantity,part_repair_flag,part_status) values (?,?,?,?,?,?,?)");  
	            ps.setInt(1,jp.getJobcardNumber());	        
	            ps.setInt(2, jp.getPartId());
	            ps.setString(3,jp.getPartName()); 		           
	            ps.setInt(4,jp.getPartPrice());
	            ps.setInt(5,jp.getPartQuantity()); 	 	        
	            ps.setBoolean(6,jp.isPartRepairFlag());  
	            ps.setString(7,jp.getPartStatus());  
	            status=ps.executeUpdate();      
	            con.close();  
	        }catch(Exception ex){ex.printStackTrace();}  
	          
	        return status;  
	    }
	 
	 public static int delete(int jobcard_number)
		{
			int status=0;
			try{
				Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("delete from jc_part where jobcard_number='"+jobcard_number+"' ");
	             status = ps.executeUpdate();
	            con.close();
			}
			catch(Exception e){e.printStackTrace();}
			return status;
		}
	 public static List<JcPart> getByNumber(int jobcard_number,String status)
		{
			List<JcPart> list=new ArrayList<JcPart>();
			try{
				Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select * from jc_part where jobcard_number='"+jobcard_number+"' and part_status='"+status+"'");
	            ResultSet rs = ps.executeQuery();
	            while(rs.next())
	            {
	            	JcPart jp=new JcPart();
	            	jp.setPartId(rs.getInt("part_id"));
	            	jp.setPartName(rs.getString("part_name"));
	            	jp.setPartPrice(rs.getInt("part_price"));
	            	jp.setJobcardNumber(rs.getInt("jobcard_number"));
	            	jp.setPartStatus(rs.getString("part_status"));
	            	jp.setPartRepairFlag(rs.getBoolean("part_repair_flag"));
	            	jp.setPartQuantity(rs.getInt("part_quantity"));
	            	list.add(jp);
	            }
	            con.close();
			}
			catch(Exception e){e.printStackTrace();}
			return list;
		}
	 public static JcPart getPartByNumberId(int jobcard_number,int part_id)
		{
			JcPart jp=new JcPart();
			try{
				Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select * from jc_part where jobcard_number='"+jobcard_number+"' and part_id = '"+part_id+"'");
	            ResultSet rs = ps.executeQuery();
	            while(rs.next())
	            {
	            	jp.setPartId(rs.getInt("part_id"));
	            	jp.setPartName(rs.getString("part_name"));
	            	jp.setPartPrice(rs.getInt("part_price"));
	            	jp.setJobcardNumber(rs.getInt("jobcard_number"));
	            	jp.setPartStatus(rs.getString("part_status"));
	            	jp.setPartRepairFlag(rs.getBoolean("part_repair_flag"));
	            	jp.setPartQuantity(rs.getInt("part_quantity"));
	            }
	            con.close();
			}
			catch(Exception e){e.printStackTrace();}
			return jp;
		}
	 public static int deleteById(int jobcard_number,int part_id )
		{
			int status=0;
			try{
				Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("delete from jc_part where jobcard_number='"+jobcard_number+"' and part_id='"+part_id+"' ");
	             status = ps.executeUpdate();
	            con.close();
			}
			catch(Exception e){e.printStackTrace();}
			return status;
		}
	 public static boolean checkAlready(int jobcard_number,int part_id )
		{
			boolean flag=false;
			try{
				Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select * from jc_part where jobcard_number='"+jobcard_number+"' and part_id='"+part_id+"' ");
	             ResultSet rs = ps.executeQuery();
	             if(rs.next())
	            	 flag=true;
	            con.close();
			}
			catch(Exception e){e.printStackTrace();}
			return flag;
		}
	 public static int increaseQuantity(int jobcard_number,int part_id )
		{
			int status=0;
			try{
				Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("update jc_part set part_quantity=part_quantity + 1 where jobcard_number='"+jobcard_number+"' and part_id='"+part_id+"' ");
	            status = ps.executeUpdate();
	            con.close();
			}
			catch(Exception e){e.printStackTrace();}
			return status;
		}
	 public static int decreaseQuantity(int jobcard_number,int part_id )
		{
			int status=0;
		 	boolean isOne = JcPartDao.checkIfQuantityIsOne(jobcard_number, part_id);
		 	if(isOne)
		 	{
		 		status = JcPartDao.deleteById(jobcard_number, part_id);
		 		return status;
		 	}
		 	else
		 	{	
			try{
				Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("update jc_part set part_quantity=part_quantity - 1 where jobcard_number='"+jobcard_number+"' and part_id='"+part_id+"' ");
	            status = ps.executeUpdate();
	            con.close();
			}
			catch(Exception e){e.printStackTrace();}
			return status;
		}
		}
	private static boolean checkIfQuantityIsOne(int jobcard_number, int part_id) 
	{
		JcPart jp = JcPartDao.getPartByNumberId(jobcard_number, part_id);
		if(jp.getPartQuantity()==1 || jp.getPartQuantity()==0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	public static int updateStatus(int jobcardNumber, int partid, String status) {
		int res=0;
		try{
			Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("update jc_part set part_status='"+status+"' where jobcard_number='"+jobcardNumber+"' and part_id='"+partid+"' ");
            res = ps.executeUpdate();
            con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return res;
	}
	public static boolean checkIfAllCompleted(int jobcardNumber) throws SQLException {
		boolean flag=false;
		try{
			Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("select part_name from jc_part where jobcard_number='"+jobcardNumber+"' and part_status='pending' ");
            ResultSet rs = ps.executeQuery();
            if(rs.next())
	         	flag = false;
	         else 
	         	flag = true;
            con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return flag;
	}
	 public static List<JcPart> getByJobcardNumber(int jobcard_number)
		{
			List<JcPart> list=new ArrayList<JcPart>();
			try{
				Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select * from jc_part where jobcard_number='"+jobcard_number+"'");
	            ResultSet rs = ps.executeQuery();
	            while(rs.next())
	            {
	            	JcPart jp=new JcPart();
	            	jp.setPartId(rs.getInt("part_id"));
	            	jp.setPartName(rs.getString("part_name"));
	            	jp.setPartPrice(rs.getInt("part_price"));
	            	jp.setJobcardNumber(rs.getInt("jobcard_number"));
	            	jp.setPartStatus(rs.getString("part_status"));
	            	jp.setPartRepairFlag(rs.getBoolean("part_repair_flag"));
	            	jp.setPartQuantity(rs.getInt("part_quantity"));
	            	list.add(jp);
	            }
	            con.close();
			}
			catch(Exception e){e.printStackTrace();}
			return list;
		}

	public static int getTotalAmount(int jobcardNumber) {
		List<JcPart> list = JcPartDao.getByJobcardNumber(jobcardNumber);
		Iterator<JcPart> itr2 = list.iterator();
		double total_price = 0;
		while (itr2.hasNext()) {
			JcPart jp = itr2.next();
			int part_id = jp.getPartId();
			int part_price = jp.getPartPrice();
			int part_quantity = jp.getPartQuantity();
			double sgst = part_price * 0.09;
			double cgst = part_price * 0.09;
			VehiclePartDetails vpd = VehiclePartDetailsDao.getPartsById(part_id);
			int part_labour = vpd.getPartLabour();
			double total_part_price = part_price * part_quantity + sgst + cgst + part_labour;
			total_price += total_part_price;
	}
		return (int)total_price;
	}
	
	public static int getCount(int jobcardNumber, String status) {
		 int count = 0;
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select count(part_id) from jc_part where jobcard_number = ? and part_status = ?") ;
	            ps.setInt(1, jobcardNumber);
	            ps.setString(2, status);
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	count = rs.getInt(1);
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return count;
}
	 
	
}
