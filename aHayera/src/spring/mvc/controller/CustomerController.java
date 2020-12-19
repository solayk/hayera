package spring.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.domain.CustomerVO;
import spring.mvc.service.CustomerService;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService customerserive;
	
	@RequestMapping(value="/login.do",produces = "application/text;charset=utf-8")
	@ResponseBody
	public String login(CustomerVO vo, HttpSession session) {
	CustomerVO result = customerserive.login(vo);
	
	if(result==null || result.getCustomer_id()==null) {
			return "0"; 
	}else {
		System.out.println("dd");
		session.setAttribute("login", result.getCustomer_id());	
			return "1";
		}
	}
	
	
	@RequestMapping(value="/join.do",produces = "application/text;charset=utf-8")
	@ResponseBody
	public void join(CustomerVO vo) {
		customerserive.insertCustomer(vo);
	}
}
