package spring.mvc.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.domain.ObjectVO;
import spring.mvc.domain.ProductVO;
import spring.mvc.service.ViewMainpageService;

@Controller
public class ViewMainpageController {
	
	@Autowired
	private ViewMainpageService viewMainpageService;
	
	@RequestMapping(value="/viewTopSalesedItemName.do", method=RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String viewTopsalesdItemName(ProductVO vo) {
		System.out.println("---- viewTopSalesedItemName.do 요청 됨");
		ProductVO result = viewMainpageService.selectMaxTotalsalesProduct(vo);
		return result.getProd_name();
		/*
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		ProductVO prd = null;
		ProductVO result = viewMainpageService.selectMaxTotalsalesProduct(vo);
		ObjectVO objectVO = new ObjectVO();
		System.out.println("으악");
		System.out.println(result.getProd_name());
		System.out.println(viewMainpageService.selectMaxTotalsalesProduct(vo).getProd_name());
		prd.setProd_name(viewMainpageService.selectMaxTotalsalesProduct(vo).getProd_name());
		prd.setBrand(viewMainpageService.selectMaxTotalsalesProduct(vo).getBrand());
		prd.setCapacity(result.getCapacity());
		prd.setDiscount_price(result.getDiscount_price());
		prd.setImg_url(result.getImg_url());
		prd.setAvg_rating(result.getAvg_rating());
		list.add(prd);
		
		objectVO.setList(list);
		System.out.println(objectVO);
		return objectVO;
		*/
	}
	@RequestMapping(value="/viewTopSalesedItemBrand.do", method=RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String viewTopSalesedItemBrand(ProductVO vo) {
		System.out.println("---- viewTopSalesedItemBrand.do 요청 됨");
		ProductVO result = viewMainpageService.selectMaxTotalsalesProduct(vo);
		return result.getBrand();
	}
	@RequestMapping(value="/viewTopSalesedItemImage.do", method=RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String viewTopSalesedItemImage(ProductVO vo) {
		System.out.println("---- viewTopSalesedItemImage.do 요청 됨");
		ProductVO result = viewMainpageService.selectMaxTotalsalesProduct(vo);
		System.out.println(result.getImg_url());
		return result.getImg_url();
	}
	
//	@RequestMapping("/viewAll.do")
//	@ResponseBody
//	public String viewAllproduct(ProductVO vo, Model m)	{ 
//		System.out.println("---- main.do 요청 됨"); 
//		m.addAttribute("productList",viewMainpageService.viewAllproduct(vo)); 
//		return "";
//	}
	
}
