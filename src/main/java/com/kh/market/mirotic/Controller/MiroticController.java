package com.kh.market.mirotic.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.member.model.vo.Member;
import com.kh.market.member.model.vo.MyBag;
import com.kh.market.mirotic.model.service.MiroticService;

@Controller
public class MiroticController {
	
	@Autowired
	private MiroticService mrtService;
	
	@RequestMapping("miroticView")
	@ResponseBody
	public ModelAndView miroticView(ModelAndView mv
								, HttpSession session
								, @RequestBody ArrayList<MyBag> cartList
							) {
		
		System.out.println("------miroticView--------");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println("loginUser : "+ loginUser);
		System.out.println("list  : "+cartList);
	
		if(loginUser != null) { //회원이면 db에 업데이트 해준다.
			System.out.println("회원입니다. : "+loginUser);
			int result = mrtService.updateCartlist(cartList);
			System.out.println("result : "+result);
		}
		
		mv.addObject("cartList", cartList);
		
		mv.setViewName("mirotic/miroticPage");
		
		
		
		return mv;
	}
}