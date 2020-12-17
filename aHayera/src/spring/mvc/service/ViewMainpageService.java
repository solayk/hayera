package spring.mvc.service;

import spring.mvc.domain.ProductVO;

public interface ViewMainpageService {
	public ProductVO selectMaxTotalsalesProduct(ProductVO vo);
}
