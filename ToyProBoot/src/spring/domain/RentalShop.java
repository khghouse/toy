package spring.domain;

public class RentalShop
{
	private int rentalCode;
	private Gu guCode;
	private String rentalName;
	private String addr;
	private String tel;
	private String useHours;
	private String rentalTerm;
	private String rentalCnt;
	private String toyCnt;
	private String closeDay;
	private String website;
	private String latitude; // 위도
	private String longitude; // 경도
	
	public RentalShop()
	{
		
	}

	public int getRentalCode() {
		return rentalCode;
	}

	public void setRentalCode(int rentalCode) {
		this.rentalCode = rentalCode;
	}

	public Gu getGuCode() {
		return guCode;
	}

	public void setGuCode(Gu guCode) {
		this.guCode = guCode;
	}

	public String getRentalName() {
		return rentalName;
	}

	public void setRentalName(String rentalName) {
		this.rentalName = rentalName;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getUseHours() {
		return useHours;
	}

	public void setUseHours(String useHours) {
		this.useHours = useHours;
	}

	public String getRentalTerm() {
		return rentalTerm;
	}

	public void setRentalTerm(String rentalTerm) {
		this.rentalTerm = rentalTerm;
	}

	public String getRentalCnt() {
		return rentalCnt;
	}

	public void setRentalCnt(String rentalCnt) {
		this.rentalCnt = rentalCnt;
	}

	public String getToyCnt() {
		return toyCnt;
	}

	public void setToyCnt(String toyCnt) {
		this.toyCnt = toyCnt;
	}

	public String getCloseDay() {
		return closeDay;
	}

	public void setCloseDay(String closeDay) {
		this.closeDay = closeDay;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	@Override
	public String toString() {
		return "RentalShop [rentalCode=" + rentalCode + ", guCode=" + guCode
				+ ", rentalName=" + rentalName + ", addr=" + addr + ", tel="
				+ tel + ", useHours=" + useHours + ", rentalTerm=" + rentalTerm
				+ ", rentalCnt=" + rentalCnt + ", toyCnt=" + toyCnt
				+ ", closeDay=" + closeDay + ", website=" + website
				+ ", latitude=" + latitude + ", longitude=" + longitude + "]";
	}
}