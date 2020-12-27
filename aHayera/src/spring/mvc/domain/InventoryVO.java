package spring.mvc.domain;

public class InventoryVO {
	
	private String prod_no;  // 제품번호
	private int stock_in_qty;    // 입고 수량
	private int stock_in_price;    // 입고 가격
	
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
	
}
