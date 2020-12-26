package spring.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dao.ViewDAOImpl;
import spring.mvc.domain.ProductVO;
@Service
public class ViewServiceImpl implements ViewService {
	@Autowired
	private ViewDAOImpl viewDAO;

	public List<ProductVO> selectMaxTotalsalesProduct(ProductVO vo) {
		return viewDAO.selectMaxTotalsalesProduct(vo);
	}

	public List<ProductVO> viewTopFourSalesdProduct(ProductVO vo) {
		return viewDAO.viewTopFourSalesdProduct(vo);
	}
	
	public List<ProductVO> viewAllproduct(ProductVO vo) {
		return viewDAO.viewAllproduct(vo);
	}
	
	public ProductVO productSelected(ProductVO vo) {
		return viewDAO.productSelected(vo);
	}
	
	public List<ProductVO> searchResult(String search) {
		return viewDAO.searchResult(search);
	}
	
	public List<ProductVO> categoryList(ProductVO vo) {
		return viewDAO.categoryList(vo);
	}
	
	public List<ProductVO> viewFilteredProduct(ProductVO vo) {
		return viewDAO.viewFilteredProduct(vo);
	}
	
}
