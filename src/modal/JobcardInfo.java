package modal;
import java.util.Date;

public class JobcardInfo implements java.io.Serializable {

	private int jobcardNumber;
	private String vehicleNumber;
	private String officeUsername;
	private String workType;
	private String arrivalDate;
	private String arrivalTime;
	private String deliveryDate;
	private String deliveryTime;
	private int availableFuel;
	private int runningKm;
	private String status;
	
	public int getJobcardNumber() {
		return jobcardNumber;
	}
	public void setJobcardNumber(int jobcardNumber) {
		this.jobcardNumber = jobcardNumber;
	}
	public String getVehicleNumber() {
		return vehicleNumber;
	}
	public void setVehicleNumber(String vehicleNumber) {
		this.vehicleNumber = vehicleNumber;
	}
	public String getOfficeUsername() {
		return officeUsername;
	}
	public void setOfficeUsername(String officeUsername) {
		this.officeUsername = officeUsername;
	}
	public String getWorkType() {
		return workType;
	}
	public void setWorkType(String workType) {
		this.workType = workType;
	}
	public String getArrivalDate() {
		return arrivalDate;
	}
	public void setArrivalDate(String arrivalDate) {
		this.arrivalDate = arrivalDate;
	}
	public String getArrivalTime() {
		return arrivalTime;
	}
	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
	public String getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public String getDeliveryTime() {
		return deliveryTime;
	}
	public void setDeliveryTime(String deliveryTime) {
		this.deliveryTime = deliveryTime;
	}
	public int getAvailableFuel() {
		return availableFuel;
	}
	public void setAvailableFuel(int availableFuel) {
		this.availableFuel = availableFuel;
	}
	public int getRunningKm() {
		return runningKm;
	}
	public void setRunningKm(int runningKm) {
		this.runningKm = runningKm;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}
