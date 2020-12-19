package spring.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.domain.ProductVO;

@Repository
public class ViewMainpageDAOImpl implements ViewMainpageDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ProductVO> selectMaxTotalsalesProduct(ProductVO vo) {
		System.out.println("===> Mybatis selectMaxTotalsalesProduct() 호출");
		return mybatis.selectList("ViewMainPageDAO.selectMaxTotalsalesProduct",vo);
	}

	@Override
	public List<ProductVO> viewAllproduct(ProductVO vo) {
		System.out.println("===> Mybatis viewAllproduct() 호출");
		return mybatis.selectList("ViewMainPageDAO.viewAllProduct",vo);
	}
}
