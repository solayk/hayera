package spring.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.util.JSONPObject;

import spring.mvc.domain.ObjectVO;
import spring.mvc.domain.ProductVO;
import spring.mvc.service.ViewMainpageService;

@Controller
public class ViewMainpageController {
	
	@Autowired
	private ViewMainpageService viewMainpageService;
//  판매량 상위 상품 보여주기	
	@RequestMapping("/viewTopSalesedItem.do")
	@ResponseBody
	public List<ProductVO> viewTopSalesedItem(ProductVO vo) {
		System.out.println("---- viewTopSalesedItem.do 요청 됨");
		List<ProductVO> list = viewMainpageService.selectMaxTotalsalesProduct(vo);
		return list;
	}
	
//	전체 상품 목록 보여주기
	@RequestMapping("/viewAllProduct.do")
	@ResponseBody
	public List<ProductVO> viewAllproduct(ProductVO vo)	{ 
		System.out.println("---- main.do 요청 됨"); 
		List<ProductVO> list = viewMainpageService.viewAllproduct(vo); 
		return list;
	}
	
}
