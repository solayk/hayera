package spring.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import spring.mvc.domain.Order_ProductVO;
import spring.mvc.domain.ProductVO;
import spring.mvc.domain.QnaVO;
import spring.mvc.domain.ReviewVO;
import spring.mvc.service.CustomerService;
import spring.mvc.service.OrderService;
import spring.mvc.service.ViewService;

@Controller
public class ViewController {
	
	@Autowired
	private ViewService viewService;
	@Autowired
	private CustomerService customerservice;
	@Autowired
	private OrderService orderService;
	
	// 판매량 1위 상품 보여주기	
	@RequestMapping("/viewTopSalesedItem.do")
	@ResponseBody
	public List<ProductVO> viewTopSalesedItem(ProductVO vo) {
		List<ProductVO> list = viewService.selectMaxTotalsalesProduct(vo);
		return list;
	}
	// 판매량 상위 5위까지 상품 보여주기
	@RequestMapping("/viewTopFourSalesdProduct")
	@ResponseBody
	public List<ProductVO> viewTopfiveSalesdProduct(ProductVO vo){
		List<ProductVO> list = viewService.viewTopFourSalesdProduct(vo);
		return list;
	}
	
	// 전체 상품 목록 보여주기
	@RequestMapping("/viewAllProduct.do")
	@ResponseBody
	public List<ProductVO> viewAllproduct(ProductVO vo, Model model)	{ 
		List<ProductVO> list = viewService.viewAllproduct(vo); 
		return list;
	}
	
	//상품누르면 prod_no받아서 리뷰 넘기기
	@RequestMapping("/productSelected.do")
	public String productDetail(ProductVO vo, Model model, ReviewVO rvo,QnaVO qvo) {
		model.addAttribute("productSelected",viewService.productSelected(vo));
		rvo.setProd_no(vo.getProd_no());
		qvo.setProd_no(vo.getProd_no());
		model.addAttribute("reviewList",customerservice.selectReview(rvo));
		model.addAttribute("qnaList", customerservice.selectQna(qvo));
		return "productDetail";
	}
	
	@RequestMapping("/searchResult.do")
	public void searchResult(String search, Model model) {
		model.addAttribute("searchResult",viewService.searchResult(search));
		model.addAttribute("searchTerm",search);
	}
	
	@RequestMapping("/category.do")
	public String categoryList(ProductVO vo, Model model) {
		model.addAttribute("categoryList",viewService.categoryList(vo));
		model.addAttribute("categoryName",vo.getCategory());
		return "category";
	}
	
	// 필터된 상품 목록
	@RequestMapping("/viewFilteredProduct.do")
	@ResponseBody
	public List<ProductVO> viewFilteredProduct(ProductVO vo, Model model)	{ 
		List<ProductVO> list = viewService.viewFilteredProduct(vo); 
		return list;
	}
	
	@RequestMapping("/addCart.do")
	@ResponseBody
	public void addCart(Order_ProductVO vo, HttpSession session) {

		System.out.println("===== " + vo.getProd_no());
		
//		List<Order_ProductVO> list = (List<Order_ProductVO>) session.getAttribute("cartList");
//		session.setAttribute("cartList",list);
		
		/* List<ProductVO> data = orderService.addCart(pvo); */
	}
	
//	@RequestMapping("/viewCart.do")
//	@ResponseBody
//	public List<ProductVO> addCart(ProductVO pvo, Model m) {
//		ProductVO productInfo = viewMainpageService.productSelected(pvo);
//		List<ProductVO> data = orderService.addCart(productInfo);
//		m.addAttribute("productInfo",productInfo);
//		return data;
//	}
	
}
