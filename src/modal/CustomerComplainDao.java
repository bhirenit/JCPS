package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CustomerComplainDao {
	public static int save(CustomerComplain cc){  
		  
        int status=0;  	
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "insert into customer_complain(jobcard_number,customer_complain) values (?,?)");  
            
            ps.setInt(1, cc.getJobcardNumber());
            ps.setString(2, cc.getCustomerComplain());
              
            status=ps.executeUpdate();   
            System.out.println(status);
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }
	 public static int deleteById(int complain_id)
		{
			int status=0;
			try{
				Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("delete from customer_complain where complain_id='"+complain_id+"' ");
	             status = ps.executeUpdate();
	            con.close();
			}
			catch(Exception e){e.printStackTrace();}
			return status;
		}
	public static List<CustomerComplain> getAll(int jobcard_number)
	{
		List<CustomerComplain> list = new ArrayList<CustomerComplain>();
		try{
			 Connection con=ConnectionDb.getConnection();  
	         PreparedStatement ps=con.prepareStatement("select * from customer_complain where jobcard_number ='"+jobcard_number+"'");
	         ResultSet rs = ps.executeQuery();
	         while(rs.next())
	         {
	        	 CustomerComplain cc = new CustomerComplain();
	        	 cc.setComplainId(rs.getInt("complain_id"));
	        	 cc.setCustomerComplain(rs.getString("customer_complain"));
	        	 cc.setJobcardNumber(rs.getInt("jobcard_number"));
	        	 list.add(cc);
	         }
			}catch(Exception e){e.printStackTrace();}
		return list;
	}
	public static int delete(int jobcardNumber)
	{
		int status=0;
		try{
			Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("delete from customer_complain where jobcard_number='"+jobcardNumber+"' ");
             status = ps.executeUpdate();
            con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return status;
	}
}
