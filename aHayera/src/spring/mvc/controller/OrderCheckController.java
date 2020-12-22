package spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.domain.CustomerVO;
import spring.mvc.domain.ProductVO;
import spring.mvc.service.MypageService;
import spring.mvc.service.ViewMainpageService;

@Controller
public class OrderCheckController {
	
	@Autowired
	private ViewMainpageService viewMainpageService;
	@Autowired
	private MypageService mypageService;
	
	// 상품 상세 페이지에서 결제하기 눌러서 넘어갈 때 고객 정보/해당 상품 정보 갖고 넘어감. 
	@RequestMapping("/goOrderFromProductDetail.do")
	public String goOrderFromProductDetail(CustomerVO cvo, ProductVO pvo, Model m) {
		ProductVO productInfo = viewMainpageService.productSelected(pvo);
		CustomerVO info = mypageService.getAllById(cvo);
		String addr = info.getAddress();
		String[] addrAry = addr.split("/");
		
		m.addAttribute("productInfo",productInfo);
		m.addAttribute("info",info);
		m.addAttribute("addr",addrAry);
		return "orderCheck";
	}

}
