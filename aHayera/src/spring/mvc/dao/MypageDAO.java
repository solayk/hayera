package spring.mvc.dao;

import spring.mvc.domain.CustomerVO;

public interface MypageDAO {  

	// 기본 저장값 받아오기
	public CustomerVO getAllById(CustomerVO vo);
	
	//수정시 받아오기
	public CustomerVO updateMypage(CustomerVO vo);
	
}
