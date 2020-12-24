package spring.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.domain.CustomerVO;
import spring.mvc.service.MypageServiceImple;

@Controller
public class MypageController {  

	@Autowired 
	private MypageServiceImple service; 

	// 마이페이지 기존의 저장값 불러오기
	@RequestMapping("/mypage.do")
	public void getAllById(CustomerVO vo, Model m, HttpSession session) {	
		
		vo.setCustomer_id((String)session.getAttribute("login"));
		CustomerVO result = service.getAllById(vo);
		
		String add = result.getAddress();
		String[] addAry = add.split("/");
	//	System.out.println(result.getTel());
		
		m.addAttribute("result", result);
		m.addAttribute("juso", addAry);
	}

	// 마이페이지 글 수정하기
	@RequestMapping("/updateMypage.do")
	public String updateMypage(CustomerVO vo, String zonecode, String addr, String detailAddr,String extraAddr,Model m) {
		
		String address = zonecode + "/" + addr + "/" + detailAddr + "/" + extraAddr;
		vo.setAddress(address);
		service.updateMypage(vo);

		return "redirect:/mypage.do";
	}
	
	//현재값 받기
	@RequestMapping("/before_pw.do")
	@ResponseBody
	public String beforePw(CustomerVO vo, HttpSession session) {
		
		vo.setCustomer_id((String)session.getAttribute("login"));
		CustomerVO result = service.getAllById(vo);
		String beforepw = result.getPassword();
		
		return beforepw;
	}
	
	
	//현재 아이디값 받아서 비밀번호 업데이트
	@RequestMapping("/change_pop.do")
	@ResponseBody
	public int changePw(HttpSession session,CustomerVO vo) {
		
		vo.setCustomer_id((String)session.getAttribute("login"));
		
 		int updatepw = service.pw_update(vo);
		return updatepw;
	}
	
	
	
	
	 
	  
	 
	
	
}
