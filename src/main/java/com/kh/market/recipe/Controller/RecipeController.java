package com.kh.market.recipe.Controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.common.Pagination;
import com.kh.market.member.model.vo.Favorite;
import com.kh.market.recipe.model.Service.BoardService;
import com.kh.market.recipe.model.vo.Board;
import com.kh.market.recipe.model.vo.BoardReply;
import com.kh.market.recipe.model.vo.Menu_Category;
import com.kh.market.recipe.model.vo.PageInfo;
import com.kh.market.recipe.model.vo.SearchInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("clist")
public class RecipeController {
	
	@Autowired
	private BoardService bService;

	@RequestMapping("RecipeKor")
	public String recipeKorView() { //한식 레시피 이동하는 메소드

		return "recipe/foodkind";
	}

	@RequestMapping("RecipeEng")
	public String recipeEngView() { //양식 레시피 이동하는 메소드

		return "recipe/foodkindEng";
	}

	@RequestMapping("RecipeJap")
	public String recipeJapView() { //일식 레시피 이동하는 메소드

		return "recipe/foodkindJapan";
	}

	@RequestMapping("RecipeChi")
	public String recipeChiView() { //중식 레시피 이동하는 메소드

		return "recipe/foodkindchina";
	}

	@RequestMapping("RecipeGui")
	public String recipeGuiView() { //기타 레시피 이동하는 메소드

		return "recipe/foodkindGui";
	}
	
	@RequestMapping("TvRecipetopten")
	public ModelAndView TvrecipeToptenView(ModelAndView mv) { // TvTop10 레시피 이동하는 메소드

		ArrayList<Board> list = bService.TvTop10selectList();
		
		mv.addObject("list", list);
		mv.addObject("TvOrUser", "tv");
		mv.setViewName("recipe/topten");
		
		return mv;
	}
	@RequestMapping("UserRecipetopten")
	public ModelAndView UserrecipeToptenView(ModelAndView mv) { //UserTop10 레시피 이동하는 메소드
		
		ArrayList<Board> list = bService.UserTop10selectList();
		
		mv.addObject("list", list);
		mv.addObject("TvOrUser", "user");
		mv.setViewName("recipe/topten");
		
		return mv;
	}
	
	
	
	  @RequestMapping("tvCateList") 
	public ModelAndView tvCateList(ModelAndView mv, @RequestParam(defaultValue="0")int mc_cate_num) { //TV속 레시피 카테고리 리스트
	  
		  
	  ArrayList<Menu_Category> clist = bService.TvCateList();
	  mv.addObject("clist", clist);
	  
	  
	  	System.out.println("tvCateList입니다.----------------");
		int listCount = bService.getTvListCount(mc_cate_num);
		System.out.println("listCount : "+ listCount);
		
		int currentPage = 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
	  
	  ArrayList<Board> blist = bService.TvBoardList(pi, mc_cate_num);
	  
	  System.out.println("blist : "+ blist);
	  
	  mv.addObject("blist", blist);
	  
	  mv.addObject("mc_cate_num", mc_cate_num);
		mv.addObject("pi",pi);
		mv.addObject("pageValue", "tvBoardList");
		mv.addObject("TvOrUser", "tv");
		
	  mv.setViewName("recipe/tvRecipe");
	  
	  
	  return mv; 
	  }
	
	
	@RequestMapping("tvBoardList")
	public ModelAndView tvBoardList(ModelAndView mv
									, @RequestParam(defaultValue="-1")int mc_cate_num //// mc_cate_num 값이 -1이면 오류페이지로 가게 처리해야함
									, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
			) { // 카테고리에 맞는 tv속 레시피 리스트 
			
		if(mc_cate_num == -1) {
			//오류 페이지로 

			mv.setViewName("index.jsp");			
			return mv;
			
		}else {
			//전체 페이지
			System.out.println("tvBoardList입니다.----------------");
			int listCount = bService.getTvListCount(mc_cate_num);
			System.out.println("listCount : "+ listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<Board> blist = bService.TvBoardList(pi, mc_cate_num);
			
			System.out.println("blist : "+ blist);
			System.out.println("mc_cate_num : "+ mc_cate_num);
			System.out.println("pi : "+pi);
			mv.addObject("blist",blist);
			mv.addObject("mc_cate_num", mc_cate_num);
			mv.addObject("pi",pi);
			mv.addObject("pageValue", "tvBoardList");
			mv.addObject("TvOrUser", "tv");
			
			mv.setViewName("recipe/tvRecipe");
			
			return mv;
		}
	}
	
	
	@RequestMapping("tvSearchList")
	public ModelAndView tvRecipeSrc(ModelAndView mv
							, @RequestParam(defaultValue="-1")int mc_cate_num	//값이 -1이면 에러 
							, @RequestParam(defaultValue="-1") String src_cate	//값이 -1이면 에러
							, @RequestParam(defaultValue="") String src_input	// 값이 ""이면 그냥 리스트로 보낸다.
							, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
			
			) {	//tc 레시피 검색 결과 리스트
		
		//예외 처리 (오류페이지는 없으니까 처리 안함)
//		if(src_input.equals("")) {
//			//값이 ""없으면 그냥 전체 리스트를 띄운다.
//			System.out.println("tvSearchList입니다. 공백으로 인해 전체 리스트 띄우기----------------");
//			int listCount = bService.getTvListCount(0);
//			System.out.println("listCount : "+ listCount);
//			
//			PageInfo pi = Pagination.getPageInfo(1, listCount);
//			
//			ArrayList<Board> blist = bService.TvBoardList(pi, 0);
//			
//			System.out.println("blist : "+ blist);
//			System.out.println("mc_cate_num : "+ 0);
//			System.out.println("pi : "+pi);
//			mv.addObject("blist",blist);
//			mv.addObject("mc_cate_num", 0);
//			mv.addObject("pi",pi);
//			mv.addObject("pageValue", "tvBoardList");
//			
//			mv.setViewName("recipe/tvRecipe");
//			
//			return mv;
//		}
		
		
		
		// 시작
		System.out.println("tvSearchList입니다.----------------");
		
		SearchInfo si = new SearchInfo();
		
		System.out.println("mc_cate_num "+mc_cate_num);
		System.out.println("src_cate "+src_cate);
		System.out.println("src_input "+src_input);
		
		si.setMc_cate_num(mc_cate_num);
		si.setSrc_cate(src_cate);
		si.setSrc_input(src_input);
		
		
		int listCount = bService.getTvSearchListCount(si);
		
		System.out.println("listCount : "+ listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> blist = bService.TvSearchList(pi, si);
		
		mv.addObject("blist",blist);
		mv.addObject("mc_cate_num", mc_cate_num);
		mv.addObject("pi",pi);
		mv.addObject("si",si);
		mv.addObject("pageValue", "tvSearchList");
		mv.addObject("TvOrUser", "tv");
		mv.setViewName("recipe/tvRecipe");
		
		return mv;
	}
	
	@RequestMapping("userSearchList")
	public ModelAndView userRecipeSrc(ModelAndView mv
							, @RequestParam(defaultValue="-1")int mc_cate_num	//값이 -1이면 에러 
							, @RequestParam(defaultValue="") String src_input	// 값이 ""이면 그냥 리스트로 보낸다.
							, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, String TvOrUser
			
			) {	
		// 시작
		System.out.println("userSearchList입니다.----------------");
		
		SearchInfo si = new SearchInfo();
		
		System.out.println("mc_cate_num "+mc_cate_num);
		System.out.println("src_input "+src_input);
		
		si.setMc_cate_num(mc_cate_num);
		si.setSrc_input(src_input);
		
		
		int listCount = bService.getUserSearchListCount(si);
		
		System.out.println("listCount : "+ listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.UserSearchList(pi, si);
		
		mv.addObject("list",list);
		mv.addObject("mc_cate_num", mc_cate_num);
		mv.addObject("pi",pi);
		mv.addObject("si",si);
//		mv.addObject("pageValue", "tvSearchList");
		mv.addObject("TvOrUser", "user");
		mv.setViewName("recipe/userRecipe");
		
		return mv;
	}
	
	
/*	@RequestMapping("RecipeUser") // 사용자 레시피1
	public ModelAndView recipeUserView(ModelAndView mv, 
									@RequestParam(value="currentPage",required=false,defaultValue="1")int currentPage) { // 사용자 레시피
		
		System.out.println("@@@@ currentPage : "+ currentPage);
		
		int listCount = bService.getListCount();
		
		System.out.println("listCount : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
		
		ArrayList<Board> list = bService.UserselectList(pi);
			
		mv.addObject("list", list);
		mv.addObject("TvOrUser", "user");
		mv.addObject("pi",pi);
		mv.setViewName("recipe/temp_userRecipe");
		
		return mv;
	}*/
	
	@RequestMapping("RecipeUser") // 사용자 레시피 2
	public ModelAndView recipeUserView(ModelAndView mv) { 
		System.out.println("contorler");
		
		ArrayList<Board> kolist = bService.UserselectList_ko();
		ArrayList<Board> enlist = bService.UserselectList_en();
		ArrayList<Board> jplist = bService.UserselectList_jp();
		ArrayList<Board> chlist = bService.UserselectList_ch();
		ArrayList<Board> etclist = bService.UserselectList_etc();
		
		mv.addObject("kolist", kolist);
		mv.addObject("enlist", enlist);
		mv.addObject("jplist", jplist);
		mv.addObject("chlist", chlist);
		mv.addObject("etclist", etclist);
		
		mv.addObject("TvOrUser", "user");
		mv.setViewName("recipe/temp_userRecipe");
		
		return mv; 
	}
	
	@RequestMapping("RecipeList")
	public String recipeUserView() { //TV속 레시피 이동하는 메소드

		return "recipe/userRecipe";
	}
	
	@RequestMapping("RecipeDetail")
	public ModelAndView recipeDetailView(ModelAndView mv, int bId,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage, String TvOrUser) { //레시피 자세히 보는 페이지로 이동하는 메소드
		
		System.out.println("TvOrUser : " + TvOrUser);
		
		if(TvOrUser.equals("user")) {
			Board b = bService.USERselectBoard(bId);
			System.out.println("@@@@ b : " + b);
			if(b != null) {
				mv.addObject("b",b).addObject("me_num", 2)
				  .addObject("currentPage",currentPage)
				  .addObject("bId",bId)
				  .addObject("TvOrUser",TvOrUser)
				  .setViewName("recipe/recipedetail");
			}else {
				mv.addObject("msg","게시글 상세조회 실패")
				  .setViewName("common/errorPage");
			}
		}else {
			Board b = bService.TVselectBoard(bId);
			System.out.println("@@@@ b : " + b);
			if(b != null) {
				mv.addObject("b",b).addObject("me_num", 1)
				  .addObject("currentPage",currentPage)
				  .addObject("bId",bId)
				  .addObject("TvOrUser",TvOrUser)
				  .setViewName("recipe/recipedetail");
			}else {
				mv.addObject("msg","게시글 상세조회 실패")
				  .setViewName("common/errorPage");
			}
		}
		
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("heartplus")
	public String heartcheck(Board b,HttpServletRequest request,int bId,String TvOrUser, int mem_num) { 
		
		System.out.println("heart TvOrUser : " + TvOrUser);
		System.out.println("heart mem_num : " + mem_num);
		
		int me_num; 
		if(TvOrUser.equals("user")) {
			me_num = 2;
		}else {
			me_num = 1;
		}
	
		Favorite f = new Favorite();
		f.setMem_num(mem_num);
		f.setMb_bo_num(bId);
		f.setMe_num(me_num);
		
		if(TvOrUser.equals("user")) {
			
			int result = bService.USERheartPlus(f);
			System.out.println("@@@@@@@" + result);
			if(result > 0) {
				
				return "ok";
			}else {
				return "fail";
			}
		}else {
			int result = bService.TVheartPlus(f);
			if(result > 0) {
				return "ok";
			}else {
				return "fail";
			}
		}
	}
	@ResponseBody
	@RequestMapping("heartminus")
	public String heartcheck2(Board b,HttpServletRequest request,int bId,String TvOrUser,int mem_num) { 
		
		System.out.println("heart TvOrUser : " + TvOrUser);
		System.out.println("heart mem_num : " + mem_num);
		
		int me_num; 
		if(TvOrUser.equals("user")) {
			me_num = 2;
		}else {
			me_num = 1;
		}
		
		Favorite f = new Favorite();
		f.setMem_num(mem_num);
		f.setMb_bo_num(bId);
		f.setMe_num(me_num);
		
		if(TvOrUser.equals("user")) {
			
			int result = bService.USERheartMinus(f);
			if(result > 0) {
				return "ok";
			}else {
				return "fail";
			}
		}else {
			int result = bService.TVheartMinus(f);
			if(result > 0) {
				return "ok";
			}else {
				return "fail";
			}
		}
	}
	
	// 레시피 댓글 등록
	@RequestMapping("insertReply")
	@ResponseBody
	public String insertReply(BoardReply r,String TvOrUser) {
		System.out.println("TvOrUser qqq: " + TvOrUser);
		
		if(TvOrUser.equals("user")) {
			int result = bService.userInsertReply(r);
			System.out.println("TvOrUser : " + TvOrUser);
	
			if(result > 0) {
				return "success";
			}else {
				return "fail";
			}
		}else {
			int result = bService.tvInsertReply(r);
			System.out.println("TvOrUser : " + TvOrUser);
	
			if(result > 0) {
				return "success";
			}else {
				return "fail";
			}
		}
	}
	
	// 레시피 댓글 삭제
	@RequestMapping("deleteReply")
	public String deleteReply(Model model,int rId,int bId,String TvOrUser, HttpServletRequest request) {

		if(TvOrUser.equals("user")) {
			int result = bService.userDeleteReply(rId);
			
			if(result > 0) {
				return "redirect:RecipeDetail?bId="+bId+"&TvOrUser="+TvOrUser;
			}else {
				model.addAttribute("msg","삭제 시 실패");
				return "common/errorPage";
			}
		}else {
			int result = bService.tvDeleteReply(rId);
			
			if(result > 0) {
				return "redirect:RecipeDetail?bId="+bId+"&TvOrUser="+TvOrUser;
			}else {
				model.addAttribute("msg","삭제 시 실패");
				return "common/errorPage";
			}
		}
		
	}

}
