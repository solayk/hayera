package spring.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
		
	/*
	 * session값을 뷰(mypage.jsp/controller) 로그인값을 받으면 아이디가 나오니까 아이디를 가지고 디비로 가서 나머지
	 * 정보를 다 가지고 와야함 select문 where 아이디? 로그인 후에 -> 개인정보 수정-> 로그인 정보 출력 ->로그인 id값을 갖고
	 * 개인정보 출력 컨트롤-> 서비스-> 다오-> 메퍼 }
	 * 
	 * Controller의 메서드는 Model이라는 타입의 객체를 파라미터로 받을 수 있다.
		순수하게 JSP Servlet으로 웹 어플리케이션을 만들 때 보통 request나 session 내장객체에 정보를 담아 jsp에 넘겨주곤 했는데 Spring에서는 Model이라는 녀석을 쓴다.
		즉 request.setAttribute() 와 비슷한 역할을 하는 것.
	 */
		//String customerId = (String)session.getAttribute("login"); 
		
	   CustomerVO result= service.getAllById(vo);
	   m.addAttribute("result", result);
	
	   
	}
	
	//마이페이지 글 수정하기
	@RequestMapping("/updateMypage.do")
	public String updateMypage(CustomerVO vo) {
	//	MypageDAO.updateMypage(vo);
		return "redirect:/mypage.jsp";
		
	}


	}
				
				

		
	

