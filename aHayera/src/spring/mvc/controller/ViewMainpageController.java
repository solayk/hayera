package spring.mvc.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import spring.mvc.domain.ProductVO;
import spring.mvc.service.ViewMainpageService;

@Controller
public class ViewMainpageController {
	
	@Autowired
	private ViewMainpageService viewMainpageService;
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
	public List<ProductVO> viewAllproduct(ProductVO vo)	{ 
		List<ProductVO> list = viewMainpageService.viewAllproduct(vo); 
		return list;
	}
	
	@RequestMapping("/productSelected.do")
	public String productDetail(ProductVO vo, Model model) {
		model.addAttribute("productSelected",viewMainpageService.productSelected(vo));
		return "productDetail";
	}
	
	@RequestMapping("/searchResult.do")
	public void searchResult(String search, Model model) {
		model.addAttribute("searchResult",viewMainpageService.searchResult(search));
	}
	
}
