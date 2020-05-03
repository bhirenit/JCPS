package modal;

public class HistoryService {
	
	public HistoryService()
	{
		
	}
	private String historyId;
	private int serviceId;
	private String serviceName;
	private String serviceDetails;
	private int servicePrice;
	public HistoryService(String historyId, int serviceId, String serviceName, String serviceDetails,
			int servicePrice) {
		super();
		this.historyId = historyId;
		this.serviceId = serviceId;
		this.serviceName = serviceName;
		this.serviceDetails = serviceDetails;
		this.servicePrice = servicePrice;
	}
	public String getHistoryId() {
		return historyId;
	}
	public void setHistoryId(String historyId) {
		this.historyId = historyId;
	}
	public int getServiceId() {
		return serviceId;
	}
	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public String getServiceDetails() {
		return serviceDetails;
	}
	public void setServiceDetails(String serviceDetails) {
		this.serviceDetails = serviceDetails;
	}
	public int getServicePrice() {
		return servicePrice;
	}
	public void setServicePrice(int servicePrice) {
		this.servicePrice = servicePrice;
	}
}
