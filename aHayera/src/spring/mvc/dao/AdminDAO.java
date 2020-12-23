package spring.mvc.dao;

import java.util.List;

import spring.mvc.domain.AdminVO;
import spring.mvc.domain.ProductVO;

public interface AdminDAO {
	
	public AdminVO adminLogin(AdminVO vo);
	
	public void insertProduct(ProductVO vo);

	public List<ProductVO> adminSearchProduct(String search);
	
	public ProductVO adminEditTarget(ProductVO vo);
	
	public void adminEditProduct (ProductVO vo);
	
	public void adminRemoveProduct (String prod_no);
}
