package com.kh.market.servicecenter.Controller;

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

import com.kh.market.common.Pagination_Notice;
import com.kh.market.recipe.model.vo.PageInfo;
import com.kh.market.servicecenter.model.service.ServiceCenterService;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticeBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticePageInfo;



/**
 * Handles requests for the application home page.
 */
@Controller
public class ServiceCenterController {
	
	@Autowired
	private ServiceCenterService sService;
	
	@RequestMapping("ServiceCenter")
	public ModelAndView ServiceCentermainView(ModelAndView mv,
			@RequestParam(value="currentPage",required=false,defaultValue="1")int currentPage) { //고객센터 메인(notice)으로 이동하는 메소드
		System.out.println("@@@@ currentPage : "+ currentPage);
		
		int listCount = sService.getListCountNotice();
		System.out.println("listCount : " + listCount);
		
		ServiceCenterNoticePageInfo pi = Pagination_Notice.getPageInfo(currentPage,listCount);
		
		ArrayList<ServiceCenterNoticeBoard> list = sService.NoticeselectList(pi);
		System.out.println("list : " + list);
		
		mv.addObject("list", list);
		mv.addObject("pi",pi);
		mv.setViewName("servicecenter/notice");
		
		return mv;
	}
	
	@RequestMapping("noticeDetail")
	public String noticeDetailView() { //공지사항 상세보기로 이동하는 메소드

		return "servicecenter/noticeDetail";
	}
	
	@RequestMapping("QNAwrite")
	public String QNAwriteView() { //고객센터 메인(notice)으로 이동하는 메소드

		return "servicecenter/QNA_write";
	}
	
	@RequestMapping("QNAdetail")
	public String QNAdetailView() { //QNA 상세보기로 이동하는 메소드

		return "servicecenter/QNAdetail";
	}
	
	@RequestMapping("suggestwriteDetail")
	public String suggestwriteDetailView() { //QNA 상세보기로 이동하는 메소드

		return "servicecenter/suggestwriteDetail";
	}

	@RequestMapping("QNA")
	public String QNAViewView() { //고객센터 QNA메인으로 이동하는 메소드

		return "servicecenter/QNA";
	}
	
	@RequestMapping("recipeSuggest")
	public String recipeSuggestView() { //레시피 제안으로 이동

		return "servicecenter/recipeSuggest";
	}

}
