package spring.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import spring.mvc.domain.AdminVO;
import spring.mvc.domain.ProductVO;
import spring.mvc.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("{step}.do")
	public String insert(@PathVariable String step) {
		return step;
	}
	
	@RequestMapping(value="/adminLogin.do", method=RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String adminLogin(AdminVO vo, HttpSession session) {
		AdminVO result = adminService.adminLogin(vo);
		if(result!=null) {
			if(result.getManager_password().equals(vo.getManager_password())) {
				session.setAttribute("admin_id", result.getManager_id());
				System.out.println(session.getAttribute("admin_id"));	// 로그인 성공 시 관리자 아이디 admin_id에 저장
				return "1";
			}
			else return "-1";
		}
		else return "0";
	}
	
	@RequestMapping("/adminProduct.do")
	public void adminProduct(ProductVO vo, Model model) {
		List<ProductVO> list = adminService.adminProduct(vo);
		model.addAttribute("productList",list);
	}
	
	@RequestMapping("insertProduct.do")
	public String insertProduct(ProductVO vo) {
		adminService.insertProduct(vo);
		return "redirect:/adminProduct.do";
	}
	
	
}
