package com.kh.market.servicecenter.Controller;

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
public class ServiceCenterController {

	@RequestMapping("ServiceCenter")
	public String ServiceCentermainView() { //고객센터 메인(notice)으로 이동하는 메소드

		return "servicecenter/notice";
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
