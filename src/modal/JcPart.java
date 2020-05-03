package modal;

public class JcPart implements java.io.Serializable {

	private int partId;
	private int jobcardNumber;
	private String partName;
	private int partPrice;
	private int partQuantity;
	private String partStatus;
	private boolean partRepairFlag;
	
	public int getPartId() {
		return partId;
	}
	public void setPartId(int partId) {
		this.partId = partId;
	}
	public int getJobcardNumber() {
		return jobcardNumber;
	}
	public void setJobcardNumber(int jobcardNumber) {
		this.jobcardNumber = jobcardNumber;
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
	public String getPartStatus() {
		return partStatus;
	}
	public void setPartStatus(String partStatus) {
		this.partStatus = partStatus;
	}
	public boolean isPartRepairFlag() {
		return partRepairFlag;
	}
	public void setPartRepairFlag(boolean partRepairFlag) {
		this.partRepairFlag = partRepairFlag;
	}

	
	
}
