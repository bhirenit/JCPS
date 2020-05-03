package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HistoryLubricantDao {

	public static int save(HistoryLubricant hl) {
		int status=0;  
        try{  
            Connection con= ConnectionDb.getConnection();  
           PreparedStatement ps=con.prepareStatement(  
                         "insert into history_lubricant(history_id,lubricant_id,lubricant_name,lubricant_price) values (?,?,?,?)");  
            
           ps.setString(1,hl.getHistoryId());	
            ps.setInt(2, hl.getLubricantId());
            ps.setString(3,hl.getLubricantName());
            VehicleLubricantDetails vld = VehicleLubricantDetailsDao.getLubricantsById(hl.getLubricantId());
    		int lubricant_labour = vld.getLubricantLabour();
    		double lubricant_price = hl.getLubricantPrice()*0.18 + lubricant_labour;
            ps.setInt(4,(int)lubricant_price);	        
            status=ps.executeUpdate();      
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status; 
	}

	public static List<HistoryLubricant> getAllById(String history_id)
	{
		List<HistoryLubricant> list=new ArrayList<HistoryLubricant>();
		try{
			Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("select * from history_lubricant where history_id='"+history_id+"'");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
            	HistoryLubricant jl=new HistoryLubricant();
            	jl.setLubricantId(rs.getInt("lubricant_id"));
            	jl.setLubricantName(rs.getString("lubricant_name"));
            	jl.setLubricantPrice(rs.getInt("lubricant_price"));
            	jl.setHistoryId(rs.getString("history_id"));
            	
            	
            	list.add(jl);
            }
            con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return list;
	}
	
	
	
}
  