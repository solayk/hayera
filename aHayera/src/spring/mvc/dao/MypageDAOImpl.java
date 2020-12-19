package spring.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.domain.CustomerVO;

@Repository
public class MypageDAOImpl implements MypageDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;  
	
	public CustomerVO getAllById(CustomerVO vo) {
		System.out.println("mybatis getAllById 호출");
		return mybatis.selectOne("MypageDAO.getAllById",vo);
		
	}
	

}