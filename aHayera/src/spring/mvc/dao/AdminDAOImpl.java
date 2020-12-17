package spring.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import spring.mvc.domain.AdminVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void adminLogin(AdminVO vo) {
		System.out.println("===> Mybatis adminLogin() 호출");
		mybatis.selectOne("LoginDAO.adminLogin",vo);
	}

}
