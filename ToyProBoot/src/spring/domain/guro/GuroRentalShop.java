package spring.domain.guro;

import spring.domain.Gu;

public class GuroRentalShop
{
	private Gu guCode;
	private String rentalName; // 대여점명
	private String toyCnt; // 장난감개수 toy_cnt
	private String addr; // 주소 addr
	private String tel; // 전화번호 tel
	private String useHours; // 이용시간 user_hours
	private String closeDay; // 휴관일 close_day
	private String rentalTerm; // 대여기간 bookrental_term
	private String rentalCnt; // 대여수량 bookrental_cnt
	private String latitude; // 위도
	private String longitude; // 경도
	private String website;
	private String guName; // dao impl에서 guCode로 변환되어 insert
	
	public GuroRentalShop()
	{
		
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

	public String getToyCnt() {
		return toyCnt;
	}

	public void setToyCnt(String toyCnt) {
		this.toyCnt = toyCnt;
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

	public String getCloseDay() {
		return closeDay;
	}

	public void setCloseDay(String closeDay) {
		this.closeDay = closeDay;
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

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getGuName() {
		return guName;
	}

	public void setGuName(String guName) {
		this.guName = guName;
	}

	@Override
	public String toString() {
		return "GuroRentalShop [guCode=" + guCode + ", rentalName="
				+ rentalName + ", toyCnt=" + toyCnt + ", addr=" + addr
				+ ", tel=" + tel + ", useHours=" + useHours + ", closeDay="
				+ closeDay + ", rentalTerm=" + rentalTerm + ", rentalCnt="
				+ rentalCnt + ", latitude=" + latitude + ", longitude="
				+ longitude + ", website=" + website + ", guName=" + guName
				+ "]";
	}
}
