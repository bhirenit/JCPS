package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HistoryServiceDao {

	public static int save(HistoryService hs) {
		int status=0;  
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "insert into history_service(history_id,service_id,service_name,service_details,service_price) values (?,?,?,?,?)");  
            ps.setString(1,hs.getHistoryId());	     
            ps.setInt(2, hs.getServiceId());
            ps.setString(3,hs.getServiceName()); 
            ps.setString(4,hs.getServiceDetails());
            ps.setInt(5,hs.getServicePrice());
            	        
            status=ps.executeUpdate();      
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
		
	}
	
	
	public static List<HistoryService> getAllById(String history_id)
	{
		List<HistoryService> list=new ArrayList<HistoryService>();
		try{
			Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("select * from history_service where history_id='"+history_id+"'");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
            	HistoryService js=new HistoryService();
            	js.setServiceId(rs.getInt("service_id"));
            	js.setServiceName(rs.getString("service_name"));
            	js.setServiceDetails(rs.getString("service_details"));
            	js.setServicePrice(rs.getInt("service_price"));
            	js.setHistoryId(rs.getString("history_id"));
            	list.add(js);
            }
            con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return list;
	}
 

}
