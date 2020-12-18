package spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.domain.ProductVO;
import spring.mvc.service.ViewMainpageService;

@Controller
public class ViewMainpageController {
	
	@Autowired
	private ViewMainpageService viewMainpageService;
	
	@RequestMapping(value="/viewMain.do", produces="application/text;charset=utf-8")
	@ResponseBody
	public String viewMain(ProductVO vo, Model m) {
		System.out.println("---- viewMain.do 요청 됨");
		ProductVO result = viewMainpageService.selectMaxTotalsalesProduct(vo);
		String pname = result.getProd_name();
		m.addAttribute("pname",pname);
		return pname;
	}
}
