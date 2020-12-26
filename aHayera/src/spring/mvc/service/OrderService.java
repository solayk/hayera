package spring.mvc.service;

import java.util.List;

import spring.mvc.domain.OrderListVO;
import spring.mvc.domain.Order_ProductVO;

public interface OrderService {

	public void insertOrder(OrderListVO vo);
	
	public void insertOrder_Product(Order_ProductVO vo);
	
	public List<OrderListVO> orderHistoryViewDefault(OrderListVO vo);
	
	public List<OrderListVO> orderHistoryViewToday(OrderListVO vo);

	public List<OrderListVO> orderHistoryView1week(OrderListVO vo);
	
	public List<OrderListVO> orderHistoryView1month(OrderListVO vo);
	
	public List<OrderListVO> orderHistoryView6months(OrderListVO vo);
}
