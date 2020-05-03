package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JcAccessoriesDao {

	public static int save(JcAccessories jca){  
		  
        int status=0;  	
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "insert into jc_accessories(jobcard_number,toolkit,spare_wheel,jack_and_handle,mats,wheel_caps,mud_flaps,sterio,clock_or_photo,other, image) values (?,?,?,?,?,?,?,?,?,?,?)");  
            ps.setInt(1, jca.getJobcardNumber());
            ps.setBoolean(2, false);
            ps.setBoolean(3, false);
            ps.setBoolean(4, false);
            ps.setBoolean(5, false);
            ps.setBoolean(6, false);
            ps.setBoolean(7, false);
            ps.setBoolean(8, false);
            ps.setBoolean(9, false);
            ps.setString(10, null);
            ps.setString(11, jca.getImage());
            status=ps.executeUpdate();   
            System.out.println(status);
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }

	public static int delete(int jobcardNumber) {
		int status=0;
		try{
			Connection con=ConnectionDb.getConnection();  
	        PreparedStatement ps = con.prepareStatement("delete from jc_accessories where jobcard_number='"+jobcardNumber+"' ");
	         status = ps.executeUpdate();
	        con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return status;
		
	}

	public static int update(JcAccessories jca) {
		int status=0;
		try{
			Connection con=ConnectionDb.getConnection();  
	        PreparedStatement ps = con.prepareStatement("update jc_accessories set toolkit=? , spare_wheel=? , jack_and_handle=? , mats = ?, wheel_caps = ?, mud_flaps = ?,sterio = ?, clock_or_photo = ?, other = ? where jobcard_number=? ");
	        ps.setBoolean(1, jca.isToolkit()); 
	        ps.setBoolean(2, jca.isSpareWheel()); 
	        ps.setBoolean(3, jca.isJackAndHandle()); 
	        ps.setBoolean(4, jca.isMats()); 
	        ps.setBoolean(5, jca.isWheelCaps()); 
	        ps.setBoolean(6, jca.isMudFlaps()); 
	        ps.setBoolean(7, jca.isSterio()); 
	        ps.setBoolean(8, jca.isClockOrPhoto()); 
	        ps.setString(9, jca.getOther()); 
	        ps.setInt(10, jca.getJobcardNumber()); 
	        status = ps.executeUpdate();
	        con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return status;
		
	}
	
	public static String getImage(int jobcardNumber) {
		String image=null;
		try{
			Connection con=ConnectionDb.getConnection();  
	        PreparedStatement ps = con.prepareStatement("select image from jc_accessories where jobcard_number='"+jobcardNumber+"' ");
	         ResultSet rs = ps.executeQuery();
	         if(rs.next())
	         {	
	        	image = rs.getString("image"); 
	         }
	        con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return image;
		
	}
	
	public static JcAccessories getByNumber(int jobcardNumber) {
		JcAccessories jca = new JcAccessories();
		try{
			Connection con=ConnectionDb.getConnection();  
	        PreparedStatement ps = con.prepareStatement("select * from jc_accessories where jobcard_number='"+jobcardNumber+"' ");
	         ResultSet rs = ps.executeQuery();
	 
	         if(rs.next())
	         {	
	        	jca.setToolkit(rs.getBoolean("toolkit"));
	        	jca.setSpareWheel(rs.getBoolean("spare_wheel"));
	        	jca.setJackAndHandle(rs.getBoolean("jack_and_handle"));
	        	jca.setMats(rs.getBoolean("mats"));
	        	jca.setWheelCaps(rs.getBoolean("wheel_caps"));
	        	jca.setMudFlaps(rs.getBoolean("mud_flaps"));
	        	jca.setSterio(rs.getBoolean("sterio"));
	        	jca.setClockOrPhoto(rs.getBoolean("clock_or_photo"));
	        	jca.setOther(rs.getString("other"));
	        	jca.setImage(rs.getString("image"));
	        	
	         }
	        con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return jca;
		
	}
}
