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

}
