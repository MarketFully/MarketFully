package com.kh.market.member.Controller;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.member.model.service.MailService;
import com.kh.market.member.model.service.MemberService;
import com.kh.market.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MailService mailsender;

//	@RequestMapping("login")
//	public String loginView() { // 로그인 페이지로 이동하는 메소드
//
//		return "member/login";
//	}

	// 로그인1
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String memberLogin(Member m, Model model) {

		Member loginUser = mService.loginMember(m);

		if (loginUser != null) {
			if (loginUser.getMem_cert().equals("Y")) {
				model.addAttribute("loginUser", loginUser);
				return "redirect:index.jsp";
			} else {
				model.addAttribute("mem_id", loginUser.getMem_id());
				model.addAttribute("mem_email", loginUser.getMem_email());
				return "member/mailsendFail";
			}
		} else {
			model.addAttribute("msg", "로그인실패!!");
			return "";
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
	public String idCheck(String mem_id) throws IOException{
		int result = mService.idCheck(mem_id);
		
		if(result > 0) {
			return "fail";
		}else {
			return "ok";
		}
	}
	
	// 비밀번호 체크
	@ResponseBody
	@RequestMapping(value="pwCheck.do", method = RequestMethod.POST)
	public boolean PwCheck(String mem_pwd) {
		logger.info("PwCheck");
		
		boolean check = false;
		
		String pw_chk = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[$@$!%*?&`~'\"+=])[A-Za-z[0-9]$@$!%*?&`~'\"+=]{6,18}$";
		
		Pattern pattern_symbol = Pattern.compile(pw_chk);
		Matcher matcher_symbol = pattern_symbol.matcher(mem_pwd);
		
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
							   @RequestParam("address2") String address2,
							   HttpServletRequest request) {
	
		System.out.println(m);
		System.out.println(post+","+address1+"," +address2);
		
		if(!post.equals("")) {
			m.setMem_addr(post+","+address1+"," +address2);
		}
		
		int result = mService.insertMember(m);
		
		
		if(result > 0) {
			return mailSend(m,model,request);

		}else {
			model.addAttribute("msg","회원가입 실패");
			return "";
		}
		
	}
	
	// 회원가입 메일 인증1
		@RequestMapping(value="sinsert.do", method = RequestMethod.POST)
		public String mailSend(Member m, Model model, HttpServletRequest request) {
			//(m.getMEM_EMAIL(),m.getMEM_ID(),request);
			mailsender.mailSendWithUserKey(m.getMem_email(),m.getMem_id(),request);
			
			return "redirect:index.jsp";
		}
		
		// 회원가입 메일 인증2
		@RequestMapping(value = "registSuccess" , method = RequestMethod.GET)
		public String registSuccess(@RequestParam("user_id")String mem_id) { 
					
			System.out.println(mem_id);
			
			Member loginUser = mService.changeMemcert(mem_id);
			
			return "member/registSuccess";
		}
		
		
		// 이메일 재인증
		@RequestMapping(value="rsinsert.do", method = RequestMethod.GET)
		public String mailreSend(@RequestParam("mem_id") String mem_id,
								 @RequestParam("mem_email") String mem_email,
								 Model model, HttpServletRequest request) {
			
			mailsender.mailSendWithUserKey(mem_email,mem_id,request);
			
			return "redirect:index.jsp";
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
	public String memberDelete(String id, Model model, SessionStatus status) {
		
		System.out.println("@@@@@@@@@ id : " + id);
		int result = mService.deleteMember(id);
		
		if(result > 0) {
			System.out.println("로그아웃 성공");
			status.setComplete();
//			return "redirect:logout.do";
			return "home";
		}else {
			model.addAttribute("msg","회원 탈퇴 실패!!");
			return "common/errorPage";
		}
		
	}
	
	// 아이디 찾기(페이지)
		@RequestMapping("idfind")
		public String idfindView() { 

			return "member/idfind";
		}
		
		
		// 아이디 찾기
		@RequestMapping("idfind.do")
		public ModelAndView idfind(@ModelAttribute Member m)throws Exception{
			
			System.out.println(m);
			ModelAndView mav = new ModelAndView();
			Member userList = mService.idfind(m);

			
			
			if(userList!=null) {
			System.out.println(userList);
			mav.setViewName("member/idfindSuccess");
			mav.addObject("idfind",userList);
			
			return mav;
			
			}else {
			System.out.println(userList);
			mav.setViewName("member/idfindFail");
			
			return mav;
				
			}
			
		}
		
		
		// 비밀번호 찾기 페이지
		@RequestMapping("pwdfind")
		public String pwdfindView() {

			return "member/pwdfind";
		}
		
		
		// 비밀번호 찾기 (값 일치여부)
		@RequestMapping("pwdfind.do")
		public ModelAndView pwdfind(@ModelAttribute Member m ,HttpServletRequest request)throws Exception{
			
			System.out.println(m);
			ModelAndView mav = new ModelAndView();
			Member userList = mService.pwdfind(m);
			
			if(userList != null) {
				System.out.println(userList);
				mav.setViewName("member/pwdfindconfirm");
				mav.addObject("pwdfind",userList);
				mailsender.mailsendWithPassword(m.getMem_name(),m.getMem_id(),m.getMem_email(),request);
				
				return mav;
			}else {
				
				mav.setViewName("member/pwdfindFail");
				return mav;
			}
			
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
