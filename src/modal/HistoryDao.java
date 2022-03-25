package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HistoryDao {

	public static int save(History history) {
			
			//Refactoring Method: Rename Variable in class: [HistoryDao]
			//ps -> preparedStatement
			//h -> history
		
	        int status=0;  	
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement preparedStatement=con.prepareStatement(  
	                         "insert into history(history_id,vehicle_number,officer_username,running_km,work_type,arrival_date,arrival_time,delivery_date,delivery_time) values (?,?,?,?,?,?,?,?,?)");  
	            preparedStatement.setString(1, history.getHistoryId());
	            preparedStatement.setString(2, history.getVehicleNumber());
	            preparedStatement.setString(3, history.getOfficerUsername());
	            preparedStatement.setInt(4, history.getRunningKM());
	            preparedStatement.setString(5, history.getWorkType());
	            preparedStatement.setString(6, history.getArrivalDate());
	            preparedStatement.setString(7, history.getArrivalTime());
	            preparedStatement.setString(8, history.getDeliveryDate());
	            preparedStatement.setString(9, history.getDeliveryTime());
	            
	            status=preparedStatement.executeUpdate();   
	            con.close();  
	        }catch(Exception ex){ex.printStackTrace();}  
	          
	        return status;  
		}
		
	public static List<History> getByNumber(String vehicle_number)
	 {
		 List<History> list=new ArrayList<History>();  
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement preparedStatement = con.prepareStatement("select * from history where vehicle_number=?") ;

	            preparedStatement.setString(1, vehicle_number);   
	            ResultSet rs = preparedStatement.executeQuery();
	            while(rs.next()){  
	            	History history = new History();
	            	history.setHistoryId(rs.getString("history_id"));
	            	history.setVehicleNumber(rs.getString("vehicle_number"));
	            	history.setOfficerUsername(rs.getString("officer_username"));
	            	history.setRunningKM(rs.getInt("running_km"));
	            	history.setWorkType(rs.getString("work_type"));
	            	history.setArrivalDate(rs.getString("arrival_date"));
	            	history.setArrivaltime(rs.getString("arrival_time"));
	            	history.setDeliveryDate(rs.getString("delivery_date"));
	            	history.setDeliveryTime(rs.getString("delivery_time"));
	            	list.add(history);
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
	            	History history = new History();
	            	history.setHistoryId(rs.getString("history_id"));
	            	history.setVehicleNumber(rs.getString("vehicle_number"));
	            	history.setOfficerUsername(rs.getString("officer_username"));
	            	history.setRunningKM(rs.getInt("running_km"));
	            	history.setWorkType(rs.getString("work_type"));
	            	history.setArrivalDate(rs.getString("arrival_date"));
	            	history.setArrivaltime(rs.getString("arrival_time"));
	            	history.setDeliveryDate(rs.getString("delivery_date"));
	            	history.setDeliveryTime(rs.getString("delivery_time"));
	            	list.add(history);
	            	
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return list;
	 }
	
	public static History getAllByNumber(String vehicle_number)
	 {
		History history = new History();
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select * from history where vehicle_number=?") ;

	            ps.setString(1, vehicle_number);   
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	
	            	history.setHistoryId(rs.getString("history_id"));
	            	history.setVehicleNumber(rs.getString("vehicle_number"));
	            	history.setOfficerUsername(rs.getString("officer_username"));
	            	history.setRunningKM(rs.getInt("running_km"));
	            	history.setWorkType(rs.getString("work_type"));
	            	history.setArrivalDate(rs.getString("arrival_date"));
	            	history.setArrivaltime(rs.getString("arrival_time"));
	            	history.setDeliveryDate(rs.getString("delivery_date"));
	            	history.setDeliveryTime(rs.getString("delivery_time"));
	            	
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return history;
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
	            	History history = new History();
	            	history.setHistoryId(rs.getString("history_id"));
	            	history.setVehicleNumber(rs.getString("vehicle_number"));
	            	history.setOfficerUsername(rs.getString("officer_username"));
	            	history.setRunningKM(rs.getInt("running_km"));
	            	history.setWorkType(rs.getString("work_type"));
	            	history.setArrivalDate(rs.getString("arrival_date"));
	            	history.setArrivaltime(rs.getString("arrival_time"));
	            	history.setDeliveryDate(rs.getString("delivery_date"));
	            	history.setDeliveryTime(rs.getString("delivery_time"));
	            	list.add(history);

	            	
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
	            PreparedStatement preparedStatement = con.prepareStatement("select * from history where officer_username = ?") ;
	            
	            preparedStatement.setString(1, officer_username);   
	            ResultSet rs = preparedStatement.executeQuery();
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
	            PreparedStatement preparedStatement = con.prepareStatement("SELECT vehicle_company.vehicle_company_name as company, COUNT(history.vehicle_number) as count FROM history, vehicle_company, vehicle_info WHERE history.vehicle_number = vehicle_info.vehicle_number AND vehicle_info.vehicle_company = vehicle_company.vehicle_company_id AND history.delivery_date BETWEEN ? AND ? AND history.officer_username = ? GROUP BY vehicle_company.vehicle_company_name") ;

	            preparedStatement.setString(1, from); 
	            preparedStatement.setString(2, to);
	            preparedStatement.setString(3, sa);
	            ResultSet rs = preparedStatement.executeQuery();
	            while(rs.next()){  
	            	History history = new History();
	            	history.setHistoryId(rs.getString("company"));	            	
	            	history.setRunningKM(rs.getInt("count"));
	            	
	            	list.add(history);
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
	            PreparedStatement preparedStatement = con.prepareStatement("SELECT vehicle_company.vehicle_company_name as company, COUNT(history.vehicle_number) as count FROM history, vehicle_company, vehicle_info WHERE history.vehicle_number = vehicle_info.vehicle_number AND vehicle_info.vehicle_company = vehicle_company.vehicle_company_id AND history.officer_username = ? GROUP BY vehicle_company.vehicle_company_name ") ;

	            preparedStatement.setString(1, sa); 	           
	            ResultSet rs = preparedStatement.executeQuery();
	            while(rs.next()){  
	            	History history = new History();
	            	history.setHistoryId(rs.getString("company"));	            	
	            	history.setRunningKM(rs.getInt("count"));
	            	
	            	list.add(history);
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
			            PreparedStatement preparedStatement = con.prepareStatement("SELECT history.vehicle_number AS vehiclenumber, history_payment.final_amount as finalamount FROM history_payment, history WHERE history.delivery_date BETWEEN ? AND ? AND history.history_id = history_payment.history_id AND history.officer_username = ?") ;

			            preparedStatement.setString(1, from);
			            preparedStatement.setString(2, to);
			            preparedStatement.setString(3, sa);
			            
			            ResultSet rs = preparedStatement.executeQuery();
			            while(rs.next()){  
			            	History history = new History();
			            	history.setHistoryId(rs.getString("vehiclenumber"));	            	
			            	history.setRunningKM(rs.getInt("finalamount"));
			            	
			            	list.add(history);
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
			            PreparedStatement preparedStatement = con.prepareStatement("SELECT history.vehicle_number AS vehiclenumber, history_payment.final_amount as finalamount FROM history_payment, history WHERE history.delivery_date BETWEEN ? AND ? AND history.history_id = history_payment.history_id AND history.officer_username = ?") ;

			            preparedStatement.setString(1, year);
			            preparedStatement.setString(2, sa);			           
			            
			            ResultSet rs = preparedStatement.executeQuery();
			            while(rs.next()){  
			            	History history = new History();
			            	history.setHistoryId(rs.getString("vehiclenumber"));	            	
			            	history.setRunningKM(rs.getInt("finalamount"));
			            	
			            	list.add(history);
			            }  
			            con.close();  
			        }catch(Exception e){e.printStackTrace();}   
				 return list;
			 }

			public static History getHistoryById(String hid) {
				 History history = new History();  
			        try{  
			            Connection con=ConnectionDb.getConnection();  
			            PreparedStatement preparedStatement = con.prepareStatement("select * from history where history_id = ?") ;
			            preparedStatement.setString(1, hid);			            
			            
			            ResultSet rs = preparedStatement.executeQuery();
			            while(rs.next()){	
			            	history.setHistoryId(rs.getString("history_id"));
			            	history.setVehicleNumber(rs.getString("vehicle_number"));
			            	history.setOfficerUsername(rs.getString("officer_username"));
			            	history.setRunningKM(rs.getInt("running_km"));
			            	history.setWorkType(rs.getString("work_type"));
			            	history.setArrivalDate(rs.getString("arrival_date"));
			            	history.setArrivaltime(rs.getString("arrival_time"));
			            	history.setDeliveryDate(rs.getString("delivery_date"));
			            	history.setDeliveryTime(rs.getString("delivery_time"));
			            }  
			            con.close();  
			        }catch(Exception e){e.printStackTrace();}   
				 return history;
			}
}


