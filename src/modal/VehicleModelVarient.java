package modal;

public class VehicleModelVarient implements java.io.Serializable {

	private int modelVarientId;
	private int vehicleModelId;
	private String modelVarientName;
	
	public int getModelVarientId() {
		return modelVarientId;
	}
	public void setModelVarientId(int modelVarientId) {
		this.modelVarientId = modelVarientId;
	}
	public int getVehicleModelId() {
		return vehicleModelId;
	}
	public void setVehicleModelId(int vehicleModelId) {
		this.vehicleModelId = vehicleModelId;
	}
	public String getModelVarientName() {
		return modelVarientName;
	}
	public void setModelVarientName(String modelVarientName) {
		this.modelVarientName = modelVarientName;
	}
	
	
	
}
