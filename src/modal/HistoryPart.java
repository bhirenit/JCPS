package modal;

public class HistoryPart {
	
	public HistoryPart()
	{
		
	}
	private String historyId;
	private int partId;
	private String partName;
	private int partPrice;
	private int partQuantity;
	public String getHistoryId() {
		return historyId;
	}
	public HistoryPart(String historyId, int partId, String partName, int partPrice, int partQuantity,
			boolean partRepairFlag) {
		super();
		this.historyId = historyId;
		this.partId = partId;
		this.partName = partName;
		this.partPrice = partPrice;
		this.partQuantity = partQuantity;
		this.partRepairFlag = partRepairFlag;
	}
	public void setHistoryId(String historyId) {
		this.historyId = historyId;
	}
	public int getPartId() {
		return partId;
	}
	public void setPartId(int partId) {
		this.partId = partId;
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
	public boolean isPartRepairFlag() {
		return partRepairFlag;
	}
	public void setPartRepairFlag(boolean partRepairFlag) {
		this.partRepairFlag = partRepairFlag;
	}
	private boolean partRepairFlag;
	public static void save(HistoryPart hp) {
		// TODO Auto-generated method stub
		
	}
	
}
