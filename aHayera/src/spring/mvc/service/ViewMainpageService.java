package spring.mvc.service;

import spring.mvc.domain.ProductVO;

public interface ViewMainpageService {
	ProductVO selectMaxTotalsalesProduct(ProductVO vo);
}
