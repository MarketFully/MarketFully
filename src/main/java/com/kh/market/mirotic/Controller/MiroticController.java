package com.kh.market.mirotic.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
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
		
		
		Member loginUser = (Member)session.getAttribute("loginUser");
	
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
		
		
		
		
		
		mv.addObject("cartList",cartList).setViewName("mirotic/miroticPage");
		
		return mv;
		
//		
//		int result=0;
//		if(loginUser != null) { //회원이면 db에 업데이트 해준다.
//			for(MyBag mybag : cartList) {
//				mybag.setMem_num(loginUser.getMem_num());
//				result += mrtService.updateCartlist(mybag);
//			} //for
//		}else {
//			for(MyBag mybag : cartList) {
//				mService.updateListProduct(mybag);	
//			}//for
//		}//else
//		
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
	
		mv.addObject("cartList", cartList);
		
		return "mirotic/miroticPage";
	}
	
	
	//결제 버튼을 누르면 주문 내역들을 db에 입력하고 주문번호를 리턴해준다.
	@RequestMapping("insertMirotic")
	@ResponseBody
	public String insertMirotic(ModelAndView mv
				, HttpSession session
				, @RequestBody ArrayList<Mirotic> mrtList ) {
		
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		//결제 성공시 세션에 있는 cartList(현재 주문중인 장바구니)를 비워준다.
		ArrayList<MyBag> cartList = (ArrayList<MyBag>) session.getAttribute("cartList");
		for(MyBag mybag : cartList) {
			mService.deleteMybag(mybag);
		}
		
		
		//회원인 경우
	
		int result=0;
		
		if(loginUser !=null) {//회원인 경우 멤버 번호 추가
			for(int i=0; i<mrtList.size(); i++){
				mrtList.get(i).setMem_num(loginUser.getMem_num());
			}//for
		}//if
		
		
		result = mrtService.insertMiroticList(mrtList);
//		int order_val = mrtService.selectOneMirotic(mrtList.get(0));
		
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
		
		
		
		ArrayList<Mirotic> mrtList = mrtService.selectListMirotic(shipping);
		
		
		
		//주문 테이블 업데이트 입금확인 업데이트
		int result = 0;
		for(Mirotic mrt : mrtList) {
			result += mrtService.updateMiroticSuccess(mrt);
		}//for
		
		
		//결제 성공시 세션에 있는 cartList(현재 주문중인 장바구니)를 비워준다.
		ArrayList<MyBag> cartList = (ArrayList<MyBag>) session.getAttribute("cartList");
		for(MyBag mybag : cartList) {
			mService.deleteMybag(mybag);
		}
		
		
		
		
		result = mrtService.insertShipping(shipping);
		
		return "주문해주셔서 감사합니다.";
		
		
		
	}
	
	
	
	@RequestMapping("miroticView")
	
	public void miroticView(ModelAndView mv, @RequestBody ArrayList<MyBag> cartList, MyBag mybag, HttpSession session
			, HttpServletResponse response
			) throws JsonIOException, IOException {

		if(cartList.isEmpty()) {
			System.out.println(("cartList is empty!!!"));
			cartList.add(mybag);
		}//if
		
		//만약 mybag이 비었으면 cartList안 각각의 mybag객체안에 product값들을 setPrd해줘야 한다. 
		
					
		mv.addObject("cartList", cartList);
		mv.setViewName("mirotic/miroticPage");
		
		
		new Gson().toJson(cartList,response.getWriter());
		
	}
	
	@RequestMapping("productMirotic")
	public ModelAndView productMirotic(ModelAndView mv
						, MyBag mybag
						, HttpSession session) {
		
		ArrayList<MyBag> cartList = new ArrayList<MyBag>();
		
		mybag.setPrd(mService.selectOneProduct(mybag.getPr_code()));
		
		
		cartList.add(mybag);
		
		mv.addObject("cartList",cartList);
		mv.setViewName("mirotic/miroticPage");
		
		return mv;
		
	}//productMiroticx

	
	@RequestMapping("recipeMirotic")
	public ModelAndView recipeMirotic(ModelAndView mv
			, String pr_code 
			, String pr_each
			, HttpSession session) {
		
		System.out.println("recipeMirotic-----------");
//		System.out.println("mybag : " + mybag);
		
		System.out.println("pr_code : "+pr_code);
		System.out.println("pr_each : "+pr_each);
		
		String[] pcode = pr_code.split(",");
		String[] peach = pr_each.split(",");
		
		
		ArrayList<MyBag> cartList = new ArrayList<MyBag>();
		
		
		for(int i=0; i<pcode.length; i++) {
			MyBag mybag = new MyBag();
			mybag.setPr_code(Integer.parseInt(pcode[i]));
			mybag.setPr_each(Integer.parseInt(peach[i]));
			mybag.setPrd(mService.selectOneProduct(Integer.parseInt(pcode[i])));
			System.out.println("mybag : "+ mybag);
			
			cartList.add(mybag);
		}//for
		
		System.out.println("cartList : "+ cartList);
		
		mv.addObject("cartList",cartList);
		mv.setViewName("mirotic/miroticPage");
		
		return mv;
		
	}//productMiroticx
	
}
