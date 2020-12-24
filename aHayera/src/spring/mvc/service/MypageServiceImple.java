package spring.mvc.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dao.MypageDAOImpl;
import spring.mvc.domain.CustomerVO;

@Service    //interface = implememts 메소드명 표준화(통일화) 하기 위한 상속
public class MypageServiceImple implements MypageService {  

	@Autowired
	private MypageDAOImpl mypagedao; 
	
	@Override
	public CustomerVO getAllById(CustomerVO vo) {
		CustomerVO result = mypagedao.getAllById(vo);
		return result;
	}

	@Override
	public void updateMypage(CustomerVO vo) {
		mypagedao.updateMypage(vo);
	}

	@Override
	public int pw_update(CustomerVO vo) {
		// System.out.println("여기는 서비스? :"+vo.getPassword());
		 return mypagedao.pw_update(vo);
		
		
	}

}
