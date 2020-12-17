package spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.domain.AdminVO;
import spring.mvc.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService loginService;
	
	@RequestMapping("{step}.do")
	public String insert(@PathVariable String step) {
		return step;
	}
	
	@RequestMapping(value="/adminLogin.do", method=RequestMethod.POST)
	@ResponseBody
	public String adminLogin(AdminVO vo) {
		System.out.println(" === adminLogin.do 수신  === ");
		AdminVO result = loginService.adminLogin(vo);
		if(result.getManager_id()!=null) {
			if(result.getManager_password().equals(vo.getManager_password())) return "1";
			else return "-1";
		}
		else return "0";
	}
}
