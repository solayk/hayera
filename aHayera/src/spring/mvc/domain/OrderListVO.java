package spring.mvc.domain;

public class OrderListVO {
	private String order_no; // 주문번호
	private String customer_id; // 고객id
	private String receive; // 받는 사람
	private String order_address; // 주소
	private String order_date; // 구매일
	private int order_price; // 주문금액
	private int discount_price; // 할인금액
	private int delivery_price; // 배송비
	private int payment_price; // 결제금액
	private String order_status; // 결제상태
	private String pay_date; // 주문확정일
	private String delivery_date; // 발송일
	private String delivery_status; // 배송상태
	private int point_use; // 적립금 사용액

	// order_product 테이블과 INNER JOIN 떔에 추가 
	private String prod_no;
	private int each_qty;
	
	// product_name이랑 img_url 필요해서 추가
	private String prod_name;
	private String img_url;
	
	// review
	private String review;
	
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getReceive() {
		return receive;
	}
	public void setReceive(String receive) {
		this.receive = receive;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
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
	public int getPayment_price() {
		return payment_price;
	}
	public void setPayment_price(int payment_price) {
		this.payment_price = payment_price;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getDelivery_date() {
		return delivery_date;
	}
	public void setDelivery_date(String delivery_date) {
		this.delivery_date = delivery_date;
	}
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	public int getPoint_use() {
		return point_use;
	}
	public void setPoint_use(int point_use) {
		this.point_use = point_use;
	}
	public String getProd_no() {
		return prod_no;
	}
	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}
	public int getEach_qty() {
		return each_qty;
	}
	public void setEach_qty(int each_qty) {
		this.each_qty = each_qty;
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
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	
}
