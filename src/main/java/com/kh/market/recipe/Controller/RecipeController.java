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
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.recipe.model.service.BoardService;
import com.kh.market.recipe.model.vo.Board;
import com.kh.market.recipe.model.vo.Menu_Category;

/**
 * Handles requests for the application home page.
 */
@Controller
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
		mv.setViewName("recipe/topten");
		
		return mv;
	}
	@RequestMapping("UserRecipetopten")
	public ModelAndView UserrecipeToptenView(ModelAndView mv) { //UserTop10 레시피 이동하는 메소드
		
		ArrayList<Board> list = bService.UserTop10selectList();
		
		mv.addObject("list", list);
		mv.setViewName("recipe/topten");
		
		return mv;
	}
	
	
	
	@RequestMapping("tvCateList")
	public ModelAndView tvCateList(ModelAndView mv) { //TV속 레시피 이동하는 메소드
		
		ArrayList<Menu_Category> clist = bService.TvCateList();
		System.out.println("clist : "+ clist);
		mv.addObject("clist", clist);
		mv.setViewName("recipe/tvRecipe");
		
		
		
		return mv;
	}
	
	//@RequestMapping("tvBoardList")
	
	
	
	
	@RequestMapping("RecipeList")
	public String recipeUserView() { //TV속 레시피 이동하는 메소드

		return "recipe/userRecipe";
	}
	
	@RequestMapping("RecipeDetail")
	public String recipeDetailView() { //레시피 자세히 보는 페이지로 이동하는 메소드

		return "recipe/recipedetail";
	}

}
