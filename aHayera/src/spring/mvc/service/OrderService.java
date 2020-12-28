package spring.mvc.service;

import java.util.List;

import spring.mvc.domain.OrderListVO;
import spring.mvc.domain.Order_ProductVO;
import spring.mvc.domain.Order_ProductVOList;
import spring.mvc.domain.ProductVO;

public interface OrderService {

	public void insertOrder(OrderListVO vo);
	
	public void insertOrder_Product(Order_ProductVO vo);

	public void insertOrderFromCart(OrderListVO oVo, List<Order_ProductVO> list);
	
	public List<OrderListVO> orderHistoryViewDefault(OrderListVO vo);
	
	public List<OrderListVO> orderHistoryViewToday(OrderListVO vo);

	public List<OrderListVO> orderHistoryView1week(OrderListVO vo);
	
	public List<OrderListVO> orderHistoryView1month(OrderListVO vo);
	
	public List<OrderListVO> orderHistoryView6months(OrderListVO vo);
	
	public List<ProductVO> addCart(ProductVO pvo);
}
