package com.kh.market.mirotic.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.member.model.vo.Member;
import com.kh.market.member.model.vo.MyBag;
import com.kh.market.mirotic.model.service.MiroticService;
import com.kh.market.mirotic.model.vo.Mirotic;
import com.kh.market.mirotic.model.vo.SHIPPING;
import com.kh.market.mirotic.model.vo.totalPrice;

@Controller
@SessionAttributes("mrtList")
public class MiroticController {
	
	@Autowired
	private MiroticService mrtService;
	
	
	//장바구니에서 주문페이지로 넘어올때 변경되는 물품들을 db에 저장 
	@RequestMapping("updateCart")
	@ResponseBody
	public String updateCart(ModelAndView mv
								, HttpSession session
								, @RequestBody ArrayList<MyBag> cartList
								, totalPrice tp							) {
		
		System.out.println("------miroticView--------");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println("loginUser : "+ loginUser);
		System.out.println("list  : "+cartList);
	
		
		int result=0;
		if(loginUser != null) { //회원이면 db에 업데이트 해준다.
			System.out.println("회원입니다. : "+loginUser);
			for(MyBag mybag : cartList) {
				mybag.setMem_num(loginUser.getMem_num());
				System.out.println("db작업 : "+mybag);
				result += mrtService.updateCartlist(mybag);
			}
			System.out.println("result : "+result);
		}
		
		mv.addObject("cartList", cartList);
		mv.addObject("tp", tp);
		
		return "cartList";
	}
	
	
	//결제 버튼을 누르면 주문 내역들을 db에 입력하고 주문번호를 리턴해준다.
	@RequestMapping("insertMirotic")
	@ResponseBody
	public String insertMirotic(ModelAndView mv
				, HttpSession session
				, @RequestBody ArrayList<Mirotic> mrtList ) {
		
		System.out.println("---insertMirotic--------");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		//회원인 경우
	
		int result=0;
		
		if(loginUser !=null) {//회원인 경우 멤버 번호 추가
			System.out.println("회원 정보 : "+ loginUser);
			for(int i=0; i<mrtList.size(); i++){
				mrtList.get(i).setMem_num(loginUser.getMem_num());
				System.out.println(i+"번째 회원번호 세팅"+mrtList.get(i).getMem_num());
			}//for
		}//if
		
		
		result = mrtService.insertMiroticList(mrtList);
		System.out.println("result : "+ result);
		System.out.println("mrtList : "+ mrtList);
//		int order_val = mrtService.selectOneMirotic(mrtList.get(0));
//		System.out.println("주문번호 order_val : " + order_val);
		
		mv.addObject("mrtList",mrtList);
		
		String orderVal = ""+result;
		
		
		
		return orderVal;
	}
	
	
	//결제가 완료되면 db에 입금완료 처리를 해준다.
	@RequestMapping("successPayment")
	@ResponseBody
	public String successPayment(ModelAndView mv
					, HttpSession session
					, SHIPPING shipping
			) {
		
		System.out.println("success Payment");
		
		System.out.println("shpping : "+shipping);
		
		ArrayList<Mirotic> mrtList = (ArrayList<Mirotic>) session.getAttribute("mrtList");
		
		System.out.println("mrtList : "+mrtList);
		
		//주문 테이블 업데이트 입금확인 업데이트
		int result = 0;
		for(Mirotic mrt : mrtList) {
			result += mrtService.updateMiroticSuccess(mrt);
			if(result<0) {
				return "주문이 완료되지 않았습니다. 관리자에게 문의하세요";
			}//if
		}//for
		System.out.println("갱신된 주문 테이블 수 : "+result);
		
		result = mrtService.insertShipping(shipping);
		
		return "주문해주셔서 감사합니다.";
		
		
		
	}
	
	
	@RequestMapping("miroticView")
	public String miroticView(ModelAndView mv) {
		return "mirotic/miroticPage";
	}
	
}
