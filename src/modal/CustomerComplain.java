package modal;

public class CustomerComplain implements java.io.Serializable {

	private int complainId;
	private int jobcardNumber;
	private String customerComplain;

	

	public int getComplainId() {
		return complainId;
	}

	public void setComplainId(int complainId) {
		this.complainId = complainId;
	}

	public int getJobcardNumber() {
		return this.jobcardNumber;
	}

	public void setJobcardNumber(int jobcardNumber) {
		this.jobcardNumber = jobcardNumber;
	}

	public String getCustomerComplain() {
		return this.customerComplain;
	}

	public void setCustomerComplain(String customerComplain) {
		this.customerComplain = customerComplain;
	}

}
