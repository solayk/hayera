package spring.mvc.domain;

public class InventoryVO {
	
	private String prod_no;  // 제품번호
	private int stock_in_qty;    // 입고 수량
	private int stock_in_price;    // 입고 가격
	private int exist_qty;    // 기존 수량
	private int exist_price;    // 기존 평균가
	
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
	
}
