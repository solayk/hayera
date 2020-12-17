package spring.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.domain.CustomerVO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public CustomerVO login(CustomerVO vo) {
		System.out.println("mybatis login 호출");
		System.out.println(vo.getId());
		
		return (CustomerVO)mybatis.selectOne("CustomerDAO.login",vo);
	}

}
