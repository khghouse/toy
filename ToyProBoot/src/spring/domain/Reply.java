package spring.domain;

public class Reply {

	private int replyCode;
	private BBS code;
	private String replyContent;
	private String regDate;
	private String replyWriter;
	
	public Reply(){};
	
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
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	
	@Override
	public String toString() {
		return "Reply [replyCode=" + replyCode + ", code=" + code
				+ ", replyContent=" + replyContent + ", regDate=" + regDate
				+ ", replyWriter=" + replyWriter + "]";
	}
	
}
