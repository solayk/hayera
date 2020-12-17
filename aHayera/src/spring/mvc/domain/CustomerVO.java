package spring.mvc.domain;

public class CustomerVO {
	
	private String customer_id;
	private String password;
	
	public String getId() {
		return customer_id;
	}
	public void setId(String id) {
		this.customer_id = customer_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	

}
