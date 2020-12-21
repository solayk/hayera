package spring.mvc.dao;

import java.util.List;

import spring.mvc.domain.ProductVO;

public interface ViewMainpageDAO {
	public List<ProductVO> selectMaxTotalsalesProduct(ProductVO vo);
	public List<ProductVO> viewTopfiveSalesdProduct(ProductVO vo);
	public List<ProductVO> viewAllproduct(ProductVO vo);
	public ProductVO productSelected(ProductVO vo);
}
