package spring.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.domain.OrderListVO;
import spring.mvc.domain.Order_ProductVO;
import spring.mvc.domain.ProductVO;
@Repository
public class OrderDAOImpl implements OrderDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertOrder(OrderListVO vo) {
		mybatis.insert("OrderDAO.insertOrder", vo);
	}

	public void insertOrder_Product(Order_ProductVO vo) {
		mybatis.insert("OrderDAO.insertOrder_Product", vo);
	}

	public List<OrderListVO> orderHistoryViewDefault(OrderListVO vo) {
		System.out.println("mybatis orderHistoryViewDefault 호출");
		return mybatis.selectList("OrderDAO.orderHistoryViewDefault",vo);
	}

	public List<OrderListVO> orderHistoryViewToday(OrderListVO vo) {
		System.out.println("mybatis orderHistoryViewToday 호출");
		return mybatis.selectList("OrderDAO.orderHistoryViewToday",vo);
	}

	public List<OrderListVO> orderHistoryView1week(OrderListVO vo) {
		System.out.println("mybatis orderHistoryView1week 호출");
		return mybatis.selectList("OrderDAO.orderHistoryView1week",vo);
	}

	public List<OrderListVO> orderHistoryView1month(OrderListVO vo) {
		System.out.println("mybatis orderHistoryView1month 호출");
		return mybatis.selectList("OrderDAO.orderHistoryView1month",vo);
	}

	public List<OrderListVO> orderHistoryView6months(OrderListVO vo) {
		System.out.println("mybatis orderHistoryView6months 호출");
		return mybatis.selectList("OrderDAO.orderHistoryView6months",vo);
	}

	public List<ProductVO> addCart(ProductVO pvo) {
		System.out.println("mybatis addCart 호출");
		return mybatis.selectList("OrderDAO.addCart",pvo);
	}

}
