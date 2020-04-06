package com.kh.market.member.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("login")
	public String loginView() { // 로그인 페이지로 이동하는 메소드

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
