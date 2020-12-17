package spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.domain.CustomerVO;
import spring.mvc.service.CustomerService;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService customerserive;

	@RequestMapping("/login.do")
	public String login(CustomerVO vo, Model m) {
		System.out.println("login.do요청");
		m.addAttribute("customer",customerserive.login(vo));
		return "LoginTest";
	}
}
