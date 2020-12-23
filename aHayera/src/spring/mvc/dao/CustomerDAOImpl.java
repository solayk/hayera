package spring.mvc.dao;

import java.util.List;

import org.apache.catalina.valves.RemoteIpValve;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.domain.CustomerVO;
import spring.mvc.domain.ReviewVO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public CustomerVO login(CustomerVO vo) {
		System.out.println("mybatis login 호출");
		System.out.println(vo.getCustomer_id());
		
		return (CustomerVO)mybatis.selectOne("CustomerDAO.login",vo);
	}


	
	public int insertCustomer(CustomerVO vo) {
		System.out.println("mybatis insert 호출");
		return mybatis.insert("CustomerDAO.insert", vo);
	}




	public CustomerVO idCheck(CustomerVO vo) {
		System.out.println("mybatis idCheck 호출");
		return mybatis.selectOne("CustomerDAO.login", vo);
	}



	
	public List<ReviewVO> selectReview(ReviewVO vo) {
		System.out.println("mybatis selectreview 호출");
		return mybatis.selectList("CustomerDAO.selectReview", vo);
	}



	public List<ReviewVO> selecthighrate(ReviewVO vo) {
		System.out.println("mybatis selecthightrate 호출");
		return mybatis.selectList("CustomerDAO.selecthighrate", vo);
	}

}
