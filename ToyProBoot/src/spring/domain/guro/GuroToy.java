package spring.domain.guro;

public class GuroToy
{
	// 필드
	private String maintitle; // toy_name 장난감 이름
	private String toyIdid; // toy_code 장남감 번호
	private String subject; // category_code 분류번호
	private String fn; // business 업체명
	private String region; // region 제조국
	private String created; // made_date 제조년일
	private String issued; // get_date 입수년월일
	private String age; // use_age 이용연령
	private String codeDesc; // rental_state 대여상태
	private String brchName; // 비교 후 rental_code로 변경, 대여점 번호
	private String toyImg;
	
	// 생성자
	public GuroToy()
	{
		
	}

	public String getMaintitle() {
		return maintitle;
	}

	public String getToyIdid() {
		return toyIdid;
	}

	public String getSubject() {
		return subject;
	}

	public String getFn() {
		return fn;
	}

	public String getRegion() {
		return region;
	}

	public String getCreated() {
		return created;
	}

	public String getIssued() {
		return issued;
	}

	public String getAge() {
		return age;
	}

	public String getCodeDesc() {
		return codeDesc;
	}

	public String getBrchName() {
		return brchName;
	}

	public String getToyImg() {
		return toyImg;
	}

	public void setMaintitle(String maintitle) {
		this.maintitle = maintitle;
	}

	public void setToyIdid(String toyIdid) {
		this.toyIdid = toyIdid;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setFn(String fn) {
		this.fn = fn;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public void setIssued(String issued) {
		this.issued = issued;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public void setCodeDesc(String codeDesc) {
		this.codeDesc = codeDesc;
	}

	public void setBrchName(String brchName) {
		this.brchName = brchName;
	}

	public void setToyImg(String toyImg) {
		this.toyImg = toyImg;
	}

	@Override
	public String toString() {
		return "GuroToy [maintitle=" + maintitle + ", toyIdid=" + toyIdid
				+ ", subject=" + subject + ", fn=" + fn + ", region=" + region
				+ ", created=" + created + ", issued=" + issued + ", age="
				+ age + ", codeDesc=" + codeDesc + ", brchName=" + brchName
				+ ", toyImg=" + toyImg + "]";
	}
}
