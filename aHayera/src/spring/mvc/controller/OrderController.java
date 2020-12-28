package spring.mvc.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.dao.Order_ProductVOList;
import spring.mvc.domain.CustomerVO;
import spring.mvc.domain.OrderListVO;
import spring.mvc.domain.Order_ProductVO;
import spring.mvc.domain.ProductVO;
import spring.mvc.service.MypageService;
import spring.mvc.service.OrderService;
import spring.mvc.service.ViewService;

@Controller
public class OrderController {
	
	@Autowired
	private ViewService viewMainpageService;
	@Autowired
	private MypageService mypageService;
	@Autowired
	private OrderService orderService;
	
	// 장바구니에서 결제하기 눌러서 넘어가기 -> orderCheckFromCart.jsp로 고객 정보/상품 정보 갖고 넘어가기. 
	@RequestMapping("/orderFromCart.do")
	public String orderFromCart(HttpSession session, Order_ProductVO vo, CustomerVO cvo, Model m) {
		
		String customer_id = (String)session.getAttribute("login");
		cvo.setCustomer_id(customer_id);
		
		CustomerVO info = mypageService.getAllById(cvo);
		
		String addr = info.getAddress();
		String[] addrAry = addr.split("/");
		
		m.addAttribute("info",info);
		m.addAttribute("addr",addrAry);
		
		List<Order_ProductVO> list = (List<Order_ProductVO>) session.getAttribute("inCart");
		
		m.addAttribute("list",list);
		
		return "orderCheckFromCart";
	}
	// '상품상세페이지'에서 결제하기 눌러서 넘어갈 때(orderCheck.jsp로) 고객 정보/해당 상품 정보 갖고 넘어감. 
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
	// 주문 (현재는 로그인 한 회원의 정보를 주문 테이블 데이터로 저장하는 메소드가 되어버렸음.. 즉, 기본 배송지 설정 or '회원 정보와 동일' 선택한 상태의 주문 정보 저장임.)
	// '주문/결제 페이지'에서 결제하기 눌렀을 때 고객&제품 정보들을 갖고 넘어가 (어디로? -> paymentComplete.jsp로) 면서 orderlist, orderlist_product 테이블에 데이터 저장할거야. 
	@RequestMapping("/paymentComplete.do")
	public void order(CustomerVO cvo, OrderListVO ol, Order_ProductVO op, HttpSession session){
		cvo.setCustomer_id((String)session.getAttribute("login"));  
		CustomerVO info = mypageService.getAllById(cvo);
		// 로그인 한 회원의 정보를 가지고 고객id, 받는 사람, 주소 설정.
		String customer_id = info.getCustomer_id(); // 고객 아이디
		String receive = info.getName(); // 받는 사람
		String order_address = info.getAddress(); // 주소
		// 주문번호 만들어지게하는 거
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		 
		for(int i = 1; i <= 6; i ++) {
			subNum += (int)(Math.random() * 10);
		}
		
		String order_no = ymd + subNum;
		// 주문(orderlist) 테이블에 저장될 데이터 입력 
		ol.setOrder_no(order_no);
		ol.setCustomer_id(customer_id);
		ol.setReceive(receive);
		ol.setOrder_address(order_address);
		ol.setOrder_status("결제완료");
		
		orderService.insertOrder(ol);
		
		// 주문-제품(orderlist_product) 테이블에 저장될 데이터 입력
		op.setOrder_no(order_no);
		
		orderService.insertOrder_Product(op);
	};
	
	// 장바구니 통해 여러 상품 주문결제
	@RequestMapping("/paymentCompleteCart.do")
	public String orderFromCart(CustomerVO cvo, OrderListVO ol, Order_ProductVOList opList, HttpSession session) {
		cvo.setCustomer_id((String)session.getAttribute("login"));  
		CustomerVO info = mypageService.getAllById(cvo);
		// 로그인 한 회원의 정보를 가지고 고객id, 받는 사람, 주소 설정.
		String customer_id = info.getCustomer_id(); // 고객 아이디
		String receive = info.getName(); // 받는 사람
		String order_address = info.getAddress(); // 주소
		// 주문번호 만들어지게하는 거
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		 
		for(int i = 1; i <= 6; i ++) {
			subNum += (int)(Math.random() * 10);
		}
		
		String order_no = ymd + subNum;
		// 주문(orderlist) 테이블에 저장될 데이터 입력 
		ol.setOrder_no(order_no);
		ol.setCustomer_id(customer_id);
		ol.setReceive(receive);
		ol.setOrder_address(order_address);
		ol.setOrder_status("결제완료");
		
		orderService.insertOrder(ol);

		/// Order_ProductVOList 활용해 DB orderlist_product에 값 넣기.해야함
		
		
		System.out.println(opList.getOrder_ProductVOList().get(0).getProd_no());
		System.out.println(opList.getOrder_ProductVOList().get(1).getProd_no());
		System.out.println(opList.getOrder_ProductVOList().get(2).getProd_no());
		
		return "paymentComplete";
	}
	
	// 로그인한 회원 id로 주문 된 내역을 불러와 보여줌. 기본 3개월.
	@RequestMapping("/orderHistory.do")
	public void orderHistory(HttpSession session, OrderListVO ol, Model m) {
		String customer_id = (String)session.getAttribute("login");  
		ol.setCustomer_id(customer_id);
		
		List<OrderListVO> orderHistory = orderService.orderHistoryViewDefault(ol);
		m.addAttribute("orderHistory",orderHistory);
	};
	// 주문 내역. 오늘 클릭 시
	@RequestMapping("/orderHistoryViewToday.do")
	@ResponseBody
	public List<OrderListVO> orderHistoryViewToday(HttpSession session, OrderListVO ol) {
		String customer_id = (String) session.getAttribute("login");
		ol.setCustomer_id(customer_id);
		
		List<OrderListVO> data = orderService.orderHistoryViewToday(ol);
		return data;
	}
	// 주문 내역. 1주일 클릭 시
	@RequestMapping("/orderHistoryView1week.do")
	@ResponseBody
	public List<OrderListVO> orderHistoryView1week(HttpSession session, OrderListVO ol) {
		String customer_id = (String) session.getAttribute("login");
		ol.setCustomer_id(customer_id);
		
		List<OrderListVO> data = orderService.orderHistoryView1week(ol);
		return data;
	}
	// 주문 내역. 1개월 클릭 시
	@RequestMapping("/orderHistoryView1month.do")
	@ResponseBody
	public List<OrderListVO> orderHistoryView1month(HttpSession session, OrderListVO ol) {
		String customer_id = (String) session.getAttribute("login");
		ol.setCustomer_id(customer_id);
		
		List<OrderListVO> data = orderService.orderHistoryView1month(ol);
		return data;
	}
	// 주문 내역. 3개월 클릭 시
	@RequestMapping("/orderHistoryViewDefault.do")
	@ResponseBody
	public List<OrderListVO> orderHistoryViewDefault(HttpSession session, OrderListVO ol) {
		String customer_id = (String) session.getAttribute("login");
		ol.setCustomer_id(customer_id);
		
		List<OrderListVO> data = orderService.orderHistoryViewDefault(ol);
		return data;
	}
	// 주문 내역. 6개월 클릭 시
	@RequestMapping("/orderHistoryView6months.do")
	@ResponseBody
	public List<OrderListVO> orderHistoryView6months(HttpSession session, OrderListVO ol) {
		String customer_id = (String) session.getAttribute("login");
		ol.setCustomer_id(customer_id);
		
		List<OrderListVO> data = orderService.orderHistoryView6months(ol);
		return data;
	}

}
