package spring.domain;

public class Reply {

	private int replyCode;
	private BBS code;
	private User UserId;
	private String replyContent;
	private String regDate;
	
	public Reply(){}

	public int getReplyCode() {
		return replyCode;
	}

	public void setReplyCode(int replyCode) {
		this.replyCode = replyCode;
	}

	public BBS getCode() {
		return code;
	}

	public void setCode(BBS code) {
		this.code = code;
	}

	public User getUserId() {
		return UserId;
	}

	public void setUserId(User userId) {
		UserId = userId;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Reply [replyCode=" + replyCode + ", code=" + code + ", UserId="
				+ UserId + ", replyContent=" + replyContent + ", regDate="
				+ regDate + "]";
	};
	
}
