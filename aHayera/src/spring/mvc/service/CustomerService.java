package spring.mvc.service;

import java.util.HashMap;
import java.util.List;

import spring.mvc.domain.CustomerVO;
import spring.mvc.domain.QnaVO;
import spring.mvc.domain.ReviewVO;

public interface CustomerService {
   public CustomerVO login(CustomerVO vo) ;
      
   public int insertCustomer(CustomerVO vo);
   
   public CustomerVO idCheck_Login(CustomerVO vo);
   
   public List<ReviewVO> selectReview(ReviewVO vo);
   
   public List<ReviewVO> selecthighrate(HashMap map);
   
   public List<QnaVO> selectQna(QnaVO vo);
   
   public int insertqna(QnaVO vo);
   
   public int insertreview(ReviewVO vo);
   
   public List<ReviewVO> selectReviewlist();
   
   public int insertReviewrating(ReviewVO vo);
}