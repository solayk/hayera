package spring.mvc.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dao.CustomerDAO;
import spring.mvc.domain.CustomerVO;
import spring.mvc.domain.QnaVO;
import spring.mvc.domain.ReviewVO;

@Service
public class CustomerServicelmpl implements CustomerService {

   @Autowired
   private CustomerDAO customerDAO;
   
   public CustomerVO login(CustomerVO vo) {
      return customerDAO.login(vo);
   }

   
   public int insertCustomer(CustomerVO vo) {
      return customerDAO.insertCustomer(vo);
   }

   
   public CustomerVO idCheck_Login(CustomerVO vo) {
      return customerDAO.idCheck(vo);
   }


   
   public List<ReviewVO> selectReview(ReviewVO vo) {
      
      return customerDAO.selectReview(vo);
   }


   
   public List<ReviewVO> selecthighrate(HashMap map) {
      
      return customerDAO.selecthighrate(map);
   }


   	public List<QnaVO> selectQna(QnaVO vo) {
	return customerDAO.selectQna(vo);
}


   	public int insertqna(QnaVO vo) {
	return customerDAO.insertqna(vo);
}
   public int insertreview(ReviewVO vo) {
	   return customerDAO.insertreview(vo);
   }
   

}