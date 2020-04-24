package com.kh.market.servicecenter.model.service;

import java.util.ArrayList;

import com.kh.market.recipe.model.vo.PageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterBoardLike;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticeBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticePageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaPageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterRecipeSuggestBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterRecipeSuggestPageInfo;

public interface ServiceCenterService {
	
	/**
	 * 공지사항
	 * @return
	 */
	int getListCountNotice();

	ArrayList<ServiceCenterNoticeBoard> NoticeselectList(ServiceCenterNoticePageInfo pi);
	
	/**
	 * 공지사항 상세보기
	 * @param notice_num
	 * @return
	 */
	ServiceCenterNoticeBoard NoticeselectBoard(int notice_num);

	/**
	 * QNA
	 * @return
	 */
	int getListCountQna();

	ArrayList<ServiceCenterQnaBoard> QnaselectList(ServiceCenterQnaPageInfo pi);

	/**
	 * QNA 작성
	 * @param b
	 * @return
	 */
	int QNAinsert(ServiceCenterQnaBoard b);

	/**
	 * QNA 상세보기
	 * @param bId
	 * @return
	 */
	ServiceCenterQnaBoard QNAselectBoard(int bId);
	
	
	/**
	 * QNA 작성한 글 삭제 
	 * @param q_num
	 * @return
	 */
	int qnaBoardDelete(int q_num);
	
	/**
	 * QNA 작성한 글 수정
	 * @param qb
	 * @return
	 */
	int qnaBoardUpdate(ServiceCenterQnaBoard qb);
	
	/**
	 * 레시피 제안
	 * @return
	 */
	int getRSlistCountRecipeSuggest();

	ArrayList<ServiceCenterRecipeSuggestBoard> RecipeSuggestSelectList(ServiceCenterRecipeSuggestPageInfo rpi);

	/**
	 * 레시피 글작성 
	 * @param rs
	 * @return
	 */
	int insertSuggestWrite(ServiceCenterRecipeSuggestBoard rs);

	/**
	 * 레시피 상세보기
	 * @param rb_num
	 * @return
	 */
	ServiceCenterRecipeSuggestBoard recipeSuggestSelectBoard(int rb_num);

	/** 
	 * 레시피 제안 삭제 
	 * @param rb_num
	 * @return
	 */
	int recipeSuggestDeleteBoard(int rb_num);

	/**
	 * 레시피 제안 수정
	 * @param rcb
	 * @return
	 */
	int recipeSuggestUpdateBoard(ServiceCenterRecipeSuggestBoard rcb);

	
	/**
	 * 레시피 제안 좋아요
	 * @param rb_num
	 * @return
	 */
	int RecipeLikey(int rb_num);

	/**
	 * 레시피 제안 좋아요 체크기능
	 * @param scb
	 * @return
	 */
	int checklike(ServiceCenterBoardLike scb);

	/**
	 * 레시피 제안 좋아요 클릭
	 * @param scb
	 * @return
	 */
	int addUserlike(ServiceCenterBoardLike scb);

	/**
	 * 레시피 제안 좋아요 취소
	 * @param scb
	 * @return
	 */
	int deletelike(ServiceCenterBoardLike scb);
}
