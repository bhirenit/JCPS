package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class JobcardInfoDao {
	public static int save(JobcardInfo ji){  
		  
        int status=0;  	
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "insert into jobcard_info(vehicle_number,officer_username,status,arrival_date,arrival_time) values (?,?,?,?,?)");  
            
            ps.setString(1, ji.getVehicleNumber());
            ps.setString(2, ji.getOfficeUsername());
            // set date and time arrival and delivery
            ps.setString(3, ji.getStatus());
            ps.setString(4, ji.getArrivalDate());
            ps.setString(5, ji.getArrivalTime());
            status=ps.executeUpdate();   
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
	}
	public static int update(JobcardInfo ji){  
		  
        int status=0;  	
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=con.prepareStatement("update jobcard_info set work_type='"+ji.getWorkType()+"' , delivery_date = '"+ji.getDeliveryDate()+"',running_km = '"+ji.getRunningKm()+"', available_fuel = '"+ji.getAvailableFuel()+"',delivery_time = '"+ji.getDeliveryTime()+"',status ='pending' where vehicle_number = '"+ji.getVehicleNumber()+"' ");  
            
            status=ps.executeUpdate();   
            System.out.println(status);
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }
	
	public static JobcardInfo getTempByNumber(int jobcard_number)
	 {
		 JobcardInfo ji=new JobcardInfo();  
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select arrival_date,arrival_time from jobcard_info where jobcard_number = ? ") ;
	            ps.setInt(1, jobcard_number);
	    
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	ji.setArrivalDate(rs.getString("arrival_date"));
	            	ji.setArrivalTime(rs.getString("arrival_time"));
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return ji;
	 }
	 public static List<JobcardInfo> getList(String officer_username,String status)
	 {
		 List<JobcardInfo> list=new ArrayList<JobcardInfo>();  
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select * from jobcard_info where officer_username = ? and status = ?") ;
	            ps.setString(1, officer_username);
	            ps.setString(2, status);   
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	JobcardInfo jci = new JobcardInfo();
	            	jci.setVehicleNumber(rs.getString("vehicle_number"));
	            	jci.setJobcardNumber(rs.getInt("jobcard_number"));
	            	list.add(jci);
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return list;
	 }
	 
	 public static List<JobcardInfo> getByStatus(String status)
	 {
		 List<JobcardInfo> list=new ArrayList<JobcardInfo>();  
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select * from jobcard_info where status = ?") ;

	            ps.setString(1, status);   
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	JobcardInfo jci = new JobcardInfo();
	            	jci.setVehicleNumber(rs.getString("vehicle_number"));
	            	jci.setJobcardNumber(rs.getInt("jobcard_number"));
	            	jci.setOfficeUsername(rs.getString("officer_username"));
	            	list.add(jci);
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return list;
	 }
	 public static List<JobcardInfo> getByOfficer(String officer_username)
	 {
		 List<JobcardInfo> list=new ArrayList<JobcardInfo>();  
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select * from jobcard_info where officer_username = ?") ;
	            ps.setString(1, officer_username);   
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	JobcardInfo jci = new JobcardInfo();
	            	jci.setVehicleNumber(rs.getString("vehicle_number"));
	            	jci.setJobcardNumber(rs.getInt("jobcard_number"));
	            	jci.setArrivalDate(rs.getString("arrival_date"));
	            	jci.setStatus(rs.getString("status"));
	            	list.add(jci);
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return list;
	 }
	  
	 public static int getTotal(String officer_username,String status)
	 {
		    int i=0;
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select vehicle_number from jobcard_info where status = ? and officer_username = ?") ;
	            ps.setString(1, status);
	            ps.setString(2, officer_username);   
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	i++;
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return i;
	 }
	 public static int getCountByStatus(String status)
	 {
		    int i=0;
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select count(jobcard_number) from jobcard_info where status = ? ") ;
	            ps.setString(1, status);
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	            	i = rs.getInt(1);
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return i;
	 }

	 public static int getJNByNumber(String vehicle_number)
	 {
		    int i=0;
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select jobcard_number from jobcard_info where vehicle_number = ?") ;
	            ps.setString(1, vehicle_number);
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	              i = rs.getInt("jobcard_number");
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return i;
	 }
	 public static String getVNByNumber(int jobcard_number)
	 {
		    String i=null;
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select vehicle_number from jobcard_info where jobcard_number = ?") ;
	            ps.setInt(1, jobcard_number);
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	              i = rs.getString("vehicle_number");
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return i;
	 }
	 
	 public static int getJNByNumber(String vehicle_number, String status)
	 {
		    int i=0;
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps = con.prepareStatement("select jobcard_number from jobcard_info where vehicle_number = ? and status = ?") ;
	            ps.setString(1, vehicle_number);
	            ps.setString(2, status);
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){  
	              i = rs.getInt("jobcard_number");
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}   
		 return i;
	 }
	 
		public static JobcardInfo getAllByNumber(String vehicle_number) {
			JobcardInfo jc = new JobcardInfo();
			try{
			 Connection con=ConnectionDb.getConnection();  
	         PreparedStatement ps=con.prepareStatement("select * from jobcard_info where vehicle_number ='"+vehicle_number+"'");
	         ResultSet rs = ps.executeQuery();
	         while(rs.next())
	         {
	        	 jc.setVehicleNumber(rs.getString("vehicle_number"));
	        	 jc.setJobcardNumber(rs.getInt("jobcard_number"));
	        	 jc.setOfficeUsername(rs.getString("officer_username"));
	        	 jc.setWorkType(rs.getString("work_type"));
	        	 jc.setArrivalDate(rs.getString("arrival_date"));
	        	 jc.setArrivalTime(rs.getString("arrival_time"));
	        	 jc.setAvailableFuel(rs.getInt("available_fuel"));
	        	 jc.setDeliveryDate(rs.getString("delivery_date"));
	        	 jc.setDeliveryTime(rs.getString("delivery_time"));
	        	 jc.setRunningKm(rs.getInt("running_km"));
	        	 jc.setStatus(rs.getString("status"));
	        	 
	        	 	
	         }
			}catch(Exception e){e.printStackTrace();}
			return jc;
		}
		
		
		public static JobcardInfo getAllByJC(int jobcardNumber) {
			JobcardInfo jc = new JobcardInfo();
			try{
			 Connection con=ConnectionDb.getConnection();  
	         PreparedStatement ps=con.prepareStatement("select * from jobcard_info where jobcard_number ='"+jobcardNumber+"'");
	         ResultSet rs = ps.executeQuery();
	         while(rs.next())
	         {
	        	 jc.setVehicleNumber(rs.getString("vehicle_number"));
	        	 jc.setOfficeUsername(rs.getString("officer_username"));
	        	 jc.setJobcardNumber(rs.getInt("jobcard_number"));
	        	 jc.setWorkType(rs.getString("work_type"));
	        	 jc.setArrivalDate(rs.getString("arrival_date"));
	        	 jc.setArrivalTime(rs.getString("arrival_time"));
	        	 jc.setAvailableFuel(rs.getInt("available_fuel"));
	        	 jc.setDeliveryDate(rs.getString("delivery_date"));
	        	 jc.setDeliveryTime(rs.getString("delivery_time"));
	        	 jc.setRunningKm(rs.getInt("running_km"));
	        	 jc.setStatus(rs.getString("status"));
	        	 
	        	 	
	         }
			}catch(Exception e){e.printStackTrace();}
			return jc;
		}
		public static boolean checkIfAllCompleted(int jobcardNumber) throws SQLException {
			boolean partflag=false,serviceflag=false,lubricantflag=false;
			partflag = JcPartDao.checkIfAllCompleted(jobcardNumber);
			serviceflag = JcServiceDao.checkIfAllCompleted(jobcardNumber);
			lubricantflag = JcLubricantDao.checkIfAllCompleted(jobcardNumber);
			if(partflag==true && serviceflag == true && lubricantflag == true)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		public static int updateStatus(int jobcardNumber,String status) {
			int status1=0;  
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps=con.prepareStatement("update jobcard_info set status='"+status+"' where jobcard_number = '"+jobcardNumber+"' ");  
	            
	            status1=ps.executeUpdate();  
	            con.close();  
	        }catch(Exception ex){ex.printStackTrace();}  
	          
	        return status1;  
		}
		public static int delete(int jobcardNumber) {
			int status=0;
			try{
				Connection con=ConnectionDb.getConnection();  
		        PreparedStatement ps = con.prepareStatement("delete from jobcard_info where jobcard_number='"+jobcardNumber+"' ");
		         status = ps.executeUpdate();
		        con.close();
			}
			catch(Exception e){e.printStackTrace();}
			return status;
			
		}
		public static int getFinalAmount(int jobcardNumber) {
			int finalamount=0;
			
			finalamount = JcPartDao.getTotalAmount(jobcardNumber) + JcServiceDao.getTotalAmount(jobcardNumber) + JcLubricantDao.getTotalAmount(jobcardNumber);
			return finalamount;
			
		}		
		public static List<JobcardInfo> getCountOfWorkloadOfSA()
		 {
			List<JobcardInfo> list=new ArrayList<JobcardInfo>();  
			    
		        try{  
		            Connection con=ConnectionDb.getConnection();  
		            PreparedStatement ps = con.prepareStatement("SELECT officer_username , COUNT(vehicle_number) AS total FROM jobcard_info WHERE (status = 'pending' OR status = 'repaired' OR status = 'arrived') GROUP BY officer_username") ;
		           
		            ResultSet rs = ps.executeQuery();
		            while(rs.next()){  
		            	JobcardInfo ji=new JobcardInfo();
		            	ji.setOfficeUsername(rs.getString("officer_username"));
		            	ji.setAvailableFuel(rs.getInt("total"));
		            	//i = ji.getInt("total");
		            	list.add(ji);
		            }  
		            con.close();  
		        }catch(Exception e){e.printStackTrace();}   
			 return list;
		 }
		public static List<JobcardInfo> getAllByDate(String from, String to)
		 {
			List<JobcardInfo> list=new ArrayList<JobcardInfo>();  
			    
		        try{  
		            Connection con=ConnectionDb.getConnection();  
		            PreparedStatement ps = con.prepareStatement("SELECT * FROM jobcard_info WHERE DATE(arrival_date) BETWEEN ? AND ?") ;
		            ps.setString(1, from);
		            ps.setString(2, to);
		            ResultSet rs = ps.executeQuery();
		            while(rs.next()){  
		            	JobcardInfo jc=new JobcardInfo();
		            	jc.setVehicleNumber(rs.getString("vehicle_number"));
		            	jc.setJobcardNumber(rs.getInt("jobcard_number"));
			        	 jc.setOfficeUsername(rs.getString("officer_username"));
			        	 jc.setWorkType(rs.getString("work_type"));
			        	 jc.setArrivalDate(rs.getString("arrival_date"));
			        	 jc.setArrivalTime(rs.getString("arrival_time"));
			        	 jc.setAvailableFuel(rs.getInt("available_fuel"));
			        	 jc.setDeliveryDate(rs.getString("delivery_date"));
			        	 jc.setDeliveryTime(rs.getString("delivery_time"));
			        	 jc.setRunningKm(rs.getInt("running_km"));
			        	 jc.setStatus(rs.getString("status"));
			        	 
		            	list.add(jc);
		            }  
		            con.close();  
		        }catch(Exception e){e.printStackTrace();}   
			 return list;
		 }
		
		public static List<ReportObj> getCountOfJobStatusByUsername(String OfficerUsername)
		 {
			 	List<ReportObj> JcList = new ArrayList<ReportObj>();
			 	
			    int jobcardNumber=0;
		        try{  
		            Connection con=ConnectionDb.getConnection();  
		            PreparedStatement ps = con.prepareStatement("select jobcard_number from jobcard_info where Officer_username = ?") ;
		            ps.setString(1, OfficerUsername);
		            ResultSet rs = ps.executeQuery();
		            while(rs.next()){  
		              jobcardNumber = rs.getInt("jobcard_number");
		              int pendingPartCount = JcPartDao.getCount(jobcardNumber,"pending");
		              int completedPartCount = JcPartDao.getCount(jobcardNumber,"completed");
		              int pendingServiceCount = JcServiceDao.getCount(jobcardNumber,"pending");
		              int completedServiceCount = JcServiceDao.getCount(jobcardNumber,"completed");
		              int pendingLubricantCount = JcLubricantDao.getCount(jobcardNumber,"pending");
		              int completedLubricantCount = JcLubricantDao.getCount(jobcardNumber,"completed");
		              ReportObj ro = new ReportObj(pendingPartCount, completedPartCount, pendingServiceCount, completedServiceCount, pendingLubricantCount, completedLubricantCount, jobcardNumber);
		              JcList.add(ro);
		            }  
		            con.close();  
		        }catch(Exception e){e.printStackTrace();}   
			 return JcList;
		 }
		
		public static int changeAllocation(int jobcardNumber,String officer_username) {
			int status1=0;  
	        try{  
	            Connection con=ConnectionDb.getConnection();  
	            PreparedStatement ps=con.prepareStatement("update jobcard_info set officer_username='"+officer_username+"' where jobcard_number = '"+jobcardNumber+"' ");  
	            
	            status1=ps.executeUpdate();  
	            con.close();  
	        }catch(Exception ex){ex.printStackTrace();}  
	          
	        return status1;  
		}
		
		 public static List<JobcardInfo> getAll()
		 {
			 List<JobcardInfo> list=new ArrayList<JobcardInfo>();  
		        try{  
		            Connection con=ConnectionDb.getConnection();  
		            PreparedStatement ps = con.prepareStatement("select * from jobcard_info") ;
		            ResultSet rs = ps.executeQuery();
		            while(rs.next()){  
		            	JobcardInfo jci = new JobcardInfo();
		            	jci.setVehicleNumber(rs.getString("vehicle_number"));
			        	 jci.setJobcardNumber(rs.getInt("jobcard_number"));
			        	 jci.setOfficeUsername(rs.getString("officer_username"));
			        	 jci.setWorkType(rs.getString("work_type"));
			        	 jci.setArrivalDate(rs.getString("arrival_date"));
			        	 jci.setArrivalTime(rs.getString("arrival_time"));
			        	 jci.setAvailableFuel(rs.getInt("available_fuel"));
			        	 jci.setDeliveryDate(rs.getString("delivery_date"));
			        	 jci.setDeliveryTime(rs.getString("delivery_time"));
			        	 jci.setRunningKm(rs.getInt("running_km"));
			        	 jci.setStatus(rs.getString("status"));
		            	list.add(jci);
		            }  
		            con.close();  
		        }catch(Exception e){e.printStackTrace();}   
			 return list;
		 }
}
