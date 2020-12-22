package spring.mvc.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;



import spring.mvc.domain.CustomerVO;
import spring.mvc.domain.ReviewVO;
import spring.mvc.service.CustomerService;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService customerserive;
	
	@RequestMapping(value="/idCheck.do",produces="application/text;charset=utf-8")
	@ResponseBody
	public String idCheck(CustomerVO vo) {
		CustomerVO result = customerserive.idCheck_Login(vo);
		String message = "이미 사용중인 아이디입니다.";
		if(result==null) {
			message="사용가능합니다.";
		}
		return message;
	}
	
	
	
	// 로그인 하기
	@RequestMapping(value="/logingo.do",produces = "application/text;charset=utf-8")
	@ResponseBody
	public String login(CustomerVO vo, HttpSession session) {
	CustomerVO result = customerserive.login(vo);
	
	if(result==null || result.getCustomer_id()==null) {
			return "0"; 
	}else {
		session.setAttribute("login", result.getCustomer_id());	
			return "1";
		}
	}
	
	// mainAfterLogin.jsp 에서 로그아웃 클릭 시 session 값 삭제 후 main.jsp 이동
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
        session.removeAttribute("login");
		return "redirect:/main.jsp";
	} // ----- end of logout.do
	
	
	// 회원가입하기
	@RequestMapping(value="/joingo.do",produces = "application/text;charset=utf-8")
	@ResponseBody
	public String join(CustomerVO vo) {
		int result = customerserive.insertCustomer(vo);
		if(result==1)  return "1";
		return "0";
	}
	
	//리뷰 목록 불러오기
	@RequestMapping(value= "/productDetail.do",produces = "application/text;charset=utf-8")
	public void selectReview(ReviewVO vo, Model m, HttpSession session) {
		System.out.println(vo.getProd_no());
		
		m.addAttribute("reviewList",customerserive.selectReview(vo));
		
	}
}
