package spring.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dao.OrderDAO;
import spring.mvc.domain.OrderListVO;
import spring.mvc.domain.Order_ProductVO;
import spring.mvc.domain.ProductVO;
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

	public List<OrderListVO> orderHistoryViewDefault(OrderListVO vo) {
		System.out.println("OrderserviceImpl / orderHistoryViewDefault 호출");
		return orderDAO.orderHistoryViewDefault(vo);
	}

	public List<OrderListVO> orderHistoryViewToday(OrderListVO vo) {
		System.out.println("OrderserviceImpl / orderHistoryViewToday 호출");
		return orderDAO.orderHistoryViewToday(vo);
	}

	public List<OrderListVO> orderHistoryView1week(OrderListVO vo) {
		System.out.println("OrderserviceImpl / orderHistoryView1week 호출");
		return orderDAO.orderHistoryView1week(vo);
	}

	public List<OrderListVO> orderHistoryView1month(OrderListVO vo) {
		System.out.println("OrderserviceImpl / orderHistoryView1month 호출");
		return orderDAO.orderHistoryView1month(vo);
	}

	public List<OrderListVO> orderHistoryView6months(OrderListVO vo) {
		System.out.println("OrderserviceImpl / orderHistoryView6months 호출");
		return orderDAO.orderHistoryView6months(vo);
	}

	public List<ProductVO> addCart(ProductVO pvo) {
		System.out.println("OrderserviceImpl / addCart 호출");
		return orderDAO.addCart(pvo);
	}

}
