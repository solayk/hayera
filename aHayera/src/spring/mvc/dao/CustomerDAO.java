package spring.mvc.dao;

import spring.mvc.domain.CustomerVO;

public interface CustomerDAO {

	public CustomerVO  login(CustomerVO vo);
	
	public int insertCustomer(CustomerVO vo);
	
	public CustomerVO idCheck(CustomerVO vo);
}
