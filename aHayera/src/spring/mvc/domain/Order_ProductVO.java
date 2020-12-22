package spring.mvc.domain;

public class Order_ProductVO {
	
	private String prod_no;
	private String order_no;
	private int each_qty;
	
	public String getProd_no() {
		return prod_no;
	}
	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public int getEach_qty() {
		return each_qty;
	}
	public void setEach_qty(int each_qty) {
		this.each_qty = each_qty;
	}
}
