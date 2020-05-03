package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class InsuranceDao {

	public static int save(Insurance in){  
		  
        int status=0;  	
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "insert into insurance(vehicle_number, insurance_company, insurance_type, policy_number, expiry_date, date_of_loss, location,officer_username) values (?,?,?,?,?,?,?,?)");  
            
            ps.setString(1, in.getVehicleNumber());
            ps.setString(2, in.getInsuranceCompany());
           
            ps.setString(3, in.getInsuranceType());
            ps.setString(4, in.getPolicyNumber());
            ps.setString(5, in.getExpiryDate());
            ps.setString(6, in.getDateOfLoss());
            ps.setString(7, in.getLocation());
            ps.setString(8, in.getOfficer_username());
            status=ps.executeUpdate();   
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
	}
	
	public static List<Insurance> getAllBySA(String officer_username)
	{
		List<Insurance> list=new ArrayList<Insurance>();
		
		try{
			Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("SELECT * FROM insurance, jobcard_info WHERE insurance.vehicle_number = jobcard_info.vehicle_number AND jobcard_info.officer_username = ?");
            ps.setString(1, officer_username);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
            	Insurance in=new Insurance();
            	in.setVehicleNumber(rs.getString("vehicle_number"));
            	in.setPolicyNumber(rs.getString("policy_number"));
            	in.setInsuranceType(rs.getString("insurance_type"));
            	in.setExpiryDate(rs.getString("expiry_date"));
            	in.setDateOfLoss(rs.getString("date_of_loss"));
            	in.setInsuranceCompany(rs.getString("insurance_company"));
            	in.setLocation(rs.getString("location"));
            	
            	list.add(in);
            }
            con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return list;
	}
	
	public static Insurance getAllByUsername(String officer_username)
	{
		Insurance in=new Insurance();
		
		try{
			Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("SELECT * from officer_info where officer_username = ?");
            ps.setString(1, officer_username);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
            	
            	in.setVehicleNumber(rs.getString("vehicle_number"));
            	in.setPolicyNumber(rs.getString("policy_number"));
            	in.setInsuranceType(rs.getString("insurance_type"));
            	in.setExpiryDate(rs.getString("expiry_date"));
            	in.setDateOfLoss(rs.getString("date_of_loss"));
            	in.setInsuranceCompany(rs.getString("insurance_company"));
            	in.setLocation(rs.getString("location"));
            	
            	
            }
            con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return in;
	}
	public static List<Insurance> getAllByCompany(String company)
	{
		List<Insurance> list=new ArrayList<Insurance>();
		
		try{
			Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("SELECT * from insurance where insurance_company = ?");
            ps.setString(1, company);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
            	Insurance in=new Insurance();
            	in.setVehicleNumber(rs.getString("vehicle_number"));
            	in.setPolicyNumber(rs.getString("policy_number"));
            	in.setInsuranceType(rs.getString("insurance_type"));
            	in.setExpiryDate(rs.getString("expiry_date"));
            	in.setDateOfLoss(rs.getString("date_of_loss"));
            	in.setInsuranceCompany(rs.getString("insurance_company"));
            	in.setLocation(rs.getString("location"));
            	
            	list.add(in);
            }
            con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return list;
	}
}
