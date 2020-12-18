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
		System.out.println("===> Mybatis adminLogin() 호출");
		return (AdminVO) mybatis.selectOne("AdminDAO.adminLogin",vo);
	}
	
	public List<ProductVO> adminProduct(ProductVO vo) {
		System.out.println("===> Mybatis adminProduct() 호출");
		return mybatis.selectList("AdminDAO.adminProduct",vo);
	}

}
