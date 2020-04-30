package com.kh.market.servicecenter.Controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.market.common.Pagination;
import com.kh.market.common.Pagination_Notice;
import com.kh.market.common.Pagination_Qna;
import com.kh.market.common.Pagination_RecipeSuggest;
import com.kh.market.member.model.vo.Member;
import com.kh.market.recipe.model.vo.PageInfo;
import com.kh.market.servicecenter.model.service.ServiceCenterService;
import com.kh.market.servicecenter.model.vo.Search_Qna;
import com.kh.market.servicecenter.model.vo.ServiceCenterBoardLike;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticeBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticePageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaPageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaReply;
import com.kh.market.servicecenter.model.vo.ServiceCenterRecipeSuggestBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterRecipeSuggestPageInfo;



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
		
		int listCount = sService.getListCountNotice();
		
		ServiceCenterNoticePageInfo pi = Pagination_Notice.getPageInfo(currentPage,listCount);
		
		ArrayList<ServiceCenterNoticeBoard> list = sService.NoticeselectList(pi);
		
		mv.addObject("list", list);
		mv.addObject("pi",pi);
		mv.setViewName("servicecenter/notice");
		
		return mv;
	}
	
	// 공지사항 상세보기
	@RequestMapping("noticeDetail")
	public ModelAndView noticeDetailView(ModelAndView mv, int notice_num,
										 @RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage) { 
		
		ServiceCenterNoticeBoard snb = sService.NoticeselectBoard(notice_num);
		
		if(snb != null) {
			mv.addObject("snb", snb)
			  .addObject("currentPage", currentPage)
			  .setViewName("servicecenter/noticeDetail");
		}else {
			mv.addObject("msg", "게시글 상세조회 실패");
		}
		return mv;
	}
	
	// QNA 작성
	@RequestMapping("QNAwrite")
	public String QNAwriteView() {

		return "servicecenter/QNA_write";
	}
	
	// QNA 상세보기
	@RequestMapping("QNAdetail")
	public ModelAndView QNAdetailView(ModelAndView mv, int bId,
									  @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) { //QNA 상세보기로 이동하는 메소드
		
		ServiceCenterQnaBoard b = sService.QNAselectBoard(bId);
		ArrayList <ServiceCenterQnaReply> qr = sService.selectQnaReplyList(bId);
		
		if(b != null) {
			mv.addObject("b",b)
			  .addObject("qr", qr)
			  .addObject("currentPage",currentPage)
			  .setViewName("servicecenter/QNAdetail");
		}else {
			mv.addObject("msg","게시글 상세조회 실패")
			  .setViewName("common/errorPage");
		}
		return mv;
	}

	// QNA 리스트
	@RequestMapping("QNA")
	public ModelAndView QNAViewView(ModelAndView mv,
									@RequestParam(value="currentPage",required=false,defaultValue="1")int currentPage) { //고객센터 QNA메인으로 이동하는 메소드
		int listCount = sService.getListCountQna();
		
		ServiceCenterQnaPageInfo pi = Pagination_Qna.getPageInfo(currentPage,listCount);
		
		ArrayList<ServiceCenterQnaBoard> list = sService.QnaselectList(pi);
		
		mv.addObject("list", list);
		mv.addObject("pi",pi);
		mv.setViewName("servicecenter/QNA");
		
		return mv;
	}
	
	// QNA 작성
	@RequestMapping(value="QNAinsert", method=RequestMethod.POST)
	public String insertBoard(ServiceCenterQnaBoard b, HttpServletRequest request,
							  @RequestParam(name="uploadFile",required=false) MultipartFile file) {
		
		
		if(!file.getOriginalFilename().equals("")) {
			String renameFileName = QAsaveFile(file,request);
			
			if(renameFileName != null) {
				b.setQ_FILE(file.getOriginalFilename());
				b.setQ_REFILE(renameFileName);
			}
		}
		
		int result = sService.QNAinsert(b);
		
		if(result > 0) {
			return "redirect:QNA";
		}else {
			return "common/errorPage";
		}
	}
	
	// QNA 리스트 검색
		@RequestMapping("QNASearch")
		public ModelAndView QNASearch(ModelAndView mv,
									  @RequestParam(value="q_keyword",required = false)String q_keyword,
									  @RequestParam(value="q_searchType" ,required=false)String q_searchType,
									  @RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage) {
			
			Search_Qna sq = new Search_Qna();
			
			sq.setQ_keyword(q_keyword);
			sq.setQ_searchType(q_searchType);
			
			if(q_searchType.equals("q_TITLE")) {
				sq.setQ_title(q_keyword);
			}else if(q_searchType.equals("q_WRITER")) {
				sq.setQ_writer(q_keyword);
			}else if(q_searchType.equals("q_CATEGORY")) {
				sq.setQ_category(q_keyword);
			}
			
			
			int listCount = sService.getQNASearchListCount(sq);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<ServiceCenterQnaBoard> list = sService.selectQNASearch(sq,pi);
			
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			
			mv.addObject("sq", sq);
			mv.addObject("q_searchType", q_searchType);
			mv.addObject("q_keyword", q_keyword);
			
			mv.setViewName("servicecenter/QNA");
			
			return mv;
		}
	
	
		
	// QNA 글작성 (파일)
	public String QAsaveFile(MultipartFile file, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\qnauploadFiles";

		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdir();
		}

		String orginFileName = file.getOriginalFilename();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ orginFileName.substring(orginFileName.lastIndexOf(".") + 1);


		String renamePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(renamePath));
		} catch (IOException e) {
		}

		return renameFileName;
	}
	
	// QNA 글 삭제 
	@RequestMapping("QNAdelete") 
	public String deleteQNABOARD(int q_num, HttpServletRequest request) {
	  
	  ServiceCenterQnaBoard qb = sService.QNAselectBoard(q_num);
	  
	  if(qb.getQ_REFILE() != null) {
		  QNAdeleteFile(qb.getQ_REFILE(), request);
	  }
	  
	  int result = sService.qnaBoardDelete(q_num);
	  
	  if(result > 0) {
		  return "redirect:QNA";
	  }else {
		  return null;
	  }
	  
	}
	
	//QNA 글 삭제 (파일)
	public void QNAdeleteFile(String fileName,HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savaPath = root + "\\qnauploadFiles";
		
		File f = new File(savaPath + "\\" + "fileName");
		
		if(f.exists()) {
			f.delete();
		}
	}
	
	// 레시피 제안으로 이동
	@RequestMapping("recipeSuggest")
	public ModelAndView recipeSuggestView(ModelAndView mv,
										  @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {


		int RSlistCount = sService.getRSlistCountRecipeSuggest();


		ServiceCenterRecipeSuggestPageInfo rpi = Pagination_RecipeSuggest.getRecipeSuggestPageInfo(currentPage,
				RSlistCount);

		ArrayList<ServiceCenterRecipeSuggestBoard> RSlist = sService.RecipeSuggestSelectList(rpi);

		for (int i = 0; i < RSlist.size(); i++) {
			String[] strArr = RSlist.get(i).getRb_date().split(" ");
			RSlist.get(i).setRb_date(strArr[0]);
		}

		mv.addObject("RSlist", RSlist);
		mv.addObject("rpi", rpi);
		mv.setViewName("servicecenter/recipeSuggest");

		return mv;
	}
	
	// 레시피 제안 (글작성폼으로)
	@RequestMapping("suggestwrite")
	public String suggestWrite() {
		return "servicecenter/suggestwrite";
	}
	
	// 레시피제안(글작성)
	@RequestMapping(value = "suggestwrite.do", method = RequestMethod.POST)
	public String insertSuggestWrite(ServiceCenterRecipeSuggestBoard rs, HttpServletRequest request,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {


		if (!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file, request);

			if (renameFileName != null) {
				rs.setRb_file(file.getOriginalFilename());
				rs.setRb_refile(renameFileName);
			}

		}
		int result = sService.insertSuggestWrite(rs);

		if (result > 0) {
			return "redirect:recipeSuggest";
		} else {
			return null;
		}

	}

	// 레시피 제안 글작성 (파일)
	public String saveFile(MultipartFile file, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\recipesuggestuploadFiles";

		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdir();
		}

		String orginFileName = file.getOriginalFilename();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ orginFileName.substring(orginFileName.lastIndexOf(".") + 1);


		String renamePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(renamePath));
		} catch (IOException e) {
		}

		return renameFileName;
	}
	
	//QNA 작성한 글 수정 페이지로 이동
	@RequestMapping("QNAwriteUpdate")
	public ModelAndView qnawriteUpdateView(ModelAndView mv, int q_num) {
		mv.addObject("b", sService.QNAselectBoard(q_num))
		  .setViewName("servicecenter/QNAwriteUpdate");
		
		return mv;
	}
	
	//QNA 작성한 글 수정 
	@RequestMapping(value="QNAupdate.do",method = RequestMethod.POST)
	public ModelAndView qnawrtieUpdate(ModelAndView mv, ServiceCenterQnaBoard qb, HttpServletRequest request, 
									   @RequestParam(value="reloadFile", required=false) MultipartFile file) {
		
		if(file != null && !file.isEmpty()) {
			if(qb.getQ_REFILE() != null) {
				QNAdeleteFile(qb.getQ_REFILE(),request);
			}
			
			String renameFileName = QAsaveFile(file,request);
			
			if(renameFileName != null) {
				qb.setQ_FILE(file.getOriginalFilename());
				qb.setQ_REFILE(renameFileName);
			}
		}
		
		int result = sService.qnaBoardUpdate(qb);
		
		
		if(result > 0) {
			mv.addObject("q_num", qb.getQ_NUM()).setViewName("redirect:QNA");
		}else {
			mv.addObject("msg", "수정실패");
		}
		
		return mv;
		
	}
	
	// 레시피 상세보기
	@RequestMapping("suggestwriteDetail")
	public ModelAndView suggestwriteDetail(ModelAndView mv, int rb_num, @SessionAttribute("loginUser") Member m,
			@RequestParam(value = "currnetPage", required = false, defaultValue = "1") int currentPage) {

		ServiceCenterRecipeSuggestBoard rcb = sService.recipeSuggestSelectBoard(rb_num);

		// 여기서부터
		ServiceCenterBoardLike scb = new ServiceCenterBoardLike();

		scb.setMem_num(m.getMem_num());
		scb.setRb_num(rb_num);
		// 여기까지

		if (rcb != null) {
			int boardLike = sService.checklike(scb);

			mv.addObject("rcb", rcb).addObject("currentPage", currentPage).addObject("boardLike", boardLike)
					.setViewName("servicecenter/suggestwriteDetail");
		} else {
			mv.addObject("msg", "게시글 상세조회 실패");
		}
		return mv;
	}

	public void RecipeSuggestdeleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\recipesuggestuploadFiles";

		File f = new File(savePath + "\\" + "fileName");

		if (f.exists()) {
			f.delete();
		}
	}
	
	// 레시피 제안 삭제하기
	@RequestMapping("suggestwriteDelete")
	public String deletesuggestWrite(int rb_num, HttpServletRequest request) {

		ServiceCenterRecipeSuggestBoard rcb = sService.recipeSuggestSelectBoard(rb_num);

		if (rcb.getRb_refile() != null) {
			RecipeSuggestdeleteFile(rcb.getRb_refile(), request);
		}

		int result = sService.recipeSuggestDeleteBoard(rb_num);

		if (result > 0) {
			return "redirect:recipeSuggest";
		} else {
			return null;
		}
	}

	// 레시피 제안 수정 페이지
	@RequestMapping("suggestwriteUpdate")
	public ModelAndView suggestwriteUpdateView(ModelAndView mv, int rb_num) {
		mv.addObject("rcb", sService.recipeSuggestSelectBoard(rb_num)).setViewName("servicecenter/suggestwriteUpdate");

		return mv;
	}

	// 레시피 제안 수정
	@RequestMapping(value = "suggestwriteUpdate.do", method = RequestMethod.POST)
	public ModelAndView suggestwriteUpdate(ModelAndView mv, ServiceCenterRecipeSuggestBoard rcb,
			HttpServletRequest request, @RequestParam(value = "reloadFile", required = false) MultipartFile file) {

		if (file != null && !file.isEmpty()) {
			if (rcb.getRb_refile() != null) {
				RecipeSuggestdeleteFile(rcb.getRb_refile(), request);
			}

			String renameFileName = saveFile(file, request);

			if (renameFileName != null) {
				rcb.setRb_file(file.getOriginalFilename());
				rcb.setRb_refile(renameFileName);
			}
		}

		int result = sService.recipeSuggestUpdateBoard(rcb);

		if (result > 0) {
			mv.addObject("rb_num", rcb.getRb_num()).setViewName("redirect:suggestwriteUpdate.do");
		} else {
			mv.addObject("msg", "수정실패");
		}

		return mv;
	}

	// 레시피 제안 좋아요

	@ResponseBody
	@RequestMapping("likey.do")
	public String RecipeLikey(int rb_num, int mem_num) {

		ServiceCenterBoardLike scb = new ServiceCenterBoardLike(mem_num, rb_num); // 객체 셋팅

		String returnstring = "";
		if (sService.checklike(scb) > 0) {// 좋아요를 눌렀던 적이 있었을 경우

			int deletechk = sService.deletelike(scb);

			if (deletechk > 0) {
				returnstring = "2";
			} else {
			}
		} else {
			int likeupdate = sService.addUserlike(scb);// 좋아요 DB에 값 추가 ,
			if (likeupdate > 0) {
				returnstring = "1";
			}
		}

		int result = sService.RecipeLikey(rb_num); // board의 좋아요 갯수 업데이트

		if (result > 0) {
		} else {
		}

		return returnstring;
	}

	
	// QNA 댓글 등록
		@ResponseBody
		@RequestMapping("qnaReply")
		public String qnainsertReply(ServiceCenterQnaReply qr) {
			
			
			int result = sService.qnainsertReply(qr);
			
			if(result > 0) {
				return "success";
			}else {
				return "fail";
			}
		}
		
		// QNA 댓글 리스트
		@RequestMapping("qnaReplyList")
		public void qnaReplyList(HttpServletResponse response, int q_num) throws JsonIOException, IOException{
			ArrayList<ServiceCenterQnaReply> qrList = sService.selectQnaReplyList(q_num);
			
			response.setContentType("application/json; charset=utf-8");
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(qrList, response.getWriter());
		}
		
		// QNA 댓글 삭제
		@RequestMapping("qnadeleteReply")
		public ModelAndView qnadeleteReply(ModelAndView mv,
				@RequestParam("q_num") int q_num,//댓글번호
				@RequestParam("bId") int bId) {//게시물번호
			ServiceCenterQnaReply qr = new ServiceCenterQnaReply();//빈객체만들고
			qr.setQ_num(q_num);//댓글 번호 셋팅하고
		
			int result = sService.qnadeleteReply(qr);// //선택한 댓글 삭제
			
			ServiceCenterQnaBoard b = sService.QNAselectBoard(bId); // 보고있었던 boardDetail 객체에 저장
			ArrayList <ServiceCenterQnaReply> qrlist = sService.selectQnaReplyList(bId); //보고있었던 댓글 객체에 저장
			
			if(b != null) {
				mv.addObject("b",b)
				  .addObject("qr", qrlist)
				  .setViewName("servicecenter/QNAdetail");
			}else {
				mv.addObject("msg","게시글 상세조회 실패")
				  .setViewName("common/errorPage");
			}
			return mv;
			
		}

}
