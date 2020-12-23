package spring.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.domain.AdminVO;
import spring.mvc.domain.ProductVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public AdminVO adminLogin(AdminVO vo) {
		return (AdminVO) mybatis.selectOne("AdminDAO.adminLogin", vo);
	}
	
	public void insertProduct(ProductVO vo) {
		mybatis.insert("AdminDAO.insertProduct", vo);
	}

	public List<ProductVO> adminSearchProduct(String search) {
		return mybatis.selectList("AdminDAO.adminSearchProduct", search);
	}

	public ProductVO adminEditTarget(ProductVO vo) {
		return mybatis.selectOne("AdminDAO.adminEditTarget", vo);
	}
	
	public void adminEditProduct (ProductVO vo) {
		mybatis.update("AdminDAO.adminEditProduct", vo);
	}
}
