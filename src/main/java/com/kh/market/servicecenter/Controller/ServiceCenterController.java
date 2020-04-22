package com.kh.market.servicecenter.Controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.common.Pagination_Notice;
import com.kh.market.common.Pagination_Qna;
import com.kh.market.common.Pagination_RecipeSuggest;
import com.kh.market.member.model.vo.Member;
import com.kh.market.recipe.model.vo.PageInfo;
import com.kh.market.servicecenter.model.service.ServiceCenterService;
import com.kh.market.servicecenter.model.vo.ServiceCenterBoardLike;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticeBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticePageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaPageInfo;
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
	
	// 레시피 제안으로 이동
	@RequestMapping("recipeSuggest")
	public ModelAndView recipeSuggestView(ModelAndView mv,
										  @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {

		System.out.println("currentPage : " + currentPage);

		int RSlistCount = sService.getRSlistCountRecipeSuggest();

		System.out.println("RSlistCount : " + RSlistCount);

		ServiceCenterRecipeSuggestPageInfo rpi = Pagination_RecipeSuggest.getRecipeSuggestPageInfo(currentPage,
				RSlistCount);

		ArrayList<ServiceCenterRecipeSuggestBoard> RSlist = sService.RecipeSuggestSelectList(rpi);
		System.out.println("RSlist : " + RSlist);

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

		System.out.println(rs);

		if (!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file, request);

			if (renameFileName != null) {
				rs.setRb_file(file.getOriginalFilename());
				rs.setRb_refile(renameFileName);
			}

		}
		System.out.println(rs);
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

		System.out.println("renameFileName : " + renameFileName);

		String renamePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(renamePath));
		} catch (IOException e) {
			System.out.println("파일전송에러: " + e.getMessage());
		}

		return renameFileName;
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
		System.out.println("aaa");

		if (file != null && !file.isEmpty()) {
			System.out.println("bbb");
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

			System.out.println("좋아요 누른적 있음!");
			int deletechk = sService.deletelike(scb);

			if (deletechk > 0) {
				System.out.println("좋아요 삭제 성공!");
				returnstring = "2";
			} else {
				System.out.println("좋아요 삭제 실패!");
			}
		} else {
			System.out.println("좋아요 누른적 없음!");
			int likeupdate = sService.addUserlike(scb);// 좋아요 DB에 값 추가 ,
			if (likeupdate > 0) {
				System.out.println("좋아요 인서트 성공!");
				returnstring = "1";
			}
		}

		int result = sService.RecipeLikey(rb_num); // board의 좋아요 갯수 업데이트

		if (result > 0) {
			System.out.println("게시판 좋아요 갯수 업데이트 성공!");
		} else {
			System.out.println("게시판 좋아요 갯수 업데이트 실패!");
		}

		return returnstring;
	}


}
