package com.kh.market.servicecenter.Controller;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.common.Pagination_Notice;
import com.kh.market.common.Pagination_Qna;
import com.kh.market.recipe.model.vo.PageInfo;
import com.kh.market.servicecenter.model.service.ServiceCenterService;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticeBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticePageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaPageInfo;



/**
 * Handles requests for the application home page.
 */
@SessionAttributes("loginUser")
@Controller
public class ServiceCenterController {
	
	@Autowired
	private ServiceCenterService sService;
	
	@RequestMapping("ServiceCenter")
	public ModelAndView ServiceCentermainView(ModelAndView mv,
			@RequestParam(value="currentPage",required=false,defaultValue="1")int currentPage) { //고객센터 메인(notice)으로 이동하는 메소드
		System.out.println("@@@@ currentPage : "+ currentPage);
		
		int listCount = sService.getListCountNotice();
		System.out.println("NOTICE BOARD listCount : " + listCount);
		
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
	public ModelAndView QNAdetailView(ModelAndView mv, int bId,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) { //QNA 상세보기로 이동하는 메소드
		System.out.println("sikim qna controller bid : " + bId);
		ServiceCenterQnaBoard b = sService.QNAselectBoard(bId);
		if(b != null) {
			mv.addObject("b",b)
			  .addObject("currentPage",currentPage)
			  .setViewName("servicecenter/QNAdetail");
		}else {
			mv.addObject("msg","게시글 상세조회 실패")
			  .setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("suggestwriteDetail")
	public String suggestwriteDetailView() { //QNA 상세보기로 이동하는 메소드

		return "servicecenter/suggestwriteDetail";
	}

	@RequestMapping("QNA")
	public ModelAndView QNAViewView(ModelAndView mv,
			@RequestParam(value="currentPage",required=false,defaultValue="1")int currentPage) { //고객센터 QNA메인으로 이동하는 메소드
		System.out.println("@@@@ currentPage : "+ currentPage);
		int listCount = sService.getListCountQna();
		System.out.println("QNA BOARD listCount : " + listCount);
		
		ServiceCenterQnaPageInfo pi = Pagination_Qna.getPageInfo(currentPage,listCount);
		
		ArrayList<ServiceCenterQnaBoard> list = sService.QnaselectList(pi);
		System.out.println("list : " + list);
		
		mv.addObject("list", list);
		mv.addObject("pi",pi);
		mv.setViewName("servicecenter/QNA");
		
		return mv;
	}
	
	@RequestMapping("QNAinsert")
	public String insertBoard(ServiceCenterQnaBoard b, HttpServletRequest request,
						@RequestParam(name="uploadFile",required=false) MultipartFile file) {
		
		System.out.println("#############################" + b);
		
		int result = sService.QNAinsert(b);
		
		if(result > 0) {
			return "redirect:QNA";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("recipeSuggest")
	public String recipeSuggestView() { //레시피 제안으로 이동

		return "servicecenter/recipeSuggest";
	}

}
