package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HistoryPaymentDao {

	public static int save(HistoryPayment hpy) {
		int status=0;  
        try{  
            Connection con= ConnectionDb.getConnection();  
           PreparedStatement ps=con.prepareStatement(  
                         "insert into history_payment(history_id,final_amount,payment_type,card_or_check_number,bank_name,payment_date) values (?,?,?,?,?,?)");  
            
           ps.setString(1,hpy.getHistoryId());	     
            ps.setInt(2, hpy.getFinalAmount());
            ps.setString(3,hpy.getPaymenttype()); 		           
            ps.setString(4,hpy.getCardOrCheckNumber());
            ps.setString(5,hpy.getBankName()); 	
            ps.setString(6,hpy.getPaymentDate());
            status=ps.executeUpdate();      
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status; 
		
	}
	
	 public static HistoryPayment getAllById(String history_id)
		{
		 HistoryPayment hp=new HistoryPayment();
			try{
				Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select * from history_payment where history_id='"+history_id+"' ");
	            ResultSet rs = ps.executeQuery();
	            while(rs.next())
	            {
	            	
	            	hp.setHistoryId(rs.getString("history_id"));
	            	hp.setBankName(rs.getString("bank_name"));
	            	hp.setFinalAmount(rs.getInt("final_amount"));
	            	hp.setPaymentDate(rs.getString("payment_date"));
	            	hp.setPaymenttype(rs.getString("payment_type"));
	            	hp.setCardOrCheckNumber(rs.getString("card_or_check_number"));
	            	
	            	
	            	
	            }
	            con.close();
			}
			catch(Exception e){e.printStackTrace();}
			return hp;
		}
	
	
	
	
	
	
			
	public static List<ReportObj> getRevenueByMonthAndSa(String year, String sa)
	 {
		 List<ReportObj> list=new ArrayList<ReportObj>();  
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("SELECT MONTH(history_payment.payment_date) as month, SUM(history_payment.final_amount) as total FROM history_payment, history WHERE YEAR(history_payment.payment_date) = ? AND history.officer_username = ? AND history.history_id = history_payment.history_id GROUP BY MONTH(history_payment.payment_date)") ;

	            ps.setString(1, year);
	            ps.setString(2, sa);			           
	            
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  

	            	ReportObj ro=new ReportObj();
	            	
	            	ro.setP1(rs.getInt("month"));
	            	ro.setP2(rs.getInt("total"));
	            	
	            	
	            	list.add(ro);
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return list;
	 }

}
