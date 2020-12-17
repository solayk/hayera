package spring.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.domain.ProductVO;

@Repository
public class ViewMainpageDAOImpl implements ViewMainpageDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public ProductVO selectMaxTotalsalesProduct(ProductVO vo) {
		System.out.println("===> Mybatis selectMaxTotalsalesProduct() 호출");
		return (ProductVO) mybatis.selectOne("ViewMainpagDAO.selectMaxTotalsalesProduct",vo);
		
	}
}
