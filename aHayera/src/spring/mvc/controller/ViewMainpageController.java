package spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.domain.ProductVO;
import spring.mvc.service.ViewMainpageService;

@Controller
public class ViewMainpageController {
	
	@Autowired
	private ViewMainpageService viewMainpageService;
	
	@RequestMapping("/viewMainpage.do")
	public String selectMaxTotalsalesProduct(ProductVO vo, Model m) {
		System.out.println("---- viewMainpage.do 요청 됨");
		m.addAttribute("mainpage",viewMainpageService.selectMaxTotalsalesProduct(vo));
		return "viewMainpage";
	}
}
