package spring.mvc.service;

import java.util.List;

import spring.mvc.domain.AdminVO;
import spring.mvc.domain.CustomerVO;
import spring.mvc.domain.ProductVO;

public interface AdminService {
	
	public AdminVO adminLogin(AdminVO vo);
	
	public void insertProduct(ProductVO vo);

	public List<ProductVO> adminSearchProduct(String search);
	
	public ProductVO adminEditTarget (ProductVO vo);
	
	public void adminEditProduct (ProductVO vo);
	
	public void adminRemoveProduct(String prod_no);
	
	public List<CustomerVO> viewAllCustomer(CustomerVO vo);
	
	public CustomerVO adminCustomerEditTarget (CustomerVO vo);
	
	public void adminEditCustomer (CustomerVO vo);
	
	public void adminRemoveCustomer(String customer_id);
}
