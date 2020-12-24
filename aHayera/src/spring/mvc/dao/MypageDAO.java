package spring.mvc.dao;

import spring.mvc.domain.CustomerVO;

public interface MypageDAO {   

	// 기본 저장값 받아오기
	public CustomerVO getAllById(CustomerVO vo);
	
	//수정시 받아오기
	public void updateMypage(CustomerVO vo);
	
	//변경된 비밀번호 받아오기
	public int pw_update(CustomerVO vo);
	
		
}
