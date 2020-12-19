package spring.mvc.service;

import spring.mvc.domain.CustomerVO;

public interface CustomerService {
	public CustomerVO login(CustomerVO vo) ;
		
	public int insertCustomer(CustomerVO vo);
	
	public CustomerVO idCheck_Login(CustomerVO vo);
}
