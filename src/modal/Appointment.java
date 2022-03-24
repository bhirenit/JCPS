package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Appointment {

	
	private String vehicleNumber;
	private String requestDate;
	private String requestTime;
	private String AppointmentDate;
	private String AppointmentTime;
	private String workType;
	private int runningKM;
	

	//Refactoring Method: Move Method
	//From class: [AppointmentDao]
	//To class: [Appointment]
	//Why? -> update() and save(), methods was using object of appointment class rather than using it's own class's object
	//			So that, the refactoring method Move method can be apply here to increase the cohesion among the class methods.
	
	public int update(){  
		  
        int status=0;  	
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=con.prepareStatement("update appointment set work_type='"+this.getWorkType()+"' , request_date = '"+this.getRequestDate()+"',running_km = '"+this.getRunningKM()+"',request_time = '"+this.getRequestTime()+"' where vehicle_number = '"+this.getVehicleNumber()+"' ");  
            
            status=ps.executeUpdate();   
            System.out.println(status);
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }
	
	public int save(){  
		  
        int status=0;  	
        try{  
            Connection con=ConnectionDb.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "insert into appointment(vehicle_number) values (?)");  
            
            ps.setString(1, this.getVehicleNumber());
            
            status=ps.executeUpdate();   
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
	}
	
	public String getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}
	public String getRequestTime() {
		return requestTime;
	}
	public void setRequestTime(String requestTime) {
		this.requestTime = requestTime;
	}
	public String getAppointmentDate() {
		return AppointmentDate;
	}
	public void setAppointmentDate(String appointmentDate) {
		AppointmentDate = appointmentDate;
	}
	public String getAppointmentTime() {
		return AppointmentTime;
	}
	public void setAppointmentTime(String appointmentTime) {
		AppointmentTime = appointmentTime;
	}
	
	public String getVehicleNumber() {
		return vehicleNumber;
	}
	public void setVehicleNumber(String vehicleNumber) {
		this.vehicleNumber = vehicleNumber;
	}
	
	public String getWorkType() {
		return workType;
	}
	public void setWorkType(String workType) {
		this.workType = workType;
	}
	public int getRunningKM() {
		return runningKM;
	}
	public void setRunningKM(int runningKM) {
		this.runningKM = runningKM;
	}
	
}
