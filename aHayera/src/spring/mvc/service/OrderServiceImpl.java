package spring.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import spring.mvc.dao.OrderDAO;
import spring.mvc.domain.OrderListVO;
import spring.mvc.domain.Order_ProductVO;
import spring.mvc.domain.Order_ProductVOList;
import spring.mvc.domain.ProductVO;
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;
	
	public void insertOrder(OrderListVO vo) {
		orderDAO.insertOrder(vo);
	}

	public void insertOrder_Product(Order_ProductVO vo) {
		orderDAO.insertOrder_Product(vo);
	}
	
	@Transactional
	public void insertOrderFromCart(OrderListVO oVo, List<Order_ProductVO> list) {
		
		System.out.println("===== insertOrderFromCart 시작 =====");
		orderDAO.insertOrder(oVo);
		
		System.out.println("===== insertOrder 완료 =====");
		System.out.println("===== oVoList 사이즈 체크 ===== : " + list.size());
		
		for(Order_ProductVO data : list) {
			orderDAO.insertOrder_Product(data);
		}
		
	}

	public List<OrderListVO> orderHistoryViewDefault(OrderListVO vo) {
		return orderDAO.orderHistoryViewDefault(vo);
	}

	public List<OrderListVO> orderHistoryViewToday(OrderListVO vo) {
		return orderDAO.orderHistoryViewToday(vo);
	}

	public List<OrderListVO> orderHistoryView1week(OrderListVO vo) {
		return orderDAO.orderHistoryView1week(vo);
	}

	public List<OrderListVO> orderHistoryView1month(OrderListVO vo) {
		return orderDAO.orderHistoryView1month(vo);
	}

	public List<OrderListVO> orderHistoryView6months(OrderListVO vo) {
		return orderDAO.orderHistoryView6months(vo);
	}

	public List<ProductVO> addCart(ProductVO pvo) {
		return orderDAO.addCart(pvo);
	}

}
