package modal;

public class SuggestionInfo {
	private int suggestionId ;
	private String customerComplain;
	private String description;
	public int getSuggestionId() {
		return suggestionId;
	}
	public void setSuggestionId(int suggestionId) {
		this.suggestionId = suggestionId;
	}
	public String getCustomerComplain() {
		return customerComplain;
	}
	public void setCustomerComplain(String customerComplain) {
		this.customerComplain = customerComplain;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
