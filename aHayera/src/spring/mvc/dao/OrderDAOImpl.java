package spring.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.domain.OrderListVO;
import spring.mvc.domain.Order_ProductVO;
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

}
