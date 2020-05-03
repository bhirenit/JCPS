package modal;

public class VehicleModel implements java.io.Serializable {

	private int vehicleModelId;
	private int vehicleCompanyId;
	private String vehicleModelName;
	
	public int getVehicleModelId() {
		return vehicleModelId;
	}
	public void setVehicleModelId(int vehicleModelId) {
		this.vehicleModelId = vehicleModelId;
	}
	public int getVehicleCompanyId() {
		return vehicleCompanyId;
	}
	public void setVehicleCompanyId(int vehicleCompanyId) {
		this.vehicleCompanyId = vehicleCompanyId;
	}
	public String getVehicleModelName() {
		return vehicleModelName;
	}
	public void setVehicleModelName(String vehicleModelName) {
		this.vehicleModelName = vehicleModelName;
	}
}
