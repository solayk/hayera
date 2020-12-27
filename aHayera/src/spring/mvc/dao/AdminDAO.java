package spring.mvc.dao;

import java.util.List;

import spring.mvc.domain.AdminVO;
import spring.mvc.domain.CustomerVO;
import spring.mvc.domain.InventoryVO;
import spring.mvc.domain.OrderListVO;
import spring.mvc.domain.ProductVO;
import spring.mvc.domain.QnaVO;
import spring.mvc.domain.Qna_ReplyVO;

public interface AdminDAO {
	
	public AdminVO adminLogin(AdminVO vo);
	
	public void insertProduct(ProductVO vo);

	public List<ProductVO> adminSearchProduct(String search);
	
	public ProductVO adminEditTarget(ProductVO vo);
	
	public void adminEditProduct (ProductVO vo);
	
	public void adminRemoveProduct (String prod_no);
	
	public List<CustomerVO> viewAllCustomer(CustomerVO vo);
	
	public CustomerVO adminCustomerEditTarget(CustomerVO vo);
	
	public void adminEditCustomer (CustomerVO vo);
	
	public void adminRemoveCustomer (String customer_id);
	
	public List<OrderListVO> viewAllOrderlist(OrderListVO vo);
	
	public OrderListVO adminOrderEditTarget(OrderListVO vo);
	
	public void adminEditOrder (OrderListVO vo);
	
	public void adminEditDeliveryStatus (OrderListVO vo);
	
	public List<QnaVO> viewAllInquiry(QnaVO vo);
	
	public void adminReplyInquiry (Qna_ReplyVO vo);
	
	public List<InventoryVO> viewInventory(InventoryVO vo);
}
