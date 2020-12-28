package spring.mvc.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import spring.mvc.domain.CustomerVO;
import spring.mvc.domain.QnaVO;
import spring.mvc.domain.ReviewVO;
import spring.mvc.service.CustomerService;

@Controller
public class CustomerController {
   
   @Autowired
   private CustomerService customerserive;
   
   @RequestMapping(value="/idCheck.do",produces="application/text;charset=utf-8")
   @ResponseBody
   public String idCheck(CustomerVO vo) {
      CustomerVO result = customerserive.idCheck_Login(vo);
      String message = "이미 사용중인 아이디입니다.";
      if(result==null) {
         message="사용가능합니다.";
      }
      return message;
   }
   
   
   
   // 로그인 하기
   @RequestMapping(value="/logingo.do",produces = "application/text;charset=utf-8")
   @ResponseBody
   public String login(CustomerVO vo, HttpSession session) {
   CustomerVO result = customerserive.login(vo);
   
   if(result==null || result.getCustomer_id()==null) {
         return "0"; 
   }else {
      session.setAttribute("login", result.getCustomer_id());   
         return "1";
      }
   }
   
   // mainAfterLogin.jsp 에서 로그아웃 클릭 시 session 값 삭제 후 main.jsp 이동
   @RequestMapping("/logout.do")
   public String logout(HttpSession session) {
        session.removeAttribute("login");
      return "redirect:/main.jsp";
   } // ----- end of logout.do
   
   
   // 회원가입하기
   @RequestMapping(value="/joingo.do",produces = "application/text;charset=utf-8")
   @ResponseBody
   public String join(CustomerVO vo) {
      int result = customerserive.insertCustomer(vo);
      if(result==1)  return "1";
      return "0";
   }
   
   // 평점높은순
   @RequestMapping(value="/highrate.do",produces = "application/text;charset=utf-8")
   @ResponseBody
   public String highrate(ReviewVO vo, String orderby) {
      HashMap map = new HashMap<String, Object>();
      map.put("prod_no",vo.getProd_no());
      map.put("orderbyy",orderby );
   
      List<ReviewVO> list = customerserive.selecthighrate(map);
      
      //JSONObject obj = new JSONObject();
      
      JSONArray jsonArray = new JSONArray();
      for(int i =0;i<list.size();i++) {
         JSONObject listobj = new JSONObject();
         listobj.put("customer_id", list.get(i).getCustomer_id());
         listobj.put("gender", list.get(i).getGender());
         listobj.put("skintype", list.get(i).getSkintype());
         listobj.put("rate", list.get(i).getRate());
         if(Integer.parseInt(list.get(i).getWriteday())>=24) {
        	int hourday= Integer.parseInt(list.get(i).getWriteday())/24;
        	 listobj.put("writeday", hourday+"일");
         }else {
         listobj.put("writeday", list.get(i).getWriteday()+"시간");
         }
         listobj.put("contents", list.get(i).getContents());
         jsonArray.add(listobj);
      }
      return jsonArray.toString();
   }
   
   //문의하기 작성
   @RequestMapping(value="/qnawrite.do", produces = "application/text;charset=utf-8")
   @ResponseBody
   public String  qnawirte(QnaVO vo, HttpSession session) {
	   vo.setCustomer_id((String)session.getAttribute("login"));
	   
	   String result = String.valueOf(customerserive.insertqna(vo));
	   return result;
   }
   
   //후기 작성
   @RequestMapping(value="/reviewWrite.do",produces ="application/text;charset=utf-8" )
   @ResponseBody
   public String reviewwrite(ReviewVO vo,HttpSession session) {
	   vo.setCustomer_id((String)session.getAttribute("login"));
	   int result = customerserive.insertreview(vo);
	   String message="입력 오류";
	   if(result==1) {
		  message = "소중한 후기 감사합니다^^";
	   }
	   
	 return message;
   }
   
   

   
   
}