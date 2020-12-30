package spring.mvc.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.catalina.valves.RemoteIpValve;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.domain.CustomerVO;
import spring.mvc.domain.QnaVO;
import spring.mvc.domain.ReviewVO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

   @Autowired
   private SqlSessionTemplate mybatis;
   
   
   public CustomerVO login(CustomerVO vo) {
      System.out.println("mybatis login 호출");
      System.out.println(vo.getCustomer_id());
      
      return (CustomerVO)mybatis.selectOne("CustomerDAO.login",vo);
   }


   
   public int insertCustomer(CustomerVO vo) {
      System.out.println("mybatis insert 호출");
      return mybatis.insert("CustomerDAO.insert", vo);
   }




   public CustomerVO idCheck(CustomerVO vo) {
      System.out.println("mybatis idCheck 호출");
      return mybatis.selectOne("CustomerDAO.login", vo);
   }



   
   public List<ReviewVO> selectReview(ReviewVO vo) {
      System.out.println("mybatis selectreview 호출");
      return mybatis.selectList("CustomerDAO.selectReview", vo);
   }



   public List<ReviewVO> selecthighrate(HashMap map) {
      System.out.println("mybatis selecthightrate 호출");
      
      
      
      return mybatis.selectList("CustomerDAO.selecthighrate", map);
   }



   public List<QnaVO> selectQna(QnaVO vo) {
	 return mybatis.selectList("CustomerDAO.selectQna",vo);
}



	public int insertqna(QnaVO vo) {
	return mybatis.insert("CustomerDAO.insertqna", vo);
}
	
	public int insertreview(ReviewVO vo) {
		return mybatis.insert("CustomerDAO.insertreview", vo);
	}



	public List<ReviewVO> selectReviewlist() {
		return mybatis.selectList("CustomerDAO.selectReviewlist");
	}



	@Override
	public int insertReviewrating(ReviewVO vo) {
		
		return mybatis.update("CustomerDAO.updateReviewrating", vo);
	}
	
	

}