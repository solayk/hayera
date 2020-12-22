package spring.mvc.controller;

import java.text.DecimalFormat;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.domain.CustomerVO;
import spring.mvc.domain.OrderListVO;
import spring.mvc.domain.Order_ProductVO;
import spring.mvc.domain.ProductVO;
import spring.mvc.service.MypageService;
import spring.mvc.service.OrderService;
import spring.mvc.service.ViewMainpageService;

@Controller
public class OrderCheckController {
	
	@Autowired
	private ViewMainpageService viewMainpageService;
	@Autowired
	private MypageService mypageService;
	@Autowired
	private OrderService orderService;
	
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
	//주문
	/*@RequestMapping("/paymentComplete.do")
	public void order(HttpSession session, OrderListVO ol, Order_ProductVO op){
		CustomerVO member =	(CustomerVO)session.getAttribute("login");
		String customer_id = member.getCustomer_id();
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		 
		for(int i = 1; i <= 6; i ++) {
			subNum += (int)(Math.random() * 10);
		}
		
		String order_no = ymd + "_" + subNum;
		
		ol.setOrder_no(order_no);
		ol.setCustomer_id(customer_id);
		
		orderService.insertOrder(ol);
		
		op.setOrder_no(order_no);
		orderService.insertOrder_Product(op);
	}*/
	

}
