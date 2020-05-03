package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AdvisorSolutionDao {
	public static int save(AdvisorSolution as){  
		  
        int status=0;  	
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "insert into advisor_solution(jobcard_number,description,price) values (?,?,?)");  
            
            ps.setInt(1, as.getJobcardNumber());
            ps.setString(2, as.getDescription());
            ps.setInt(3, as.getPrice());
              
            status=ps.executeUpdate();   
            System.out.println(status);
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }
	public static int delete(int jobcardNumber)
	{
		int status=0;
		try{
			Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps = con.prepareStatement("delete from advisor_solution where jobcard_number='"+jobcardNumber+"' ");
             status = ps.executeUpdate();
            con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return status;
	}
	public static List<AdvisorSolution> getAll(int jobcard_number)
	{
		List<AdvisorSolution> list = new ArrayList<AdvisorSolution>();
		try{
			 Connection con=ConnectionDb.getConnection();  
	         PreparedStatement ps=con.prepareStatement("select * from advisor_solution where jobcard_number ='"+jobcard_number+"'");
	         ResultSet rs = ps.executeQuery();
	         while(rs.next())
	         {
	        	 AdvisorSolution as = new AdvisorSolution();
	        	 as.setSolutionId(rs.getInt("solution_id"));
	        	 as.setDescription(rs.getString("description"));
	        	 as.setJobcardNumber(rs.getInt("jobcard_number"));
	        	 as.setPrice(rs.getInt("price"));
	        	 list.add(as);
	         }
			}catch(Exception e){e.printStackTrace();}
		return list;
	}
	 public static int deleteById(int solution_id)
		{
			int status=0;
			try{
				Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("delete from advisor_solution where solution_id='"+solution_id+"' ");
	             status = ps.executeUpdate();
	            con.close();
			}
			catch(Exception e){e.printStackTrace();}
			return status;
		}
}
