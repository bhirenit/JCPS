package modal;
import java.util.Date;

public class VehicleLubricantDetails implements java.io.Serializable {

	private int lubricantId;
	private int modelVarientid;
	private String lubricantName;
	private int lubricantPrice;
	private int lubricantQuantity;
	private int lubricantLabour;
	private int lubricantValidity;
	private int lubricantValidityKm;
	private boolean lubricantSuggestflag; 
	
	public int getLubricantId() {
		return lubricantId;
	}
	public void setLubricantId(int lubricantId) {
		this.lubricantId = lubricantId;
	}
	public int getModelVarientid() {
		return modelVarientid;
	}
	public void setModelVarientid(int modelVarientid) {
		this.modelVarientid = modelVarientid;
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
	public int getLubricantQuantity() {
		return lubricantQuantity;
	}
	public void setLubricantQuantity(int lubricantQuantity) {
		this.lubricantQuantity = lubricantQuantity;
	}
	public int getLubricantLabour() {
		return lubricantLabour;
	}
	public void setLubricantLabour(int lubricantLabour) {
		this.lubricantLabour = lubricantLabour;
	}
	public int getLubricantValidity() {
		return lubricantValidity;
	}
	public void setLubricantValidity(int lubricantValidity) {
		this.lubricantValidity = lubricantValidity;
	}
	public int getLubricantValidityKm() {
		return lubricantValidityKm;
	}
	public void setLubricantValidityKm(int lubricantValidityKm) {
		this.lubricantValidityKm = lubricantValidityKm;
	}
	public boolean isLubricantSuggestflag() {
		return lubricantSuggestflag;
	}
	public void setLubricantSuggestflag(boolean lubricantSuggestflag) {
		this.lubricantSuggestflag = lubricantSuggestflag;
	}

	

	

}
