package com.kh.market.servicecenter.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.recipe.model.vo.PageInfo;
import com.kh.market.servicecenter.model.dao.ServiceCenterDao;
import com.kh.market.servicecenter.model.vo.ServiceCenterBoardLike;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticeBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticePageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaPageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterRecipeSuggestBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterRecipeSuggestPageInfo;

@Service("sService")
public class ServiceCenterServiceImpl implements ServiceCenterService {
	
	@Autowired
	private ServiceCenterDao sDao;
	
	@Override
	public int getListCountNotice() {

		return sDao.getListCountNotice();
	}

	@Override
	public ArrayList<ServiceCenterNoticeBoard> NoticeselectList(ServiceCenterNoticePageInfo pi) {
		
		return sDao.NoticeselectList(pi);
	}

	@Override
	public int getListCountQna() {
		
		return sDao.getListCountQna();
	}

	@Override
	public ArrayList<ServiceCenterQnaBoard> QnaselectList(ServiceCenterQnaPageInfo pi) {
		
		return sDao.QnaselectList(pi);
	}

	@Override
	public int QNAinsert(ServiceCenterQnaBoard b) {
		
		return sDao.QNAinsert(b);
	}

	@Override
	public ServiceCenterQnaBoard QNAselectBoard(int bId) {
		
		int result = sDao.QNAupdateCount(bId);
		
		if(result > 0) {
			System.out.println("qna bId2 : " + bId);
			return sDao.QNAselectBoard(bId);
		}else {
			return null;
		}
	}
	
	// 레시피 제안
	@Override
	public int getRSlistCountRecipeSuggest() {
		return sDao.getRSListCountRecipeSuggest();
	}

	@Override
	public ArrayList<ServiceCenterRecipeSuggestBoard> RecipeSuggestSelectList(ServiceCenterRecipeSuggestPageInfo rpi) {
		return sDao.RecipeSuggestSelectList(rpi);
	}

	// 레시피 제안 작성
	@Override
	public int insertSuggestWrite(ServiceCenterRecipeSuggestBoard rs) {
		return sDao.insertSuggestWrite(rs);
	}

	// 레시피 제안 상세보기
	@Override
	public ServiceCenterRecipeSuggestBoard recipeSuggestSelectBoard(int rb_num) {
		int result = sDao.updateCount(rb_num);

		if (result > 0) {
			return sDao.selectSuggestWrite(rb_num);
		} else {
			return null;
		}
	}

	// 레시피 제안 삭제
	@Override
	public int recipeSuggestDeleteBoard(int rb_num) {
		return sDao.deleteSuggestWrite(rb_num);
	}

	// 레시피 제안 수정
	@Override
	public int recipeSuggestUpdateBoard(ServiceCenterRecipeSuggestBoard rcb) {
		return sDao.recipeSuggestUpdateBoard(rcb);
	}

	// 레시피 제안 좋아요
	@Override
	public int RecipeLikey(int rb_num) {
		return sDao.RecipeLikey(rb_num);
	}

	// 레시피 제안 좋아요 체크
	@Override
	public int checklike(ServiceCenterBoardLike scb) {
		return sDao.checklike(scb);
	}

	// 레시피 제안 좋아요 클릭
	@Override
	public int addUserlike(ServiceCenterBoardLike scb) {
		return sDao.addUserlike(scb);
	}

	// 레시피 제안 좋아요 삭제
	@Override
	public int deletelike(ServiceCenterBoardLike scb) {
		return sDao.deleteUserlike(scb);


	}
	
}
