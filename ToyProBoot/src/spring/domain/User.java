package spring.domain;

import java.sql.Date;

public class User {

	private String userId;
	private String userPw;
	private String userName;
	/*private String birthday;*/
	private String tel;
	private String email;
	private Integer emailReceive;
	private String addr;
	private Date regDate;
	
	public User() {
		super();
	}

	public User(String userId, String userPw, String userName, String tel) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.tel = tel;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getEmailReceive() {
		return emailReceive;
	}

	public void setEmailReceive(Integer emailReceive) {
		this.emailReceive = emailReceive;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPw=" + userPw + ", userName="
				+ userName + ", tel=" + tel + ", email=" + email
				+ ", emailReceive=" + emailReceive + ", addr=" + addr
				+ ", regDate=" + regDate + "]";
	}
}
