package spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.domain.AdminVO;
import spring.mvc.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService loginService;
	
	@RequestMapping("/adminLogin.do")
	public String adminLogin(AdminVO vo, Model model) {
		System.out.println(" === adminLogin.do 수신  === ");
		model.addAttribute("admin",loginService.adminLogin(vo));
		return "adminLogin";
	}
	
}
