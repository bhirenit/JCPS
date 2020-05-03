package modal;

public class History {
	public History()
	{
		
	}
	public History(String historyId, String vehicleNumber, String officerUsername, int runningKM, String workType,
			String arrivalDate, String arrivalTime, String deliveryDate, String deliveryTime) {
		super();
		this.historyId = historyId;
		this.vehicleNumber = vehicleNumber;
		this.officerUsername = officerUsername;
		this.runningKM = runningKM;
		this.workType = workType;
		this.arrivalDate = arrivalDate;
		this.arrivalTime = arrivalTime;
		this.deliveryDate = deliveryDate;
		this.deliveryTime = deliveryTime;
	}
	private String historyId;
	private String vehicleNumber;
	private String officerUsername;
	private int runningKM;;
	private String workType;
	private String arrivalDate;
	private String arrivalTime;
	private String deliveryDate;
	private String deliveryTime;
	
	public String getHistoryId() {
		return historyId;
	}
	public void setHistoryId(String historyId) {
		this.historyId = historyId;
	}
	public String getVehicleNumber() {
		return vehicleNumber;
	}
	public void setVehicleNumber(String vehicleNumber) {
		this.vehicleNumber = vehicleNumber;
	}
	public String getOfficerUsername() {
		return officerUsername;
	}
	public void setOfficerUsername(String officerUsername) {
		this.officerUsername = officerUsername;
	}
	public int getRunningKM() {
		return runningKM;
	}
	public void setRunningKM(int runningKM) {
		this.runningKM = runningKM;
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
	public void setArrivaltime(String arrivaltime) {
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
	
	
}
