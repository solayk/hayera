package spring.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.domain.ProductVO;

@Repository
public class ViewDAOImpl implements ViewDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ProductVO> selectMaxTotalsalesProduct(ProductVO vo) {
		return mybatis.selectList("ViewDAO.selectMaxTotalsalesProduct",vo);
	}

	public List<ProductVO> viewTopFourSalesdProduct(ProductVO vo) {
		return mybatis.selectList("ViewDAO.viewTopFourSalesdProduct",vo);
	}

	public List<ProductVO> viewAllproduct(ProductVO vo) {
		return mybatis.selectList("ViewDAO.viewAllProduct",vo);
	}
	
	public ProductVO productSelected(ProductVO vo) {
		return mybatis.selectOne("ViewDAO.productSelected",vo);
	}

	public List<ProductVO> searchResult(String search) {
		return mybatis.selectList("ViewDAO.searchResult",search);
	}
	
	public List<ProductVO> categoryList(ProductVO vo) {
		return mybatis.selectList("ViewDAO.categoryList",vo);
	}
	
	public List<ProductVO> viewFilteredProduct(ProductVO vo) {
		return mybatis.selectList("ViewDAO.viewFilteredProduct",vo);
	}
	
}
