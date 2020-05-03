package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HistoryDao {

	public static int save(History h) {
			  
	        int status=0;  	
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps=con.prepareStatement(  
	                         "insert into history(history_id,vehicle_number,officer_username,running_km,work_type,arrival_date,arrival_time,delivery_date,delivery_time) values (?,?,?,?,?,?,?,?,?)");  
	            ps.setString(1, h.getHistoryId());
	            ps.setString(2, h.getVehicleNumber());
	            ps.setString(3, h.getOfficerUsername());
	            ps.setInt(4, h.getRunningKM());
	            ps.setString(5, h.getWorkType());
	            ps.setString(6, h.getArrivalDate());
	            ps.setString(7, h.getArrivalTime());
	            ps.setString(8, h.getDeliveryDate());
	            ps.setString(9, h.getDeliveryTime());
	            
	            status=ps.executeUpdate();   
	            con.close();  
	        }catch(Exception ex){ex.printStackTrace();}  
	          
	        return status;  
		}
		
	public static List<History> getByNumber(String vehicle_number)
	 {
		 List<History> list=new ArrayList<History>();  
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select * from history where vehicle_number=?") ;

	            ps.setString(1, vehicle_number);   
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	History h = new History();
	            	h.setHistoryId(rs.getString("history_id"));
	            	h.setVehicleNumber(rs.getString("vehicle_number"));
	            	h.setOfficerUsername(rs.getString("officer_username"));
	            	h.setRunningKM(rs.getInt("running_km"));
	            	h.setWorkType(rs.getString("work_type"));
	            	h.setArrivalDate(rs.getString("arrival_date"));
	            	h.setArrivaltime(rs.getString("arrival_time"));
	            	h.setDeliveryDate(rs.getString("delivery_date"));
	            	h.setDeliveryTime(rs.getString("delivery_time"));
	            	list.add(h);
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return list;
	 }
	
	public static List<History> getListByNumber(String vehicle_number)
	 {
		List<History> list = new ArrayList<History>();
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select * from history where vehicle_number=?") ;

	            ps.setString(1, vehicle_number);   
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	History h = new History();
	            	h.setHistoryId(rs.getString("history_id"));
	            	h.setVehicleNumber(rs.getString("vehicle_number"));
	            	h.setOfficerUsername(rs.getString("officer_username"));
	            	h.setRunningKM(rs.getInt("running_km"));
	            	h.setWorkType(rs.getString("work_type"));
	            	h.setArrivalDate(rs.getString("arrival_date"));
	            	h.setArrivaltime(rs.getString("arrival_time"));
	            	h.setDeliveryDate(rs.getString("delivery_date"));
	            	h.setDeliveryTime(rs.getString("delivery_time"));
	            	list.add(h);
	            	
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return list;
	 }
	
	public static History getAllByNumber(String vehicle_number)
	 {
		History h = new History();
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select * from history where vehicle_number=?") ;

	            ps.setString(1, vehicle_number);   
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	
	            	h.setHistoryId(rs.getString("history_id"));
	            	h.setVehicleNumber(rs.getString("vehicle_number"));
	            	h.setOfficerUsername(rs.getString("officer_username"));
	            	h.setRunningKM(rs.getInt("running_km"));
	            	h.setWorkType(rs.getString("work_type"));
	            	h.setArrivalDate(rs.getString("arrival_date"));
	            	h.setArrivaltime(rs.getString("arrival_time"));
	            	h.setDeliveryDate(rs.getString("delivery_date"));
	            	h.setDeliveryTime(rs.getString("delivery_time"));
	            	
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return h;
	 }
	
	
	
	
	public static List<History>  getByOfficerUsername(String officer_username)
		 
	 {
		List<History> list=new ArrayList<History>();
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select * from history where officer_username=?") ;

	            ps.setString(1, officer_username);   
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	History h = new History();
	            	h.setHistoryId(rs.getString("history_id"));
	            	h.setVehicleNumber(rs.getString("vehicle_number"));
	            	h.setOfficerUsername(rs.getString("officer_username"));
	            	h.setRunningKM(rs.getInt("running_km"));
	            	h.setWorkType(rs.getString("work_type"));
	            	h.setArrivalDate(rs.getString("arrival_date"));
	            	h.setArrivaltime(rs.getString("arrival_time"));
	            	h.setDeliveryDate(rs.getString("delivery_date"));
	            	h.setDeliveryTime(rs.getString("delivery_time"));
	            	list.add(h);

	            	
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return list;
	 }
	
	 public static int getTotal(String officer_username)
	 {
		    int i=0;
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select * from history where officer_username = ?") ;
	            
	            ps.setString(1, officer_username);   
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	i++;
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return i;
	 }
	
	public static List<History> getCountOfCompanyByDate(String from, String to, String sa)
	 {
		 List<History> list=new ArrayList<History>();  
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("SELECT vehicle_company.vehicle_company_name as company, COUNT(history.vehicle_number) as count FROM history, vehicle_company, vehicle_info WHERE history.vehicle_number = vehicle_info.vehicle_number AND vehicle_info.vehicle_company = vehicle_company.vehicle_company_id AND history.delivery_date BETWEEN ? AND ? AND history.officer_username = ? GROUP BY vehicle_company.vehicle_company_name") ;

	            ps.setString(1, from); 
	            ps.setString(2, to);
	            ps.setString(3, sa);
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	History h = new History();
	            	h.setHistoryId(rs.getString("company"));	            	
	            	h.setRunningKM(rs.getInt("count"));
	            	
	            	list.add(h);
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return list;
	 }
	
			public static List<History> getCountOfCompanyNameBySA(String sa)
	 {
		 List<History> list=new ArrayList<History>();  
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("SELECT vehicle_company.vehicle_company_name as company, COUNT(history.vehicle_number) as count FROM history, vehicle_company, vehicle_info WHERE history.vehicle_number = vehicle_info.vehicle_number AND vehicle_info.vehicle_company = vehicle_company.vehicle_company_id AND history.officer_username = ? GROUP BY vehicle_company.vehicle_company_name ") ;

	            ps.setString(1, sa); 	           
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	History h = new History();
	            	h.setHistoryId(rs.getString("company"));	            	
	            	h.setRunningKM(rs.getInt("count"));
	            	
	            	list.add(h);
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return list;
	 }
			
			
				
			public static List<History> getRevenueByDateAndSA(String from, String to, String sa)
			 {
				 List<History> list=new ArrayList<History>();  
			        try{  
			            Connection con=ConnectionDb.getConnection();  
			            PreparedStatement ps = con.prepareStatement("SELECT history.vehicle_number AS vehiclenumber, history_payment.final_amount as finalamount FROM history_payment, history WHERE history.delivery_date BETWEEN ? AND ? AND history.history_id = history_payment.history_id AND history.officer_username = ?") ;

			            ps.setString(1, from);
			            ps.setString(2, to);
			            ps.setString(3, sa);
			            
			            ResultSet rs = ps.executeQuery();
			            while(rs.next()){  
			            	History h = new History();
			            	h.setHistoryId(rs.getString("vehiclenumber"));	            	
			            	h.setRunningKM(rs.getInt("finalamount"));
			            	
			            	list.add(h);
			            }  
			            con.close();  
			        }catch(Exception e){e.printStackTrace();}   
				 return list;
			 }
			public static List<History> getRevenueByMonth(String year, String sa)
			 {
				 List<History> list=new ArrayList<History>();  
			        try{  
			            Connection con=ConnectionDb.getConnection();  
			            PreparedStatement ps = con.prepareStatement("SELECT history.vehicle_number AS vehiclenumber, history_payment.final_amount as finalamount FROM history_payment, history WHERE history.delivery_date BETWEEN ? AND ? AND history.history_id = history_payment.history_id AND history.officer_username = ?") ;

			            ps.setString(1, year);
			            ps.setString(2, sa);			           
			            
			            ResultSet rs = ps.executeQuery();
			            while(rs.next()){  
			            	History h = new History();
			            	h.setHistoryId(rs.getString("vehiclenumber"));	            	
			            	h.setRunningKM(rs.getInt("finalamount"));
			            	
			            	list.add(h);
			            }  
			            con.close();  
			        }catch(Exception e){e.printStackTrace();}   
				 return list;
			 }

			public static History getHistoryById(String hid) {
				 History h = new History();  
			        try{  
			            Connection con=ConnectionDb.getConnection();  
			            PreparedStatement ps = con.prepareStatement("select * from history where history_id = ?") ;
			            ps.setString(1, hid);			            
			            
			            ResultSet rs = ps.executeQuery();
			            while(rs.next()){	
			            	h.setHistoryId(rs.getString("history_id"));
			            	h.setVehicleNumber(rs.getString("vehicle_number"));
			            	h.setOfficerUsername(rs.getString("officer_username"));
			            	h.setRunningKM(rs.getInt("running_km"));
			            	h.setWorkType(rs.getString("work_type"));
			            	h.setArrivalDate(rs.getString("arrival_date"));
			            	h.setArrivaltime(rs.getString("arrival_time"));
			            	h.setDeliveryDate(rs.getString("delivery_date"));
			            	h.setDeliveryTime(rs.getString("delivery_time"));
			            }  
			            con.close();  
			        }catch(Exception e){e.printStackTrace();}   
				 return h;
			}
}


