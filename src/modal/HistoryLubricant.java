package modal;

public class HistoryLubricant {
	
	public HistoryLubricant()
	{
		
	}
	
	private String historyId;
	private int lubricantId;
	public String getHistoryId() {
		return historyId;
	}
	public void setHistoryId(String historyId) {
		this.historyId = historyId;
	}
	public HistoryLubricant(String historyId, int lubricantId, String lubricantName, int lubricantPrice) {
		super();
		this.historyId = historyId;
		this.lubricantId = lubricantId;
		this.lubricantName = lubricantName;
		this.lubricantPrice = lubricantPrice;
	}
	public int getLubricantId() {
		return lubricantId;
	}
	public void setLubricantId(int lubricantId) {
		this.lubricantId = lubricantId;
	}
	public String getLubricantName() {
		return lubricantName;
	}
	public void setLubricantName(String lubricantName) {
		this.lubricantName = lubricantName;
	}
	public int getLubricantPrice() {
		return lubricantPrice;
	}
	public void setLubricantPrice(int lubricantPrice) {
		this.lubricantPrice = lubricantPrice;
	}
	private String lubricantName;
	private int lubricantPrice;
	
}
