package spring.mvc.dao;

import java.util.List;

import spring.mvc.domain.CustomerVO;
import spring.mvc.domain.ReviewVO;

public interface CustomerDAO {

	public CustomerVO  login(CustomerVO vo);
	
	public int insertCustomer(CustomerVO vo);
	
	public CustomerVO idCheck(CustomerVO vo);
	
	public List<ReviewVO> selectReview(ReviewVO vo);
	
	public List<ReviewVO> selecthighrate(ReviewVO vo);
}
