package spring.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import spring.mvc.dao.AdminDAO;
import spring.mvc.domain.AdminVO;
import spring.mvc.domain.CustomerVO;
import spring.mvc.domain.InventoryVO;
import spring.mvc.domain.OrderListVO;
import spring.mvc.domain.ProductVO;
import spring.mvc.domain.QnaVO;
import spring.mvc.domain.Qna_ReplyVO;
import spring.mvc.domain.SalesVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;
	
	public AdminVO adminLogin(AdminVO vo) {
		return adminDAO.adminLogin(vo);
	}
	
	public void insertProduct(ProductVO vo) {
		adminDAO.insertProduct(vo);
	}

	public List<ProductVO> adminSearchProduct(String search) {
		return adminDAO.adminSearchProduct(search);
	}
	
	public ProductVO adminEditTarget (ProductVO vo) {
		return adminDAO.adminEditTarget(vo);
	}
	
	public void adminEditProduct (ProductVO vo) {
		adminDAO.adminEditProduct(vo);
	}
	
	public void adminRemoveProduct(String prod_no) {
		adminDAO.adminRemoveProduct(prod_no);
	}
	
	public List<CustomerVO> viewAllCustomer(CustomerVO vo){
		return adminDAO.viewAllCustomer(vo);
	}
	
	public CustomerVO adminCustomerEditTarget (CustomerVO vo) {
		return adminDAO.adminCustomerEditTarget(vo);
	}
	
	public void adminEditCustomer (CustomerVO vo) {
		adminDAO.adminEditCustomer(vo);
	}
	
	public void adminRemoveCustomer(String customer_id) {
		adminDAO.adminRemoveCustomer(customer_id);
	}
	
	public List<OrderListVO> viewAllOrderlist(OrderListVO vo){
		return adminDAO.viewAllOrderlist(vo);
	}
	
	public OrderListVO adminOrderEditTarget (OrderListVO vo) {
		return adminDAO.adminOrderEditTarget(vo);
	}
	
	public void adminEditOrder (OrderListVO vo) {
		adminDAO.adminEditOrder(vo);
	}
	
	public void adminEditDeliveryStatus (OrderListVO vo) {
		adminDAO.adminEditDeliveryStatus(vo);
	}
	
	public List<QnaVO> viewAllInquiry(QnaVO vo) {
		return adminDAO.viewAllInquiry(vo);
	}
	
	public void adminReplyInquiry (Qna_ReplyVO vo) {
		adminDAO.adminReplyInquiry(vo);
	}
	
	public List<InventoryVO> viewInventory(InventoryVO vo) {
		return adminDAO.viewInventory(vo);
	}
	
	@Transactional(rollbackFor=Exception.class)
	public void insertInventory(InventoryVO vo) throws Exception {
		adminDAO.insertInventory(vo);
		
		ProductVO pvo = new ProductVO();
		pvo.setProd_no(vo.getProd_no());
		pvo.setStock(vo.getExist_qty() + vo.getStock_in_qty());
		pvo.setCost_price(vo.getExpected_price());
		adminDAO.adminEditProduct(pvo);
	}
	
	public List<SalesVO> viewSalesData(SalesVO vo) {
		return adminDAO.viewSalesData(vo);
	}
	
}
