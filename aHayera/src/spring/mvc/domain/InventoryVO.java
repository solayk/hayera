package spring.mvc.domain;

public class InventoryVO {
	
	private String prod_no;  // 제품번호
	private int stock_in_qty;    // 입고 수량
	private int stock_in_price;    // 입고 가격
	private int exist_qty;    // 기존 수량
	private int exist_price;    // 기존 평균가
	private String update_date;  // 입고날짜
	private String inventory_no;  // 입고번호
	
	private String prod_name;	// 관리자 재고 관리 목적
	private String img_url;	// 관리자 재고 관리 목적
	private int expected_price;    // 관리자 재고 관리 목적
	
	public String getProd_no() {
		return prod_no;
	}
	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}
	public int getStock_in_qty() {
		return stock_in_qty;
	}
	public void setStock_in_qty(int stock_in_qty) {
		this.stock_in_qty = stock_in_qty;
	}
	public int getStock_in_price() {
		return stock_in_price;
	}
	public void setStock_in_price(int stock_in_price) {
		this.stock_in_price = stock_in_price;
	}
	public int getExist_qty() {
		return exist_qty;
	}
	public void setExist_qty(int exist_qty) {
		this.exist_qty = exist_qty;
	}
	public int getExist_price() {
		return exist_price;
	}
	public void setExist_price(int exist_price) {
		this.exist_price = exist_price;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public String getInventory_no() {
		return inventory_no;
	}
	public void setInventory_no(String inventory_no) {
		this.inventory_no = inventory_no;
	}
	
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
	public int getExpected_price() {
		return expected_price;
	}
	public void setExpected_price(int expected_price) {
		this.expected_price = expected_price;
	}
	
}
