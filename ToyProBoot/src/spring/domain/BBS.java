package spring.domain;

import java.util.Date;

public class BBS {
	
	private int code;
	private String subject;
	private String regDate;
	private int count;
	private String writer;
	private String content;
	private String attachment;
	private int groupId;
	private int groupStep;
	private int groupTab;
	private int root;
	private int depth;
	
	public BBS(){}
	
	public BBS(String subject, String writer, String content, String attachment) {
		super();
		this.subject = subject;
		this.writer = writer;
		this.content = content;
		this.attachment = attachment;
	}



	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAttachment() {
		return attachment;
	}

	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public int getGroupStep() {
		return groupStep;
	}

	public void setGroupStep(int groupStep) {
		this.groupStep = groupStep;
	}

	public int getGroupTab() {
		return groupTab;
	}

	public void setGroupTab(int groupTab) {
		this.groupTab = groupTab;
	}

	public int getRoot() {
		return root;
	}

	public void setRoot(int root) {
		this.root = root;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	@Override
	public String toString() {
		return "BBS [code=" + code + ", subject=" + subject + ", regDate="
				+ regDate + ", count=" + count + ", writer=" + writer
				+ ", content=" + content + ", attachment=" + attachment
				+ ", groupId=" + groupId + ", groupStep=" + groupStep
				+ ", groupTab=" + groupTab + ", root=" + root + ", depth="
				+ depth + "]";
	}
	
	

}
