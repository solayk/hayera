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

import spring.mvc.domain.AdminVO;
import spring.mvc.domain.CustomerVO;
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
				return "1";
			}
			else return "-1";
		}
		else return "0";
	}
	
	@RequestMapping("/adminLogout.do")
	public String logout(HttpSession session) {
        session.removeAttribute("admin_id");
		return "redirect:/main.jsp";
	} // ----- end of adminLogout.do
	
	
	// ===== adminProduct.jsp =====	
	// 상품 추가하기	
	@RequestMapping("insertProduct.do")
	public String insertProduct(ProductVO vo, String s_price, String s_cost_price, String s_discount_price, String s_capacity, String s_stock) {
		vo.setPrice(Integer.parseInt(s_price.replaceAll(",", "")));
		vo.setCost_price(Integer.parseInt(s_cost_price.replaceAll(",", "")));
		vo.setDiscount_price(Integer.parseInt(s_discount_price.replaceAll(",", "")));
		vo.setCapacity(Integer.parseInt(s_capacity.replaceAll(",", "")));
		vo.setStock(Integer.parseInt(s_stock.replaceAll(",", "")));
		adminService.insertProduct(vo);
		return "redirect:/adminProduct.do";
	}

	// 상품 : AJAX로 자동완성
	@RequestMapping("/adminSearchProduct.do")
	@ResponseBody
	public List<ProductVO> adminSearchProduct(String search) {
		List<ProductVO> list = adminService.adminSearchProduct(search);
		return list;
	}
	
	// 수정할 상품 정보 가져오기
	@RequestMapping("/adminEditTarget.do")
	@ResponseBody
	public ProductVO adminEditTarget(ProductVO vo) {
		ProductVO data = adminService.adminEditTarget(vo);
		return data;
	}
	
	// 상품 수정하기
	@RequestMapping("/adminEditProduct.do")
	public String adminEditProduct(ProductVO vo, String prod_no, String s_price, String s_cost_price, String s_discount_price, String s_capacity, String s_stock) {
		vo.setPrice(Integer.parseInt(s_price.replaceAll(",", "")));
		vo.setCost_price(Integer.parseInt(s_cost_price.replaceAll(",", "")));
		vo.setDiscount_price(Integer.parseInt(s_discount_price.replaceAll(",", "")));
		vo.setCapacity(Integer.parseInt(s_capacity.replaceAll(",", "")));
		vo.setStock(Integer.parseInt(s_stock.replaceAll(",", "")));
		adminService.adminEditProduct(vo);
		return "redirect:/adminProduct.do";
	}
	
	// 상품 삭제하기
	@RequestMapping("/adminRemoveProduct.do")
	@ResponseBody
	public void adminRemoveProduct(String prod_no) {
		adminService.adminRemoveProduct(prod_no);
	}
	
	
	// ===== adminCustomer.jsp =====
	//	전체 고객 목록 보여주기
	@RequestMapping("/viewAllCustomer.do")
	@ResponseBody
	public List<CustomerVO> viewAllCustomer(CustomerVO vo, Model model)	{ 
		List<CustomerVO> data = adminService.viewAllCustomer(vo); 
		return data;
	}
	
	// 수정할 고객 정보 가져오기
	@RequestMapping("/adminCustomerEditTarget.do")
	@ResponseBody
	public CustomerVO adminCustomerEditTarget(CustomerVO vo) {
		CustomerVO data = adminService.adminCustomerEditTarget(vo);
		return data;
	}
	
	// 고객 정보 수정하기
	@RequestMapping("/adminEditCustomer.do")
	public String adminEditCustomer(CustomerVO vo) {
		System.out.println(vo.getSkintype());
		adminService.adminEditCustomer(vo);
		return "redirect:/adminCustomer.do";
	}
	
	// 고객 삭제하기
	@RequestMapping("/adminRemoveCustomer.do")
	@ResponseBody
	public void adminRemoveCustomer(String customer_id) {
		adminService.adminRemoveCustomer(customer_id);
	}
	
}
