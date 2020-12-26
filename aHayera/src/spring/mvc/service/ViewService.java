package spring.mvc.service;

import java.util.List;

import spring.mvc.domain.ProductVO;

public interface ViewService {
	
	public List<ProductVO> selectMaxTotalsalesProduct(ProductVO vo);
	
	public List<ProductVO> viewTopFourSalesdProduct(ProductVO vo);
	
	public List<ProductVO> viewAllproduct(ProductVO vo);
	
	public ProductVO productSelected(ProductVO vo);
	
	public List<ProductVO> searchResult(String search);
	
	public List<ProductVO> categoryList(ProductVO vo);
	
	public List<ProductVO> viewFilteredProduct(ProductVO vo);
}
