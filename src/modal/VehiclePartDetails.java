package modal;
import java.util.Date;

public class VehiclePartDetails implements java.io.Serializable {

	private int partId;
	private int modelVarientId;
	private String partName;
	private int partPrice;
	private int partQuantity;
	private int partValidity;
	private int partLabour;
	
	public int getPartId() {
		return partId;
	}
	public void setPartId(int partId) {
		this.partId = partId;
	}
	public int getModelVarientId() {
		return modelVarientId;
	}
	public void setModelVarientId(int modelVarientId) {
		this.modelVarientId = modelVarientId;
	}
	public String getPartName() {
		return partName;
	}
	public void setPartName(String partName) {
		this.partName = partName;
	}
	public int getPartPrice() {
		return partPrice;
	}
	public void setPartPrice(int partPrice) {
		this.partPrice = partPrice;
	}
	public int getPartQuantity() {
		return partQuantity;
	}
	public void setPartQuantity(int partQuantity) {
		this.partQuantity = partQuantity;
	}

	public int getPartValidity() {
		return partValidity;
	}
	public void setPartValidity(int partValidity) {
		this.partValidity = partValidity;
	}
	public int getPartLabour() {
		return partLabour;
	}
	public void setPartLabour(int partLabour) {
		this.partLabour = partLabour;
	}

	
}
