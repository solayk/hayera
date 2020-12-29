package spring.mvc.domain;

public class SalesVO {
	private String month; 		// 월
	private int order_price; 	// 주문금액 총액
	private int discount_price; // 할인금액 총액 (제품 할인 ONLY)
	private int delivery_price; // 배송비 총액
	private int point_use; 		// 포인트 총액
	private int payment_price; 	// 결제금액 총액
	private int sales_price; 	// 적용판매가 총액
	private int sales_cost; 	// 적용단가 총액
	private int sales_revenue; 	// 수익 총액
	
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public int getDiscount_price() {
		return discount_price;
	}
	public void setDiscount_price(int discount_price) {
		this.discount_price = discount_price;
	}
	public int getDelivery_price() {
		return delivery_price;
	}
	public void setDelivery_price(int delivery_price) {
		this.delivery_price = delivery_price;
	}
	public int getPoint_use() {
		return point_use;
	}
	public void setPoint_use(int point_use) {
		this.point_use = point_use;
	}
	public int getPayment_price() {
		return payment_price;
	}
	public void setPayment_price(int payment_price) {
		this.payment_price = payment_price;
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
	
}
