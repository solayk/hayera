package spring.mvc.domain;

public class QnaVO {
	
	private String inquiry_id;
	private String prod_no;
	private String customer_id;
	private String title;
	private String contents;
	private String qnaday;
	private String prod_name;	// 관리자 문의 관리 목적
	private String img_url;	// 관리자 문의 관리 목적
	
	public String getInquiry_id() {
		return inquiry_id;
	}
	public void setInquiry_id(String inquiry_id) {
		this.inquiry_id = inquiry_id;
	}
	public String getProd_no() {
		return prod_no;
	}
	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
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
	public String getQnaday() {
		return qnaday;
	}
	public void setQnaday(String qnaday) {
		this.qnaday = qnaday;
	}
	// 관리자 문의 관리 목적
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	
	
}
