package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CustomerInfoDao {
	
	
	public static int save(CustomerInfo ci){  
		  
        int status=0;  	
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "insert into customer_info(vehicle_number,customer_name,customer_contact,customer_email,customer_address,customer_city,customer_state,pincode,customer_rc,customer_aadhaar,customer_license,customer_type) values (?,?,?,?,?,?,?,?,?,?,?,?)");  
            
            ps.setString(1, ci.getVehicleNumber());
            ps.setString(2, ci.getCustomerName());
            ps.setString(3, ci.getCustomerContact());
            ps.setString(4, ci.getCustomerEmail());
            ps.setString(5, ci.getCustomerAddress());
            ps.setString(6, ci.getCustomerCity());
            ps.setString(7, ci.getCustomerState());
            ps.setInt(8,ci.getPincode()); 
            ps.setString(9, ci.getCustomerRc());
            ps.setString(10, ci.getCustomerAadhaar());
            ps.setString(11, ci.getCustomerLicense());
            ps.setString(12, ci.getCustomerType());
              
            status=ps.executeUpdate();   
            System.out.println(status);
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }
	
	public static int update(CustomerInfo ci){  
		  
        int status=0;  	
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=con.prepareStatement("update customer_info set customer_name=?,customer_contact=?,customer_email=?,customer_address=?,customer_city=?,customer_state=?,pincode=?,customer_rc=?,customer_aadhaar=?,customer_license=?,customer_type=? where vehicle_number =?");  
            
            
            ps.setString(1, ci.getCustomerName());
            ps.setString(2, ci.getCustomerContact());
            ps.setString(3, ci.getCustomerEmail());
            ps.setString(4, ci.getCustomerAddress());
            ps.setString(5, ci.getCustomerCity());
            ps.setString(6, ci.getCustomerState());
            ps.setInt(7,ci.getPincode()); 
            ps.setString(8, ci.getCustomerRc());
            ps.setString(9, ci.getCustomerAadhaar());
            ps.setString(10, ci.getCustomerLicense());
            ps.setString(11, ci.getCustomerType());
            ps.setString(12, ci.getVehicleNumber());
              
            status=ps.executeUpdate();   
            System.out.println(status);
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }
	public static String getNameByNumber(String vehicle_number) {
		String customer_name = null;
		try{
		 Connection con=ConnectionDb.getConnection();  
         PreparedStatement ps=con.prepareStatement("select customer_name from customer_info where vehicle_number ='"+vehicle_number+"'");
         ResultSet rs = ps.executeQuery();
         while(rs.next())
         {
         customer_name = rs.getString("customer_name");
         }
		}catch(Exception e){e.printStackTrace();}
	return customer_name;
}  
	
	public static CustomerInfo getAllByNumber(String vehicle_number)
	{
		CustomerInfo ci = new CustomerInfo();
		try{
			 Connection con=ConnectionDb.getConnection();  
	         PreparedStatement ps=con.prepareStatement("select * from customer_info where vehicle_number ='"+vehicle_number+"'");
	         ResultSet rs = ps.executeQuery();
	         while(rs.next())
	         {
	        	 ci.setCustomerId(rs.getInt("customer_id"));
	        	 ci.setVehicleNumber(rs.getString("vehicle_number"));
	        	 ci.setCustomerName(rs.getString("customer_name"));
	         	ci.setCustomerContact(rs.getString("customer_contact"));
	         	ci.setCustomerEmail(rs.getString("customer_email"));
	         	ci.setCustomerAddress(rs.getString("customer_address"));
	         	ci.setCustomerCity(rs.getString("customer_city"));
	         	ci.setCustomerState(rs.getString("customer_state"));
	         	ci.setPincode(rs.getInt("pincode"));
	         	ci.setCustomerType(rs.getString("customer_type"));
	         	ci.setCustomerRc(rs.getString("customer_rc"));
	         	ci.setCustomerAadhaar(rs.getString("customer_aadhaar"));
	         	ci.setCustomerLicense(rs.getString("customer_license"));
	         }
			}catch(Exception e){e.printStackTrace();}
		return ci;
	}
	
	public static int getCountOfCustomerType(String customer_type)
	 {
		    int i=0;
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select count(vehicle_number) as total from customer_info where customer_type = ?") ;
	            ps.setString(1, customer_type);
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	i = rs.getInt("total");
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return i;
	 }
	public static List<CustomerInfo> getCountOfRegistrationByMonth(String year)
	 {
		List<CustomerInfo> list=new ArrayList<CustomerInfo>();  
		    
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select MONTH(ci_timestamp) as month, COUNT(customer_id) as total from customer_info where YEAR(ci_timestamp) = ? group by MONTH(ci_timestamp)") ;
	            ps.setString(1, year);
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	CustomerInfo ci=new CustomerInfo();
	            	ci.setPincode(rs.getInt("month"));
	            	ci.setCustomerId(rs.getInt("total"));
	            	
	            	list.add(ci);
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return list;
	 }
	public static List<CustomerInfo> getCountOfRegistrationByDate(String from, String to)
	 {
		List<CustomerInfo> list=new ArrayList<CustomerInfo>();  
		    
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("SELECT * FROM customer_info WHERE DATE(ci_timestamp) BETWEEN ? AND ?") ;
	            ps.setString(1, from);
	            ps.setString(2, to);
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	CustomerInfo ci=new CustomerInfo();
	            	 ci.setCustomerId(rs.getInt("customer_id"));
		        	 ci.setVehicleNumber(rs.getString("vehicle_number"));
		        	 ci.setCustomerName(rs.getString("customer_name"));
		         	ci.setCustomerContact(rs.getString("customer_contact"));
		         	ci.setCustomerEmail(rs.getString("customer_email"));
		         	ci.setCustomerAddress(rs.getString("customer_address"));
		         	ci.setCustomerCity(rs.getString("customer_city"));
		         	ci.setCustomerState(rs.getString("customer_state"));
		         	ci.setPincode(rs.getInt("pincode"));
		         	ci.setCustomerType(rs.getString("customer_type"));
		         	ci.setCustomerRc(rs.getString("customer_rc"));
		         	ci.setCustomerAadhaar(rs.getString("customer_aadhaar"));
		         	ci.setCustomerLicense(rs.getString("customer_license"));		         
	            	list.add(ci);
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return list;
	 }
}
