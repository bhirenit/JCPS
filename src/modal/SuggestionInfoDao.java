package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class SuggestionInfoDao {
	public static SuggestionInfo getPrediction(String complain)
	{
		SuggestionInfo si = new SuggestionInfo();
		try{
			 Connection con=ConnectionDb.getConnection();  
	         PreparedStatement ps=con.prepareStatement("select * from suggestion_info where customer_complain like '"+complain+"'");
	         ResultSet rs = ps.executeQuery();
	         while(rs.next())
	         {
	        	si.setDescription(rs.getString("description"));
	        	si.setCustomerComplain(rs.getString("customer_complain"));
	        	si.setSuggestionId(rs.getInt("suggestion_id"));
	         }
			}catch(Exception e){e.printStackTrace();}
		return si;
	}
	
	
	public static List<String> getTokens(String description)
	{
		List<String> list = new ArrayList<String>();
		StringTokenizer st1 = new StringTokenizer(description, ",");
		while(st1.hasMoreTokens())
		{
			list.add(st1.nextToken());
		}
		return list;
	}
}
