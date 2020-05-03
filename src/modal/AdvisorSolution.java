package modal;

public class AdvisorSolution implements java.io.Serializable {

	private int solutionId;
	private int jobcardNumber;
	private String description;
	private int price;
	
	public int getSolutionId() {
		return solutionId;
	}
	public void setSolutionId(int solutionId) {
		this.solutionId = solutionId;
	}
	public int getJobcardNumber() {
		return jobcardNumber;
	}
	public void setJobcardNumber(int jobcardNumber) {
		this.jobcardNumber = jobcardNumber;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

}