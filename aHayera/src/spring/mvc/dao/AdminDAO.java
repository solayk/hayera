package spring.mvc.dao;

import java.util.List;

import spring.mvc.domain.AdminVO;
import spring.mvc.domain.ProductVO;

public interface AdminDAO {
	
	public AdminVO adminLogin(AdminVO vo);
	
	public List<ProductVO> adminProduct(ProductVO vo);
	
	public void insertProduct(ProductVO vo);
}
