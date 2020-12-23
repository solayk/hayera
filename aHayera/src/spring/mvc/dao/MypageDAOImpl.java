package spring.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.domain.CustomerVO;

@Repository
public class MypageDAOImpl implements MypageDAO{
	
	@Autowired 
	private SqlSessionTemplate mybatis;  
	
	//기존애 저장 정보 받아오기
	public CustomerVO getAllById(CustomerVO vo) {
		//System.out.println("mybatis getAllById 호출");
		return mybatis.selectOne("MypageDAO.getAllById",vo);
		
	}
	
	//수정하고 받은 값. 리턴값 맞지 않음.. 고민중...ㅠㅠ
	public  CustomerVO  updateMypage(CustomerVO vo) {
		System.out.println("mybatis updateMypage 호호출");
		
		mybatis.update("MypageDAO.updateMypage", vo);
		CustomerVO result = mybatis.selectOne("MypageDAO.getAllById", vo);

		return result;
	}


	

}