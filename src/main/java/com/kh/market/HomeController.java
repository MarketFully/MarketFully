package com.kh.market;

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
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.product.model.service.ProductService;
import com.kh.market.product.model.vo.Product;
import com.kh.market.recipe.model.Service.BoardService;
import com.kh.market.recipe.model.vo.Board;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private BoardService bService;
	@Autowired
	private ProductService pService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model, ModelAndView mv) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		ArrayList<Board> mainrandomlist = bService.MainRandomselectList(); //이 레시피 어때요?
		ArrayList<Board> mainrandomlist2 = bService.MainRandomselectList2(); // 최근 뜨는 레시피
		ArrayList<Product> mainRankProduct = pService.mainrankproduct();//상품 판매순위 4개

		mv.addObject("mainrandomlist", mainrandomlist);
		mv.addObject("mainrandomlist2", mainrandomlist2);
		mv.addObject("mainRankProduct",mainRankProduct);

		model.addAttribute("serverTime", formattedDate );
		
		return mv;
	}
	
}
