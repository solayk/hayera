package spring.mvc.domain;

public class CustomerVO {
	
	private String customer_id;
	private String password;
	private String tel;
	private String name;
	private String email;
	private String address;
	private String birthday;
	private String skintype;
	private int points;
	
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
	


	

}

//CUSTOMER_ID VARCHAR2(20) NOT NULL, /* 고객ID */
//TEL VARCHAR2(13) NOT NULL, /* 전화번호 */
//PASSWORD VARCHAR2(30) NOT NULL, /* 비밀번호 */
//NAME VARCHAR2(10) NOT NULL, /* 이름 */
//EMAIL VARCHAR2(30) NOT NULL, /* 이메일주소 */
//ADDRESS VARCHAR2(100) NOT NULL, /* 주소 */
//BIRTHDAY VARCHAR2(10) NOT NULL, /* 생일 */
//SKINTYPE VARCHAR2(10) NOT NULL, /* 피부타입 */
//POINTS NUMBER /* 적립금 */