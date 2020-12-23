package spring.mvc.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import spring.mvc.domain.ProductVO;
import spring.mvc.domain.ReviewVO;
import spring.mvc.service.CustomerService;
import spring.mvc.service.ViewMainpageService;

@Controller
public class ViewMainpageController {
	
	@Autowired
	private ViewMainpageService viewMainpageService;
	@Autowired
	private CustomerService customerservice;
	
//  판매량 1위 상품 보여주기	
	@RequestMapping("/viewTopSalesedItem.do")
	@ResponseBody
	public List<ProductVO> viewTopSalesedItem(ProductVO vo) {
		List<ProductVO> list = viewMainpageService.selectMaxTotalsalesProduct(vo);
		return list;
	}
//  판매량 상위 5위까지 상품 보여주기
	@RequestMapping("/viewTopfiveSalesdProduct")
	@ResponseBody
	public List<ProductVO> viewTopfiveSalesdProduct(ProductVO vo){
		List<ProductVO> list = viewMainpageService.viewTopfiveSalesdProduct(vo);
		return list;
	}
	
//	전체 상품 목록 보여주기
	@RequestMapping("/viewAllProduct.do")
	@ResponseBody
	public List<ProductVO> viewAllproduct(ProductVO vo, Model model)	{ 
		List<ProductVO> list = viewMainpageService.viewAllproduct(vo); 
		return list;
	}
	
	//상품누르면 prod_no받아서 리뷰 넘기기
	@RequestMapping("/productSelected.do")
	public String productDetail(ProductVO vo, Model model, ReviewVO rvo) {
		model.addAttribute("productSelected",viewMainpageService.productSelected(vo));
		rvo.setProd_no(vo.getProd_no());
		model.addAttribute("reviewList",customerservice.selectReview(rvo));
		return "productDetail";
	}
	
	@RequestMapping("/searchResult.do")
	public void searchResult(String search, Model model) {
		model.addAttribute("searchResult",viewMainpageService.searchResult(search));
		model.addAttribute("searchTerm",search);
	}
	
	@RequestMapping("/category.do")
	public String categoryList(ProductVO vo, Model model) {
		model.addAttribute("categoryList",viewMainpageService.categoryList(vo));
		model.addAttribute("categoryName",vo.getCategory());
		return "category";
	}
	
}
