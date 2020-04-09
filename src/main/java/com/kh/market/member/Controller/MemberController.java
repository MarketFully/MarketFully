package com.kh.market.member.Controller;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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

	// 로그인1
	@RequestMapping(value="login.do",method= RequestMethod.POST) 
	public String memberLogin(Member m , Model model) {
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:index.jsp";
		}else {
			model.addAttribute("msg", "로그인실패!!");
			model.addAttribute("url","login");
			return "member/loginfail";
			
		}
	}

	//로그인2
	@RequestMapping("login")
	public String loginView() { // 회원가입 페이지로 이동하는 메소드

		return "member/login";
	}
	
	// 로그아웃
	@RequestMapping("logout.do")
	public String logut(SessionStatus status) {
		status.setComplete();
		
		return "redirect:index.jsp";
	}
	
	/**
	 * 아이디 중복 체크
	 * @param id
	 * @param response
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping("idCheck.do")
	public String idCheck(String MEM_ID) throws IOException{
		int result = mService.idCheck(MEM_ID);
		
		if(result > 0) {
			return "fail";
		}else {
			return "ok";
		}
	}
	
	// 비밀번호 체크
	@ResponseBody
	@RequestMapping(value="pwCheck.do", method = RequestMethod.POST)
	public boolean PwCheck(String MEM_PWD) {
		logger.info("PwCheck");
		
		boolean check = false;
		
		String pw_chk = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[$@$!%*?&`~'\"+=])[A-Za-z[0-9]$@$!%*?&`~'\"+=]{6,18}$";
		
		Pattern pattern_symbol = Pattern.compile(pw_chk);
		Matcher matcher_symbol = pattern_symbol.matcher(MEM_PWD);
		
		if(matcher_symbol.find()) {
			check = true;
		}
		return check;

	}

	
	// 회원가입
	@RequestMapping("regist")
	public String registView() { // 회원가입 페이지로 이동하는 메소드

		return "member/regist";
	}
	
	@RequestMapping("minsert.do")
	public String insertMember(Member m, Model model,
							   @RequestParam("post")String post,
							   @RequestParam("address1") String address1,
							   @RequestParam("address2") String address2) {
	
		System.out.println(m);
		System.out.println(post+","+address1+"," +address2);
		
		if(!post.equals("")) {
			m.setMEM_ADDR(post+","+address1+"," +address2);
		}
		
		int result = mService.insertMember(m);
		
		
		if(result > 0) {
			return "redirect:index.jsp";
		}else {
			model.addAttribute("msg","회원가입 실패");
			return "";
		}
		
	}
	
	
	// 회원 정보 수정
	@RequestMapping(value="mupdate.do",method=RequestMethod.POST )
	public String memberUpdate(Member m,Model model) {
		System.out.println(m);
		int result = mService.updateMember(m);
		
		if(result > 0) {			 
			Member loginUser = mService.loginMember(m);
			model.addAttribute("loginUser", loginUser);
			return "member/informationchange";
		}else {
			model.addAttribute("msg","회원 정보 수정 실패!");
			return "common/errorPage";
		}
	}
	
	
	// 회원 탈퇴
	@RequestMapping("mdelete.do")
	public String memberDelete(String id, Model model) {
		int result = mService.deleteMember(id);
		
		if(result > 0) {
			return "redirect:logout.do";
		}else {
			model.addAttribute("msg","회원 탈퇴 실패!!");
			return "common/errorPage";
		}
		
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
