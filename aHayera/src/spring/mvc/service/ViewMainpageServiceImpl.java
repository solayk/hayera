package spring.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dao.ViewMainpageDAOImpl;
import spring.mvc.domain.ProductVO;
@Service
public class ViewMainpageServiceImpl implements ViewMainpageService {
	@Autowired
	private ViewMainpageDAOImpl viewMainDAO;

	public List<ProductVO> selectMaxTotalsalesProduct(ProductVO vo) {
		return viewMainDAO.selectMaxTotalsalesProduct(vo);
	}

	public List<ProductVO> viewTopfiveSalesdProduct(ProductVO vo) {
		return viewMainDAO.viewTopfiveSalesdProduct(vo);
	}
	
	public List<ProductVO> viewAllproduct(ProductVO vo) {
		return viewMainDAO.viewAllproduct(vo);
	}
	
	public ProductVO productSelected(ProductVO vo) {
		return viewMainDAO.productSelected(vo);
	}
	
	public List<ProductVO> searchResult(String search) {
		return viewMainDAO.searchResult(search);
	}
	
	public List<ProductVO> categoryList(ProductVO vo) {
		return viewMainDAO.categoryList(vo);
	}
	
	public List<ProductVO> viewFilteredProduct(ProductVO vo) {
		return viewMainDAO.viewFilteredProduct(vo);
	}
	
}
