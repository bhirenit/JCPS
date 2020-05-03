package modal;

public class HistoryPayment {
	private String historyId;
	private int finalAmount;
	private String paymenttype;
	private String cardOrCheckNumber;
	private String bankName;
	private String paymentDate;
	public String getHistoryId() {
		return historyId;
	}
	public void setHistoryId(String historyId) {
		this.historyId = historyId;
	}
	public HistoryPayment(String historyId, int finalAmount, String paymenttype, String cardOrCheckNumber,String bankName, String paymentDate) {
		super();
		this.historyId = historyId;
		this.finalAmount = finalAmount;
		this.paymenttype = paymenttype;
		this.cardOrCheckNumber = cardOrCheckNumber;
		this.bankName = bankName;
		this.paymentDate = paymentDate;
	}
	public HistoryPayment() {
		// TODO Auto-generated constructor stub
	}
	public int getFinalAmount() {
		return finalAmount;
	}
	public void setFinalAmount(int finalAmount) {
		this.finalAmount = finalAmount;
	}
	public String getPaymenttype() {
		return paymenttype;
	}
	public void setPaymenttype(String paymenttype) {
		this.paymenttype = paymenttype;
	}
	public String getCardOrCheckNumber() {
		return cardOrCheckNumber;
	}
	public void setCardOrCheckNumber(String cardOrCheckNumber) {
		this.cardOrCheckNumber = cardOrCheckNumber;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
	
}
