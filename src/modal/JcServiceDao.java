package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class JcServiceDao {

	public static int save(JcService js){  
        int status=0;  
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "insert into jc_service(jobcard_number,service_id,service_name,service_details,service_price,service_status) values (?,?,?,?,?,?)");  
            ps.setInt(1,js.getJobcardNumber());	        
            ps.setInt(2, js.getServiceId());
            ps.setString(3,js.getServiceName()); 
            ps.setString(4,js.getServiceDesc());
            ps.setInt(5,js.getServicePrice());
            ps.setString(6,js.getServiceStatus()); 	 	        
            status=ps.executeUpdate();      
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    } 
 public static List<JcService> getByNumber(int jobcardNumber,String status)
	{
		List<JcService> list=new ArrayList<JcService>();
		try{
			Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("select * from jc_service where jobcard_number='"+jobcardNumber+"' and service_status='"+status+"'");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
            	JcService js=new JcService();
            	js.setServiceId(rs.getInt("service_id"));
            	js.setServiceName(rs.getString("service_name"));
            	js.setServiceDesc(rs.getString("service_details"));
            	js.setServicePrice(rs.getInt("service_price"));
            	js.setJobcardNumber(rs.getInt("jobcard_number"));
            	js.setServiceStatus(rs.getString("service_status"));
            	list.add(js);
            }
            con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return list;
	}
 
 public static int deleteById(int jobcardNumber ,int service_id )
	{
		int status=0;
		try{
			Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("delete from jc_service where jobcard_number='"+jobcardNumber+"' and service_id='"+service_id+"' ");
             status = ps.executeUpdate();
            con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return status;
	}
public static int updateStatus(int jobcardNumber, int serviceid, String status) {
	int res=0;
	try{
		Connection con=ConnectionDb.getConnection();  
        PreparedStatement ps = con.prepareStatement("update jc_service set service_status='"+status+"' where jobcard_number='"+jobcardNumber+"' and service_id='"+serviceid+"' ");
        res = ps.executeUpdate();
        con.close();
	}
	catch(Exception e){e.printStackTrace();}
	return res;
}
public static boolean checkIfAllCompleted(int jobcardNumber) throws SQLException {
	boolean flag = false;
	try{
		Connection con=ConnectionDb.getConnection();  
        PreparedStatement ps = con.prepareStatement("select service_name from jc_service where jobcard_number='"+jobcardNumber+"' and service_status='pending' ");
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
public static int delete(int jobcardNumber) {
	int status=0;
	try{
		Connection con=ConnectionDb.getConnection();  
        PreparedStatement ps = con.prepareStatement("delete from jc_service where jobcard_number='"+jobcardNumber+"' ");
         status = ps.executeUpdate();
        con.close();
	}
	catch(Exception e){e.printStackTrace();}
	return status;
	
}
public static List<JcService> getByJobcardNumber(int jobcardNumber)
{
	List<JcService> list=new ArrayList<JcService>();
	try{
		Connection con=ConnectionDb.getConnection();  
        PreparedStatement ps = con.prepareStatement("select * from jc_service where jobcard_number='"+jobcardNumber+"'");
        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {
        	JcService js=new JcService();
        	js.setServiceId(rs.getInt("service_id"));
        	js.setServiceName(rs.getString("service_name"));
        	js.setServiceDesc(rs.getString("service_details"));
        	js.setServicePrice(rs.getInt("service_price"));
        	js.setJobcardNumber(rs.getInt("jobcard_number"));
        	js.setServiceStatus(rs.getString("service_status"));
        	list.add(js);
        }
        con.close();
	}
	catch(Exception e){e.printStackTrace();}
	return list;
}
public static int getTotalAmount(int jobcardNumber) {
	List<JcService> list1 = JcServiceDao.getByJobcardNumber(jobcardNumber);
	Iterator<JcService> itr3 = list1.iterator();
	double total_price = 0;
	while (itr3.hasNext()) {
		JcService js = itr3.next();
		int service_price = js.getServicePrice();
		double sgst = service_price * 0.09;
		double cgst = service_price * 0.09;
		double total_service_price = service_price + sgst + cgst;
		total_price += total_service_price; 
	}
	return (int)total_price;
}

public static int getCount(int jobcardNumber, String status) {
	 int count = 0;
       try{  
           Connection con=ConnectionDb.getConnection();  
           PreparedStatement ps = con.prepareStatement("select count(service_id) from jc_service where jobcard_number = ? and service_status = ?") ;
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
