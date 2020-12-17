package spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.domain.AdminVO;
import spring.mvc.service.AdminService;

@Controller
public class AdminController {
	
//	@Autowired
//	private AdminService loginService;
	
	@RequestMapping("/adminLogin.do")
	public String adminLogin(AdminVO vo) {
		System.out.println(" === adminLogin.do 수신  === ");
		System.out.println(vo.getAdminId());
		System.out.println(vo.getAdminPassword());
//		loginService.adminLogin(vo);
		return "AdminLoginTest";
	}
	
}
