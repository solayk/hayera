package spring.mvc.dao;

import spring.mvc.domain.ProductVO;

public interface ViewMainpageDAO {
	public ProductVO selectMaxTotalsalesProduct(ProductVO vo);
}
