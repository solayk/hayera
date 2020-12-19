package spring.mvc.service;

import java.util.List;

import spring.mvc.domain.ProductVO;

public interface ViewMainpageService {
	
	public List<ProductVO> selectMaxTotalsalesProduct(ProductVO vo);
	
	public List<ProductVO> viewAllproduct(ProductVO vo); 
}
