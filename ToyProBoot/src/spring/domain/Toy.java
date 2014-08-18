package spring.domain;

public class Toy
{
	private String toyCode;
	private RentalShop rentalCode;
	private Category categoryCode;
	private String toyName;
	private String business;
	private String region;
	private String madeDate;
	private String getDate;
	private String useAge;
	private String rentalState;
	private String toyImg;
	private String detail;
	
	public Toy()
	{
		
	}

	public String getToyCode() {
		return toyCode;
	}

	public RentalShop getRentalCode() {
		return rentalCode;
	}

	public Category getCategoryCode() {
		return categoryCode;
	}

	public String getToyName() {
		return toyName;
	}

	public String getBusiness() {
		return business;
	}

	public String getRegion() {
		return region;
	}

	public String getMadeDate() {
		return madeDate;
	}

	public String getGetDate() {
		return getDate;
	}

	public String getUseAge() {
		return useAge;
	}

	public String getRentalState() {
		return rentalState;
	}

	public String getToyImg() {
		return toyImg;
	}

	public String getDetail() {
		return detail;
	}

	public void setToyCode(String toyCode) {
		this.toyCode = toyCode;
	}

	public void setRentalCode(RentalShop rentalCode) {
		this.rentalCode = rentalCode;
	}

	public void setCategoryCode(Category categoryCode) {
		this.categoryCode = categoryCode;
	}

	public void setToyName(String toyName) {
		this.toyName = toyName;
	}

	public void setBusiness(String business) {
		this.business = business;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public void setMadeDate(String madeDate) {
		this.madeDate = madeDate;
	}

	public void setGetDate(String getDate) {
		this.getDate = getDate;
	}

	public void setUseAge(String useAge) {
		this.useAge = useAge;
	}

	public void setRentalState(String rentalState) {
		this.rentalState = rentalState;
	}

	public void setToyImg(String toyImg) {
		this.toyImg = toyImg;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	@Override
	public String toString() {
		return "Toy [toyCode=" + toyCode + ", rentalCode=" + rentalCode
				+ ", categoryCode=" + categoryCode + ", toyName=" + toyName
				+ ", business=" + business + ", region=" + region
				+ ", madeDate=" + madeDate + ", getDate=" + getDate
				+ ", useAge=" + useAge + ", rentalState=" + rentalState
				+ ", toyImg=" + toyImg + ", detail=" + detail + "]";
	}
}