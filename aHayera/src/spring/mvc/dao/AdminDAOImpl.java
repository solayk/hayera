package spring.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.domain.AdminVO;
import spring.mvc.domain.CustomerVO;
import spring.mvc.domain.InventoryVO;
import spring.mvc.domain.OrderListVO;
import spring.mvc.domain.ProductVO;
import spring.mvc.domain.QnaVO;
import spring.mvc.domain.Qna_ReplyVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public AdminVO adminLogin(AdminVO vo) {
		return (AdminVO) mybatis.selectOne("AdminDAO.adminLogin", vo);
	}
	
	public void insertProduct(ProductVO vo) {
		mybatis.insert("AdminDAO.insertProduct", vo);
	}

	public List<ProductVO> adminSearchProduct(String search) {
		return mybatis.selectList("AdminDAO.adminSearchProduct", search);
	}

	public ProductVO adminEditTarget(ProductVO vo) {
		return mybatis.selectOne("AdminDAO.adminEditTarget", vo);
	}
	
	public void adminEditProduct (ProductVO vo) {
		mybatis.update("AdminDAO.adminEditProduct", vo);
	}
	
	public void adminRemoveProduct (String prod_no) {
		mybatis.delete("AdminDAO.adminRemoveProduct", prod_no);
	}
	
	public List<CustomerVO> viewAllCustomer(CustomerVO vo){
		return mybatis.selectList("AdminDAO.viewAllCustomer", vo);
	}
	
	public CustomerVO adminCustomerEditTarget(CustomerVO vo) {
		return mybatis.selectOne("AdminDAO.adminCustomerEditTarget", vo);
	}
	
	public void adminEditCustomer (CustomerVO vo) {
		mybatis.update("AdminDAO.adminEditCustomer", vo);
	}
	
	public void adminRemoveCustomer (String customer_id) {
		mybatis.delete("AdminDAO.adminRemoveCustomer", customer_id);
	}
	
	public List<OrderListVO> viewAllOrderlist(OrderListVO vo) {
		return mybatis.selectList("AdminDAO.viewAllOrderlist", vo);
	}
	
	public OrderListVO adminOrderEditTarget(OrderListVO vo) {
		return mybatis.selectOne("AdminDAO.adminOrderEditTarget", vo);
	}
	
	public void adminEditOrder (OrderListVO vo) {
		mybatis.update("AdminDAO.adminEditOrder", vo);
	}
	
	public void adminEditDeliveryStatus (OrderListVO vo) {
		mybatis.update("AdminDAO.adminEditDeliveryStatus", vo);
	}
	
	public List<QnaVO> viewAllInquiry(QnaVO vo) {
		return mybatis.selectList("AdminDAO.viewAllInquiry", vo);
	}
	
	public void adminReplyInquiry (Qna_ReplyVO vo) {
		mybatis.insert("AdminDAO.adminReplyInquiry", vo);
	}
	
	public List<InventoryVO> viewInventory(InventoryVO vo) {
		return mybatis.selectList("AdminDAO.viewInventory", vo);
	}
	
}
