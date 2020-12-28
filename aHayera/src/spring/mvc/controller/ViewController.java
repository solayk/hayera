package spring.mvc.controller;

import java.util.*;

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
	
	@RequestMapping("/searchProduct.do")
	@ResponseBody
	public List<ProductVO>  searchProduct(String search, Model model) {
		List<ProductVO> list = viewService.searchResult(search); 
		return list;
	}
	
	@RequestMapping("/category.do")
	public void categoryList(ProductVO vo, Model model) {
		model.addAttribute("categoryName",vo.getCategory());
	}
	
	@RequestMapping("/categoryView.do")
	@ResponseBody
	public List<ProductVO> categoryView(ProductVO vo, Model model) {
		List<ProductVO> list = viewService.categoryList(vo); 
		return list;
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
	public List<Order_ProductVO> addCart(Order_ProductVO vo, ProductVO pvo, HttpSession session) {
		
		pvo.setProd_no(vo.getProd_no());
		pvo = viewService.productSelected(pvo);
		vo.setImg_url(pvo.getImg_url());
		vo.setProd_name(pvo.getProd_name());
		if(pvo.getDiscount_price() == 0) vo.setSales_price(pvo.getPrice());
		else vo.setSales_price(pvo.getDiscount_price());
		
		List<Order_ProductVO> list = (List<Order_ProductVO>) session.getAttribute("inCart");
		
		OUT: if (list == null) {
			list = new ArrayList<Order_ProductVO>();
			list.add(vo);
		}
		else {
			// list에 이미 담은 상품인지 확인 후 담겨있으면 수량 추가
			for(int i=0; i<list.size(); i++) {
				if(list.get(i).getProd_no().equals(vo.getProd_no())) {
					list.get(i).setEach_qty(list.get(i).getEach_qty() + vo.getEach_qty());
					break OUT;
				}
			}
			list.add(vo);
		}
		session.setAttribute("inCart",list);
		return list;
	}
	
	@RequestMapping("/viewCart.do")
	@ResponseBody
	public List<Order_ProductVO> addCart(Order_ProductVO vo, HttpSession session) {
		List<Order_ProductVO> list = (List<Order_ProductVO>) session.getAttribute("inCart");
		return list;
	}
	
	@RequestMapping("/editCart.do")
	@ResponseBody
	public String editCart(Order_ProductVO vo, HttpSession session) {
		
		List<Order_ProductVO> list = (List<Order_ProductVO>) session.getAttribute("inCart");
		
		for(int i=0; i<list.size(); i++) { 	// 장바구니 목록에서 제품 찾아 수량 수정
			if(list.get(i).getProd_no().equals(vo.getProd_no())) {
				if(vo.getRemove() != null) { // 삭제 버튼 기능
					list.remove(i);
				}
				else { // 수량 버튼 기능
					list.get(i).setEach_qty(vo.getEach_qty());
					break;
				}
			}
		}

		session.setAttribute("inCart",list); // 장바구니 목록 수정 후 session 재저장
		return "1";
	}
	
}
