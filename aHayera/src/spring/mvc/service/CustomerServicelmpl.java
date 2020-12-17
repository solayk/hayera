package spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dao.CustomerDAO;
import spring.mvc.domain.CustomerVO;

@Service
public class CustomerServicelmpl implements CustomerService {

	@Autowired
	private CustomerDAO customerDAO;
	
	public CustomerVO login(CustomerVO vo) {
		return customerDAO.login(vo);
	}

}
