package modal;


import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class JcLubricantDao {

	public static int save(JcLubricant jl){  
        int status=0;  
        try{  
            Connection con= ConnectionDb.getConnection();  
           PreparedStatement ps=con.prepareStatement(  
                         "insert into jc_lubricant(jobcard_number,lubricant_id,lubricant_name,lubricant_price,lubricant_status) values (?,?,?,?,?)");  
            
            ps.setInt(1, jl.getJobcardNumber());
            ps.setInt(2, jl.getLubricantId());
            ps.setString(3,jl.getLubricantName()); 		           
            ps.setInt(4,jl.getLubricantPrice());
            ps.setString(5,jl.getLubricantStatus()); 	 	        
            status=ps.executeUpdate();      
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }
 public static List<JcLubricant> getByNumber(int jobcard_number,String status)
	{
		List<JcLubricant> list=new ArrayList<JcLubricant>();
		try{
			Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("select * from jc_lubricant where jobcard_number='"+jobcard_number+"' and lubricant_status='"+status+"'");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
            	JcLubricant jl=new JcLubricant();
            	jl.setLubricantId(rs.getInt("lubricant_id"));
            	jl.setLubricantName(rs.getString("lubricant_name"));
            	jl.setLubricantPrice(rs.getInt("lubricant_price"));
            	jl.setLubricantStatus(rs.getString("lubricant_status"));
            	jl.setJobcardNumber(rs.getInt("jobcard_number"));
            	
            	
            	list.add(jl);
            }
            con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return list;
	}
 public static int deleteById(int jobcard_number,int lubricant_id )
	{
		int status=0;
		try{
			Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("delete from jc_lubricant where jobcard_number='"+jobcard_number+"' and lubricant_id='"+lubricant_id+"' ");
             status = ps.executeUpdate();
            con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return status;
	}
public static int updateStatus(int jobcardNumber, int lubricantid, String status) {
	int res=0;
	try{
		Connection con=ConnectionDb.getConnection();  
        PreparedStatement ps = con.prepareStatement("update jc_lubricant set lubricant_status='"+status+"' where jobcard_number='"+jobcardNumber+"' and lubricant_id='"+lubricantid+"' ");
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
        PreparedStatement ps = con.prepareStatement("select lubricant_name from jc_lubricant where jobcard_number='"+jobcardNumber+"' and lubricant_status='pending' ");
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
        PreparedStatement ps = con.prepareStatement("delete from jc_lubricant where jobcard_number='"+jobcardNumber+"'");
         status = ps.executeUpdate();
        con.close();
	}
	catch(Exception e){e.printStackTrace();}
	return status;
	
}

public static List<JcLubricant> getByJobcardNumber(int jobcard_number)
{
	List<JcLubricant> list=new ArrayList<JcLubricant>();
	try{
		Connection con=ConnectionDb.getConnection();  
        PreparedStatement ps = con.prepareStatement("select * from jc_lubricant where jobcard_number='"+jobcard_number+"'");
        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {
        	JcLubricant jl=new JcLubricant();
        	jl.setLubricantId(rs.getInt("lubricant_id"));
        	jl.setLubricantName(rs.getString("lubricant_name"));
        	jl.setLubricantPrice(rs.getInt("lubricant_price"));
        	jl.setLubricantStatus(rs.getString("lubricant_status"));
        	jl.setJobcardNumber(rs.getInt("jobcard_number"));
        	
        	
        	list.add(jl);
        }
        con.close();
	}
	catch(Exception e){e.printStackTrace();}
	return list;
}
public static int getTotalAmount(int jobcardNumber) {
	List<JcLubricant> list2 = JcLubricantDao.getByJobcardNumber(jobcardNumber);
	Iterator<JcLubricant> itr4 = list2.iterator();
	double total_price = 0;
	while (itr4.hasNext()) {
		JcLubricant jl = itr4.next();
		int lubricant_id = jl.getLubricantId();
		int lubricant_price = jl.getLubricantPrice();

		double sgst = lubricant_price * 0.09;
		double cgst = lubricant_price * 0.09;
		VehicleLubricantDetails vld = VehicleLubricantDetailsDao.getLubricantsById(lubricant_id);
		int lubricant_labour = vld.getLubricantLabour();
		double total_lubricant_price = lubricant_price + sgst + cgst + lubricant_labour;
		total_price += total_lubricant_price;
	}
	return (int)total_price;
}
	

public static int getCount(int jobcardNumber, String status) {
	 int count = 0;
       try{  
           Connection con=ConnectionDb.getConnection();  
           PreparedStatement ps = con.prepareStatement("select count(lubricant_id) from jc_lubricant where jobcard_number = ? and lubricant_status = ?") ;
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
