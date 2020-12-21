package spring.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dao.MypageDAO;
import spring.mvc.domain.CustomerVO;
import spring.mvc.service.MypageServiceImple;

@Controller
public class MypageController {  
	
	@Autowired
	private MypageServiceImple service;
	
	//마이페이지 기존의 저장값 불러오기
	@RequestMapping("/mypage.do")
	public void getAllById(CustomerVO vo, Model m){
		

	   CustomerVO result= service.getAllById(vo);
	   String add = result.getAddress();
	   String[] addAry = add.split("/");
	   
	   for(String juso : addAry) {
		   System.out.println(juso);
	   }
	  	   m.addAttribute("result", result);
	       m.addAttribute("juso",addAry);
	 
		}  
	
	   // 주문/결제로 넘어갈 때 로그인 한 고객 정보 받아갈 것 임.
	   @RequestMapping("/getInfo.do")
	   public String getInfo(CustomerVO vo, Model m) {
	      CustomerVO info = service.getAllById(vo);
	      String add = info.getAddress();
	      String[] addAry = add.split("/");
	      
	      m.addAttribute("info", info);
	      m.addAttribute("addr",addAry);
	      return "orderCheck";
	   }
	   
	   /*//마이페이지 글 수정하기
	@RequestMapping("/updateMypage.do")
	public String updateMypage(CustomerVO vo) {
	//	MypageDAO.updateMypage(vo);
		return "redirect:/mypage.jsp";
		
	}*/
}
	
	
	
	
	
	


	
				
				

		
	

