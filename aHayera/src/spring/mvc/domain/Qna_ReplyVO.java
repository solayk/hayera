package spring.mvc.domain;

public class Qna_ReplyVO {
	
	private String inquiry_reply_id;
	private String manager_id;
	private String inquiry_id;
	private String title;
	private String contents;
	private String replyday;
	
	public String getInquiry_reply_id() {
		return inquiry_reply_id;
	}
	public void setInquiry_reply_id(String inquiry_reply_id) {
		this.inquiry_reply_id = inquiry_reply_id;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getInquiry_id() {
		return inquiry_id;
	}
	public void setInquiry_id(String inquiry_id) {
		this.inquiry_id = inquiry_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getReplyday() {
		return replyday;
	}
	public void setReplyday(String replyday) {
		this.replyday = replyday;
	}
	
}
