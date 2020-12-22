package spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dao.OrderDAO;
import spring.mvc.domain.OrderListVO;
import spring.mvc.domain.Order_ProductVO;
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;
	
	public void insertOrder(OrderListVO vo) {
		System.out.println("OrderserviceImpl / insertOrder 호출");
		orderDAO.insertOrder(vo);
	}

	public void insertOrder_Product(Order_ProductVO vo) {
		System.out.println("OrderserviceImpl / insertOrder_Product 호출");
		orderDAO.insertOrder_Product(vo);
	}

}
