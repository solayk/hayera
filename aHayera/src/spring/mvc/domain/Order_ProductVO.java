package spring.mvc.domain;

public class Order_ProductVO {
	
	private String prod_no;  // 제품번호
	private String order_no; // 주문번호
	private int each_qty;    // 수량
	private int sales_price; // 적용판매가
	private int sales_cost;  // 적용단가
	private int sales_revenue; // 수익
	
	private String prod_name; // 장바구니 활용 목적
	private String img_url; // 장바구니 활용 목적
	private String remove; // 장바구니 활용 목적
	
	private int price; // ProductVO의 price. DB orderlist 테이블의 order_price, discount_price 입력 목적
	
	private int stock; // ProductVO의 stock. 주문 시 재고 차감에 활용.
	
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
	public int getSales_price() {
		return sales_price;
	}
	public void setSales_price(int sales_price) {
		this.sales_price = sales_price;
	}
	public int getSales_cost() {
		return sales_cost;
	}
	public void setSales_cost(int sales_cost) {
		this.sales_cost = sales_cost;
	}
	public int getSales_revenue() {
		return sales_revenue;
	}
	public void setSales_revenue(int sales_revenue) {
		this.sales_revenue = sales_revenue;
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
	public String getRemove() {
		return remove;
	}
	public void setRemove(String remove) {
		this.remove = remove;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
}
