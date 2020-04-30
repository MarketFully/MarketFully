package com.kh.market.mirotic.Controller;

import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.member.model.service.MemberService;
import com.kh.market.member.model.vo.Member;
import com.kh.market.member.model.vo.MyBag;
import com.kh.market.mirotic.model.service.MiroticService;
import com.kh.market.mirotic.model.vo.Mirotic;
import com.kh.market.mirotic.model.vo.SHIPPING;
import com.kh.market.mirotic.model.vo.totalPrice;

@Controller
@SessionAttributes({"mrtList","cartList"})
public class MiroticController {
	
	@Autowired
	private MiroticService mrtService;
	
	@Autowired
	private MemberService mService;
	
	//장바구니에서 주문페이지로 넘어올때 변경되는 물품들을 db에 저장 
	@RequestMapping("updateCart")
	@ResponseBody
	public ModelAndView updateCart(ModelAndView mv
								, HttpSession session
//								, @RequestBody ArrayList<MyBag> cartList
								, String pr_code, String pr_each
								, totalPrice tp							) {
		
		System.out.println("------updateCart--------");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println("loginUser : "+ loginUser);
//		System.out.println("list  : "+cartList);
		System.out.println("pr_code : "+ pr_code + ", pr_each : "+ pr_each);
	
		ArrayList<MyBag> cartList = new ArrayList<MyBag>();
		
		String[] pcode = pr_code.split(",");
		String[] peach = pr_each.split(",");
		
		
		
		for(int i=0; i<pcode.length;i++) {
			MyBag mybag = new MyBag();
			mybag.setMem_num(loginUser.getMem_num());
			mybag.setPr_code(Integer.parseInt(pcode[i]));
			mybag.setPr_each(Integer.parseInt(peach[i]));
			mybag.setPrd(mService.OneProduct(Integer.parseInt(pcode[i])));
			
			cartList.add(mybag);
			
		}
		
		
		
		
		System.out.println("cartList : "+cartList);
		
		mv.addObject("cartList",cartList).setViewName("mirotic/miroticPage");
		
		return mv;
		
//		
//		int result=0;
//		if(loginUser != null) { //회원이면 db에 업데이트 해준다.
//			System.out.println("회원입니다. : "+loginUser);
//			for(MyBag mybag : cartList) {
//				mybag.setMem_num(loginUser.getMem_num());
//				System.out.println("db작업 : "+mybag);
//				result += mrtService.updateCartlist(mybag);
//			} //for
//			System.out.println("result : "+result);
//		}else {
//			for(MyBag mybag : cartList) {
//				mService.updateListProduct(mybag);	
//			}//for
//		}//else
//		
//		System.out.println("담기는 cartList : "+ cartList);
//		System.out.println("담기는 total tp : "+ tp);
//		
////		mv.addObject("cartList", cartList);
//		
//		session.setAttribute("cartList", cartList);
//		mv.addObject("tp", tp);
//		
//		return "cartList";
	}
	
	@RequestMapping("miroticView1")
	public String miroticView(ModelAndView mv,HttpSession session) {
		
		ArrayList<MyBag> cartList = null;
		cartList = (ArrayList)session.getAttribute("cartList");
		System.out.println("---------miroticView1----------------");
		System.out.println("cartList : "+ cartList);
		
		return "mirotic/miroticPage";
	}
	
	
	//결제 버튼을 누르면 주문 내역들을 db에 입력하고 주문번호를 리턴해준다.
	@RequestMapping("insertMirotic")
	@ResponseBody
	public String insertMirotic(ModelAndView mv
				, HttpSession session
				, @RequestBody ArrayList<Mirotic> mrtList ) {
		
		System.out.println("---insertMirotic--------");
		System.out.println("받아온 mrtList : "+mrtList);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		//결제 성공시 세션에 있는 cartList(현재 주문중인 장바구니)를 비워준다.
		ArrayList<MyBag> cartList = (ArrayList<MyBag>) session.getAttribute("cartList");
		for(MyBag mybag : cartList) {
			mService.deleteMybag(mybag);
		}
		
		
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
					, @ModelAttribute("loginUser") Member loginUser
					, SHIPPING shipping
			) {
		
		System.out.println("success Payment");
		
		System.out.println("shpping : "+shipping);
		
		ArrayList<Mirotic> mrtList = mrtService.selectListMirotic(shipping);
		
		System.out.println("mrtList update : " + mrtList);
		
		//주문 테이블 업데이트 입금확인 업데이트
		int result = 0;
		for(Mirotic mrt : mrtList) {
			result += mrtService.updateMiroticSuccess(mrt);
		}//for
		
		System.out.println("갱신된 주문 테이블 수 : "+result);
		
		result = mrtService.insertShipping(shipping);
		
		return "주문해주셔서 감사합니다.";
		
		
		
	}
	
	
	
	@RequestMapping("miroticView")
	@ResponseBody
	public String miroticView(ModelAndView mv, @RequestBody ArrayList<MyBag> cartList, MyBag mybag, HttpSession session) {
		
		System.out.println("---------miroticView---------------");
		System.out.println("cartList : "+cartList);
		System.out.println("mybag : "+mybag);
		System.out.println("cartList.isEmpty : "+cartList.isEmpty());
		
		System.out.println("session cartList : "+session.getAttribute("cartList"));
		
		if(cartList.isEmpty()) {
			cartList.add(mybag);
		}//if
		
		
		
		mv.addObject("cartList", cartList);
		mv.setViewName("mirotic/miroticPage");
		
		System.out.println("return cartList");
		
		return "cartList";
	}
	
	@RequestMapping("productMirotic")
	public ModelAndView productMirotic(ModelAndView mv
						, MyBag mybag
						, HttpSession session) {
		
		System.out.println("-------productMirotic--------------");
		System.out.println("mybag : "+mybag);
		ArrayList<MyBag> cartList = new ArrayList<MyBag>();
		
		mybag.setPrd(mService.selectOneProduct(mybag.getPr_code()));
		
		System.out.println("after mybag.setPrd "+ mybag);
		
		cartList.add(mybag);
		
		System.out.println("cartList push mybag : "+ cartList);
		mv.addObject("cartList",cartList);
		mv.setViewName("mirotic/miroticPage");
		
		return mv;
		
	}//productMiroticx
	
}
