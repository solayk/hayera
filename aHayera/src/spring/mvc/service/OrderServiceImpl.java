package spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dao.OrderDAO;
import spring.mvc.domain.OrderListVO;
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;
	
	public void insertOrder(OrderListVO vo) {
		System.out.println("serviceImpl / insertOrder 호출");
		orderDAO.insertOrder(vo);
	}

}
