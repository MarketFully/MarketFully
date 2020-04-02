package com.kh.market.recipe.Controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class RecipeController {

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
	
	@RequestMapping("Recipetopten")
	public String recipeToptenView() { //한식 레시피 이동하는 메소드

		return "recipe/topten";
	}
	
	@RequestMapping("Recipetv")
	public String recipeTvView() { //TV속 레시피 이동하는 메소드

		return "recipe/tvRecipe";
	}
	
	@RequestMapping("RecipeUser")
	public String recipeUserView() { //TV속 레시피 이동하는 메소드

		return "recipe/userRecipe";
	}


}
