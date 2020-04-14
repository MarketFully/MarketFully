package com.kh.market.recipe.Controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.common.Pagination;
import com.kh.market.recipe.model.Service.BoardService;
import com.kh.market.recipe.model.vo.Board;
import com.kh.market.recipe.model.vo.Menu_Category;
import com.kh.market.recipe.model.vo.PageInfo;

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
			
			
			
		}
		
		//전체 페이지
		System.out.println("tvBoardList입니다.----------------");
		int listCount = bService.getTvListCount(mc_cate_num);
		System.out.println("listCount : "+ listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> blist = bService.TvBoardList(pi, mc_cate_num);
		
		System.out.println("blist : "+ blist);
		System.out.println("mc_cate_num : "+ mc_cate_num);
		
		mv.addObject("blist",blist);
		mv.addObject("mc_cate_num", mc_cate_num);
		mv.addObject("pi",pi);
		
		mv.setViewName("recipe/tvRecipe");
		
		return mv;
	}
	
	
	
	@RequestMapping("RecipeUser")
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
		mv.setViewName("recipe/userRecipe");
		
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
				mv.addObject("b",b)
				  .addObject("currentPage",currentPage)
				  .setViewName("recipe/recipedetail");
			}else {
				mv.addObject("msg","게시글 상세조회 실패")
				  .setViewName("common/errorPage");
			}
		}else {
			Board b = bService.TVselectBoard(bId);
			System.out.println("@@@@ b : " + b);
			if(b != null) {
				mv.addObject("b",b)
				  .addObject("currentPage",currentPage)
				  .setViewName("recipe/recipedetail");
			}else {
				mv.addObject("msg","게시글 상세조회 실패")
				  .setViewName("common/errorPage");
			}
		}
		
		
		return mv;
	}

}
