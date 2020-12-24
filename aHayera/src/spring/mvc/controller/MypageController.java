package spring.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	
	//현재
	
	
	  //마이페이지로부터 비밀번호 변경 팝업창 띄우기
	  @RequestMapping("/POP_changePw.do") 
	  public void popup_pw(CustomerVO vo,Model m) {
		  m.addAttribute("id",vo);
	  }
	  
	  //팝업창으로부터 값 받아와서 비밀번호 변경
	  @RequestMapping("/update_pw.do") 
	  public String update_pw(CustomerVO vo) {
		//  System.out.println("비번 왔니? :"+vo.getPassword());
		  service.pw_update(vo);
		  return "redirect:/mypage.do";
		  
	  }
	  
	 
	
	
}
