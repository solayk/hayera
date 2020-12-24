package spring.mvc.domain;

public class CustomerVO {
	
	private String customer_id;
	private String password;
	private String password_new;
	private String tel;
	private String name;
	private String email;
	private String address;
	private String birthday;
	private String skintype;
	private int points;
	private String gender;
	
	public String getPassword_new() {
		return password_new;
	}
	public void setPassword_new(String password_new) {
		this.password_new = password_new;
	}
	
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getSkintype() {
		return skintype;
	}
	public void setSkintype(String skintype) {
		this.skintype = skintype;
	}
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}

}