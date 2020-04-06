package com.kh.market.member.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.market.member.model.service.MemberService;
import com.kh.market.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);

//	@RequestMapping("login")
//	public String loginView() { // 로그인 페이지로 이동하는 메소드
//
//		return "member/login";
//	}

	@RequestMapping(value="login.do",method= RequestMethod.POST) 
	public String memberLogin(Member m , Model model) {
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:index.jsp";
		}else {
			model.addAttribute("msg", "로그인실패!!");
			return "";
		}
	}

	@RequestMapping("login")
	public String loginView() { // 회원가입 페이지로 이동하는 메소드

		return "member/login";
	}
	
	
	
	@RequestMapping("regist")
	public String registView() { // 회원가입 페이지로 이동하는 메소드

		return "member/regist";
	}

	@RequestMapping("pwdfind")
	public String pwdfindView() { // 비밀번호 찾기  페이지로 이동하는 메소드

		return "member/pwdfind";
	}

	@RequestMapping("idfind")
	public String idfindView() { // 아이디 찾기 페이지로 이동하는 메소드

		return "member/idfind";
	}
	
	@RequestMapping("basket")
	public String basketView() { // 장바구로 이동하는 메소드

		return "member/basket";
	}
	
	@RequestMapping("mypageorder")
	public String mypageordertView() { // 마이페이지 주문내역으로 이동하는 메소드(마이페이지 첫화면)

		return "member/mypageorder";
	}
	
	@RequestMapping("mypagereview")
	public String mypagereviewView() { // 마이페이지 상품후기로 이동하는 메소드

		return "member/mypagereview";
	}
	
	@RequestMapping("mypagepoint")
	public String mypagepointView() { // 마이페이지 적립금으로 이동하는 메소드

		return "member/mypagepoint";
	}
	
	@RequestMapping("mypageloverecipe")
	public String mypageloverecipeView() { // 마이페이지 찜한레시피로 이동하는 메소드

		return "member/mypageloverecipe";
	}
	
	@RequestMapping("mypagechange")
	public String mypagechange() { // 마이페이지 개인정보수정으로 이동하는 메소드

		return "member/mypagechange";
	}
	
	@RequestMapping("orderdetail")
	public String orderdetailView() { // 마이페이지 주문내역상세로 이동하는 메소드

		return "member/orderdetail";
	}
	
	@RequestMapping("reviewinsert")
	public String reviewinsertView() { // 마이페이지 리뷰작성으로 이동하는 메소드

		return "member/reviewinsert";
	}
	
	@RequestMapping("informationchange")
	public String informationchangeView() { // 마이페이지 개인정보수정 디테일로 이동하는 메소드

		return "member/informationchange";
	}

}
