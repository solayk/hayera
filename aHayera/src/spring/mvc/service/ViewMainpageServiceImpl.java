package spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dao.ViewMainpageDAOImpl;
import spring.mvc.domain.ProductVO;
@Service
public class ViewMainpageServiceImpl implements ViewMainpageService {
	@Autowired
	private ViewMainpageDAOImpl viewMainDAO;

	public ProductVO selectMaxTotalsalesProduct(ProductVO vo) {
		return viewMainDAO.selectMaxTotalsalesProduct(vo);
	}
		
}
