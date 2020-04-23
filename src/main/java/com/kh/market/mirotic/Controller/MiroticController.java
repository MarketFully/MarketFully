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
							) {
		
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
		
		return "cartList";
	}
	
	
	//결제 버튼을 누르면 주문 내역들을 db에 입력하고 주문번호를 리턴해준다.
	@RequestMapping("insertMirotic")
	@ResponseBody
	public int insertMirotic(ModelAndView mv
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
				System.out.println(i+"번째 주문 회원번호 세팅"+mrtList.get(i).getMem_num());
			}//for
		}//if
		
		result = mrtService.insertMiroticList(mrtList); 
		
		int order_val = mrtService.selectOneMirotic(mrtList.get(0));
		
		System.out.println("주문번호 order_val : " + order_val);
		
		mv.addObject("mrtList",mrtList);
		
		return order_val;
	}
	
	
	//결제가 완료되면 db에 입금완료 처리를 해준다.
	@RequestMapping("successPayment")
	@ResponseBody
	public String successPayment(ModelAndView mv
					, HttpSession session
					, String or_status
			) {
		
		System.out.println("or_status : "+or_status);
		
		ArrayList<Mirotic> mrtList = (ArrayList<Mirotic>) session.getAttribute("mrtList");
		
		System.out.println("mrtList : "+mrtList);
				
		int result = 0;
		if(or_status.equals("success")){
			for(Mirotic mrt : mrtList) {
				result = mrtService.updateMiroticSuccess(mrt);
			}//for
		}//if
		
		return "주문해주셔서 감사합니다.";
	}
	
	
	@RequestMapping("miroticView")
	public String miroticView(ModelAndView mv) {
		return "mirotic/miroticPage";
	}
	
}
