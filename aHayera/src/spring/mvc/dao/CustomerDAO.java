package spring.mvc.dao;

import spring.mvc.domain.CustomerVO;

public interface CustomerDAO {

	public CustomerVO  login(CustomerVO vo);
	
	public int insertCustomer(CustomerVO vo);
}
