package spring.mvc.dao;

import java.util.List;

import spring.mvc.domain.CustomerVO;
import spring.mvc.domain.OrderListVO;
import spring.mvc.domain.Order_ProductVO;
import spring.mvc.domain.PaymentVO;
import spring.mvc.domain.ProductVO;
import spring.mvc.domain.ReviewVO;

public interface OrderDAO {

	public void insertOrder(OrderListVO vo);
	
	public void insertOrder_Product(Order_ProductVO vo);
	
	public List<OrderListVO> orderHistoryViewDefault(OrderListVO vo);
	
	public List<OrderListVO> orderHistoryViewToday(OrderListVO vo);
	
	public List<OrderListVO> orderHistoryView1week(OrderListVO vo);
	
	public List<OrderListVO> orderHistoryView1month(OrderListVO vo);
	
	public List<OrderListVO> orderHistoryView6months(OrderListVO vo);
	
	public List<ProductVO> addCart(ProductVO pvo);
	
	public void insertPayment(PaymentVO vo);
	
	public void updatePoints(CustomerVO vo);
	
	public void updateStock(ProductVO vo);
	
	public void updateTotalsales(ProductVO vo);
	
	public List<ReviewVO> selectReviewForwriteReview(ReviewVO vo);
}
