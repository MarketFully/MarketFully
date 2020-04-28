package com.kh.market.member.Controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.market.common.Pagination_Myloverecipe;
import com.kh.market.common.Pagination_Myorder;
import com.kh.market.member.model.service.MailService;
import com.kh.market.member.model.service.MemberService;
import com.kh.market.member.model.vo.Favorite;
import com.kh.market.member.model.vo.Member;
import com.kh.market.member.model.vo.MyBag;
import com.kh.market.member.model.vo.MypageOrderPageInfo;
import com.kh.market.member.model.vo.MypageloverecipePageInfo;
import com.kh.market.mirotic.model.vo.Mirotic;
import com.kh.market.product.model.vo.ProductReview;

@SessionAttributes({"loginUser","cartList"})
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
				System.out.println("------------------------login.do-------------------");
				model.addAttribute("loginUser", loginUser);
				ArrayList<MyBag> cartList = mService.selectListProduct(loginUser);
				System.out.println("cartList : "+ cartList);
				model.addAttribute("cartList", cartList);
				System.out.println("login 성공");
				return "redirect:index.jsp";
			} else {
				model.addAttribute("mem_id", loginUser.getMem_id());
				model.addAttribute("mem_email", loginUser.getMem_email());
				return "member/mailsendFail";
			}
		} else {
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
		
	@RequestMapping("myCart")
	@ResponseBody
	public String insertCart(
					@RequestParam(value="prcodeArr[]")List<String> prcodeArr
					, @RequestParam(value="prnameArr[]")List<String> prnameArr
					, @RequestParam(value="prpriceArr[]")List<String> prpriceArr
					, @RequestParam(value="preachArr[]")List<String> preachArr
					, Model m
					, HttpSession session
				
			) { // 장바구로 이동하는 메소드

		System.out.println("-------myCart (insertCart)----------");
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//데이터 확인
//		System.out.println("bTitle :"+bTitle+", bId : "+bId);
//		System.out.println("prcodeArr : "+prcodeArr);
//		System.out.println("prnameArr : "+prnameArr);
//		System.out.println("prpriceArr : "+prpriceArr);
//		System.out.println("preachArr : "+preachArr);
		System.out.println("loginUser : "+ loginUser);
		
		System.out.println("prcodeArr.size() : "+prcodeArr.size());
		System.out.println("prcodeArr.get(0) : "+ prcodeArr.get(0));
		System.out.println("Integer.parseInt(prcodeArr[i]) : "+ Integer.parseInt(prcodeArr.get(0)));
		
		
		ArrayList<MyBag> cartList = new ArrayList();
		int result =0;
		
		//로그인인 경우
		if(loginUser != null) {
			for(int i =0; i<prcodeArr.size(); i++) {
				MyBag mybag = new MyBag();
				mybag.setPr_code(Integer.parseInt(prcodeArr.get(i)));
				mybag.setPr_each(Integer.parseInt(preachArr.get(i)));
				mybag.setMem_num(loginUser.getMem_num());
				mybag.setPrd(mService.selectOneProduct(Integer.parseInt(prcodeArr.get(i))));
				cartList.add(mybag);
			} //for
			
			//db에 저장
			result = mService.setMyBagList(cartList);
			
		}else { //비로그인인 경우
			for(int i =0; i<prcodeArr.size(); i++) {
				MyBag mybag = new MyBag();
				mybag.setPr_code(Integer.parseInt(prcodeArr.get(i)));
				mybag.setPr_each(Integer.parseInt(preachArr.get(i)));
				mybag.setPrd(mService.selectOneProduct(Integer.parseInt(prcodeArr.get(i))));
				cartList.add(mybag);
				result+=1;
			}//for
		} //if else
		
		
		//작업완료후 결과 리턴
		
		
		String comment="";
		if(result > 0) {
			comment = "미션 success";
		}else {
			comment = "미션 fail";
		}//if else
		System.out.println("comment : "+ comment);
		
		System.out.println("cartList : " + cartList);
		
		m.addAttribute("cartList", cartList);
		
		return comment;
		
	}//insertCart
	
	
	//장바구니 비우기
	@ResponseBody
	@RequestMapping("clearMybag")
	public String clearMybag(ArrayList<MyBag> cartList) {
		
		int result=0;
		
		for(MyBag mybag : cartList) {
			result += mService.deleteMybag(mybag);
		}
		System.out.println("----- clearMybag------");
		System.out.println("result : "+ result);
		
		String comment="";
		
//		if(result >0) {
//			comment = "success";
//		}else {
//			comment = "fail";
//		}
		
		
		return comment;
	}
	
	
	@RequestMapping("selectDeleteMybag")
	@ResponseBody
	public String selectDeleteMybag(
			int me_num, int mb_bo_num, int pr_code
			,HttpSession session, Model m
			) {
		
		System.out.println("-----selectDeleteMybag--------------");
		System.out.println("me_num : "+ me_num);
		System.out.println("mb_bo_num : "+ mb_bo_num);
		System.out.println("pr_code : "+ pr_code);
		int result=0;
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		System.out.println("loginUser : "+ loginUser);
		
		MyBag mybag = new MyBag();
		mybag.setPr_code(pr_code);
		mybag.setMem_num(loginUser.getMem_num());
		
		System.out.println("mybag : "+ mybag);
		result = mService.selectDeleteMybag(mybag);
		
		String comment="";
		if(result>0) {
			comment="success";
		}else {
			comment="fail";
		}//if-else
		
		return "comment";
	}
	
	
	@RequestMapping("basket")
	public String basketView(HttpSession session, Model m) { // 장바구로 이동하는 메소드
		
		Member loginUser = (Member) session.getAttribute("loginUser");
//		m.addAttribute("cartList", loginUser.getClist());
		ArrayList<MyBag> cartList =null;
		if(loginUser != null) {
			cartList = mService.selectListProduct(loginUser);
		}else {
			//비회원 불가
			
			//////////////////////////////////////////////////////////////
//			cartList = (ArrayList)session.getAttribute("cartList");
//			for(MyBag mybag : cartList) {
//				mService.updateListProduct(mybag);	
//			}//for
			////////////////////////////////////////////////////////////////
		}//if else
		
		System.out.println("-----basket----------");
		System.out.println("loginUser : "+ loginUser);
//		System.out.println("cartList : "+loginUser.getClist());
		System.out.println("cartList : "+ cartList);
		
		m.addAttribute("loginUser", loginUser);
		m.addAttribute("cartList", cartList);
		
		return "member/basket";
	}
	
	// 마이페이지 주문 내역 리스트 페이지처리/ 목록
	@RequestMapping("myorderlist.bo")
	public ModelAndView myorderList(ModelAndView mv,
							@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,
							@RequestParam(value="mem_num", defaultValue="0") int mem_num,
							HttpSession session
			) {
				
		System.out.println(currentPage);
		
		if(mem_num == 0) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			mem_num = loginUser.getMem_num();
			System.out.println("mem_num : "+ mem_num);
		}
		
		int listCount = mService.getOrderListCount(mem_num);
		
		System.out.println("listCount : " + listCount);
		
		MypageOrderPageInfo pi = Pagination_Myorder.getPageInfo(currentPage,listCount);
		
		ArrayList<Mirotic> list = mService.selectOrderList(pi);
		
		ArrayList<Mirotic> listtemp = new ArrayList<Mirotic>(); // 새 저장 공간 형성  --1
		
		for(int i = 0 ; i < list.size(); i++) {// 전체 리스트를 가져와서
			if(list.get(i).getMem_num()==mem_num) { // 만약 전체 리스트의 i 번째와 너가 로그인페이지에서 가져온 mem_num이 일치할경우
				listtemp.add(list.get(i));	// --1 에서 임시로 만든 저장공간에 해당하는 i번쨰 데이터 add
			}
		}
		
		mv.addObject("list", listtemp);
		mv.addObject("pi", pi);
		mv.setViewName("member/mypageorder");
		
		return mv;
	}
	
	// 마이페이지 상품후기로 이동하는 메소드
	@RequestMapping("mypagereview")
	 public ModelAndView mypagereviewView(HttpSession session,ModelAndView mv) { 
		  
		  Member loginUser = (Member) session.getAttribute("loginUser");
		  
		  System.out.println("login : "+loginUser);
		  
		  ArrayList<Mirotic> mrtlist = mService.selectlistMirotic(loginUser);
		  
		  System.out.println("mrtlist : " + mrtlist);
		  
		  mv.addObject("mrtlist", mrtlist);
		  mv.setViewName("member/mypagereview");
		  
	  return mv;
	}
	
	// 마이페이지 작성완료 후기 삭제
	@RequestMapping("mypageReviewDelete")
	public String mypagereviewDelete(HttpServletRequest request, int re_num) {

		int result = mService.reviewDeleteList(re_num);

	 if(result > 0) {
		  return "redirect:mypagereview";
	  }else {
		  return null;
	  }
	}
	
	@RequestMapping("myreivewinsert")
	public String myreivewinsertView() { // 마이페이지 리뷰작성으로 이동하는 메소드
		 
		return "member/reviewinsert";
	}
	
	// 마이페이지 리뷰작성
	@RequestMapping(value="reviewinsert", method=RequestMethod.POST)
	public String reviewinsert(HttpSession session,HttpServletRequest request,
								ProductReview pr_re, @RequestParam(name="uploadFile",required=false) MultipartFile file) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		pr_re.setRe_writer(loginUser.getMem_name());
		pr_re.setMem_num(loginUser.getMem_num());
		
		
		System.out.println("####상품리뷰#####" + pr_re);
		
		if(!file.getOriginalFilename().equals("")) {
			String renameFileName = reviewsaveFile(file,request);
			
			if(renameFileName != null) {
				pr_re.setRe_orign(file.getOriginalFilename());
				pr_re.setRe_rename(renameFileName);
			}
		}
		System.out.println("리뷰 작성 :" + pr_re);
		
		int result = mService.reviewinsert(pr_re);
		
		if(result > 0) {
			return "redirect:mypagereview";
		}else {
			return "common/errorPage";
		}
	}
	
	// 마이페이지 리뷰 글작성 (파일)
	public String reviewsaveFile(MultipartFile file, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\reviewuploadFiles";

		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdir();
		}

		String orginFileName = file.getOriginalFilename();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ orginFileName.substring(orginFileName.lastIndexOf(".") + 1);

		System.out.println("renameFileName : " + renameFileName);

		String renamePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(renamePath));
		} catch (IOException e) {
			System.out.println("파일전송에러: " + e.getMessage());
		}

		return renameFileName;
	}
	
	@RequestMapping("mypagepoint")
	public String mypagepointView() { // 마이페이지 적립금으로 이동하는 메소드

		return "member/mypagepoint";
	}
	
	// 마이페이지 찜한레시피 페이징처리 / 목록 
	@RequestMapping("mypageloverecipe.bo")
	public ModelAndView myloverecipeList(ModelAndView mv,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,
			@RequestParam(value="mem_num") int mem_num) {

	System.out.println(currentPage);
	
	int listCount = mService.getRecipeListCount(mem_num);
	
	System.out.println("listCount : " + listCount);
	
	MypageloverecipePageInfo pi = Pagination_Myloverecipe.getPageInfo(currentPage,listCount);
	System.out.println(pi);
	
	Member m = new Member();
	m.setMem_num(mem_num);
	
	ArrayList<Favorite> flist = mService.selectRecipeList(m,pi);
	
	System.out.println(flist);
	listCount=0;
	for(int i = 0 ; i < flist.size();i++) {//TV게시판 갯수 증가
		if ((flist.get(i).getMe_num() == 1)  && (flist.get(i).getTboard().getMb_status().equals("Y")))
		{
			listCount++;
		}
	}
	
	for(int i = 0 ; i < flist.size();i++) {//유저 게시판 갯수 증가
		if ((flist.get(i).getMe_num() == 2)  && (flist.get(i).getUboard().getMb_status().equals("Y")))
		{
			listCount++;
		}
	}
	
	System.out.println(listCount);
	
	mv.addObject("flist", flist);
	mv.addObject("listCount",listCount);
	mv.addObject("pi",pi);
	mv.setViewName("member/mypageloverecipe");
	
	return mv;
	
	}
	
	// 마이페이지 찜한레시피 전체 삭제
	@RequestMapping(value="myrecipedelete.bo" ,method=RequestMethod.POST)
	@ResponseBody
	public String myloverecipeDelete(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value="mem_num") int mem_num) {
		
		int result = mService.deleteRecipeList(mem_num);
		
		String a="";
		if(result > 0) {
			System.out.println("찜한 레시피 전체삭제 성공");
			a="ok";
		}else {
			System.out.println("찜한 레시피 전체삭제 실패");
			a="no";
		}
		return a;
	}
	
	
	@RequestMapping(value="mypageheader.do" ,method=RequestMethod.POST)
	@ResponseBody
	public int mypageheaderCount(HttpServletRequest request,
			@RequestParam(value="mem_num") int mem_num) {
		
		Member m = new Member();
		m.setMem_num(mem_num);
		
		ArrayList<Favorite> flist = mService.selectRecipeList(m);
		
		System.out.println(flist);
		int listCount=0;
		for(int i = 0 ; i < flist.size();i++) {//TV게시판 갯수 증가
			if ((flist.get(i).getMe_num() == 1)  && (flist.get(i).getTboard().getMb_status().equals("Y")))
			{
				listCount++;
			}
		}
		
		for(int i = 0 ; i < flist.size();i++) {//유저 게시판 갯수 증가
			if ((flist.get(i).getMe_num() == 2)  && (flist.get(i).getUboard().getMb_status().equals("Y")))
			{
				listCount++;
			}
		}
		
		return listCount;
	}
	
	
	// 마이페이지 찜한레시피 선택 삭제
	@RequestMapping(value="myrecipeonedelete.bo",method=RequestMethod.POST)
	@ResponseBody
	public String myloverecipeOneDelete(ModelAndView mv,HttpServletRequest request,Favorite f)
			{
		
		int result = mService.oneDeleteRecipeList(f);
		
		String a="";
		if(result > 0) {
			System.out.println("찜한 레시피 선택삭제 성공");
			a="ok";
		}else {
			System.out.println("찜한 레시피 선택삭제 실패");
			a="no";
		}
		return a;
	}
	
	@RequestMapping("mypagechange")
	public String mypagechange() { // 마이페이지 개인정보수정으로 이동하는 메소드

		return "member/mypagechange";
	}
	
	@RequestMapping("orderdetail")
	public String orderdetailView() { // 마이페이지 주문내역상세로 이동하는 메소드

		return "member/orderdetail";
	}
	
	
	@RequestMapping("informationchange")
	public String informationchangeView() { // 마이페이지 개인정보수정 디테일로 이동하는 메소드

		return "member/informationchange";
	}
}
