package spring.mvc.dao;

import java.util.List;

import spring.mvc.domain.OrderListVO;
import spring.mvc.domain.Order_ProductVO;

public interface OrderDAO {

	public void insertOrder(OrderListVO vo);
	
	public void insertOrder_Product(Order_ProductVO vo);
	
	public List<OrderListVO> orderHistoryView(OrderListVO vo);
}
