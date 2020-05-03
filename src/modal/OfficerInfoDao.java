package modal;

import java.util.ArrayList;
import java.util.List;
import modal.OfficerInfo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OfficerInfoDao {

	public static int save(OfficerInfo oi) {
		int status=0;  	
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "insert into officer_info(officer_username,officer_name,officer_role,officer_contact,officer_email,officer_password) values (?,?,?,?,?,?)");  
            
            ps.setString(1, oi.getOfficerUsername());
            ps.setString(2, oi.getOfficerName());
            ps.setString(3, oi.getOfficerRole());
            ps.setString(4, oi.getOfficerContact());
            ps.setString(5, oi.getOfficerEmail());
            ps.setString(6, oi.getOfficerPassword());
              
            status=ps.executeUpdate();   
            System.out.println(status);
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;
	}
	
	
	public static boolean authenticate(String username, String password) throws SQLException {
		Connection con = ConnectionDb.getConnection();
		PreparedStatement ps = con.prepareStatement("select officer_role from officer_info where  officer_username= ? and officer_password =?");
		ps.setString(1, username);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	public static OfficerInfo getByUsername(String username){
		Connection con = ConnectionDb.getConnection();
		OfficerInfo oi = new OfficerInfo();
		try {
		PreparedStatement ps = con.prepareStatement("select * from officer_info where officer_username= ?");
		ps.setString(1, username);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			oi.setOfficerUsername(rs.getString("officer_username"));
			oi.setOfficerContact(rs.getString("officer_contact"));
			oi.setOfficerEmail(rs.getString("officer_email"));
			oi.setOfficerName(rs.getString("officer_name"));
			oi.setOfficerRole(rs.getString("officer_role"));
			oi.setOfficerCompany(rs.getString("officer_company"));
		}	
		} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return oi;
	}
	
	
	public static OfficerInfo getAllByRole(String officer_role) throws SQLException {
		Connection con = ConnectionDb.getConnection();
		OfficerInfo oi = new OfficerInfo();
		PreparedStatement ps = con.prepareStatement("select * from officer_info where officer_role = ?");
		ps.setString(1, officer_role);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			oi.setOfficerUsername(rs.getString("officer_username"));
			oi.setOfficerContact(rs.getString("officer_contact"));
			oi.setOfficerEmail(rs.getString("officer_email"));
			oi.setOfficerName(rs.getString("officer_name"));
			oi.setOfficerRole(rs.getString("officer_role"));
		}
		return oi;
	} 
	
	public static String getByCompany(String company) throws SQLException {
		Connection con = ConnectionDb.getConnection();
		OfficerInfo oi = new OfficerInfo();
		PreparedStatement ps = con.prepareStatement("select officer_username from officer_info where officer_company = ?");
		ps.setString(1, company);
		String ou="";
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			ou = rs.getString("officer_username");
		}
		return ou;
	} 
	
	
	public static List<OfficerInfo> getByOfficerRole(String officer_role)
	{
		List<OfficerInfo> list=new ArrayList<OfficerInfo>();
		
		try{
			Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("select * from officer_info where officer_role = ?");
            ps.setString(1, officer_role);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
            	OfficerInfo oi=new OfficerInfo();
            	oi.setOfficerUsername(rs.getString("officer_username"));
            	oi.setOfficerRole(rs.getString("officer_role"));
            	oi.setOfficerName(rs.getString("officer_name"));
            	oi.setOfficerContact(rs.getString("officer_contact"));
            	
            	list.add(oi);
            }
            con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return list;
	}
}
