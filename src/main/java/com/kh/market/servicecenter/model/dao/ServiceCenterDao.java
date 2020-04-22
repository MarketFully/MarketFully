package com.kh.market.servicecenter.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.recipe.model.vo.PageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterBoardLike;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticeBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticePageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaPageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterRecipeSuggestBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterRecipeSuggestPageInfo;

@Repository("sDao")
public class ServiceCenterDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCountNotice() {
		
		return sqlSession.selectOne("ServiceCenterMapper.getListCountNotice");
	}

	public ArrayList<ServiceCenterNoticeBoard> NoticeselectList(ServiceCenterNoticePageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("ServiceCenterMapper.NoticeselectList",null,rowBounds);
	}

	public int getListCountQna() {
		
		return sqlSession.selectOne("ServiceCenterMapper.getListCountQna");
	}

	public ArrayList<ServiceCenterQnaBoard> QnaselectList(ServiceCenterQnaPageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("ServiceCenterMapper.QnaselectList",null,rowBounds);
	}

	public int QNAinsert(ServiceCenterQnaBoard b) {
		
		return sqlSession.insert("ServiceCenterMapper.QNAinsert",b);
	}

	public int QNAupdateCount(int bId) {
		
		return sqlSession.update("ServiceCenterMapper.updateCount",bId);
	}

	public ServiceCenterQnaBoard QNAselectBoard(int bId) {
		
		return sqlSession.selectOne("ServiceCenterMapper.selectBoard",bId);
	}


	// 레시피 제안
	public int getRSListCountRecipeSuggest() {
		return sqlSession.selectOne("NoticeboardMapper.getRSlistCountRecipeSuggest");
	}

	public ArrayList<ServiceCenterRecipeSuggestBoard> RecipeSuggestSelectList(ServiceCenterRecipeSuggestPageInfo rpi) {
		int rsoffset = (rpi.getCurrentPage() -1) * rpi.getBoardLimit();
		RowBounds rsrowBounds = new RowBounds(rsoffset, rpi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("NoticeboardMapper.recipeSuggestselectList", null,rsrowBounds);
		
	}
	
	// 레시지 제안 작성
	public int insertSuggestWrite(ServiceCenterRecipeSuggestBoard rs) {
		return sqlSession.insert("NoticeboardMapper.insertSuggestWrite", rs);
	}

	// 레시피 제안 조회수 카운트
	public int updateCount(int rb_num) {
		return sqlSession.update("NoticeboardMapper.updatecountSuggestWrite", rb_num);
	}

	// 레시피 제안 상세보기
	public ServiceCenterRecipeSuggestBoard selectSuggestWrite(int rb_num) {
		return sqlSession.selectOne("NoticeboardMapper.selectSuggestWrite", rb_num);
	}

	// 레시피 제안 삭제
	public int deleteSuggestWrite(int rb_num) {
		return sqlSession.update("NoticeboardMapper.deleteSuggestWrite", rb_num);
	}

	// 레시피 제안 수정
	public int recipeSuggestUpdateBoard(ServiceCenterRecipeSuggestBoard rcb) {
		System.out.println("sDao");
		System.out.println(rcb);
		return sqlSession.update("NoticeboardMapper.updateSuggestWrite", rcb);
	}

	// 레시피 제안 좋아요
	public int RecipeLikey(int rb_num) {
		ServiceCenterRecipeSuggestBoard rcb = new ServiceCenterRecipeSuggestBoard();
		rcb.setRb_num(rb_num);

		return sqlSession.update("NoticeboardMapper.RecipeLikey", rcb);
	}

	// 레시피 제안 좋아요 체크
	public int checklike(ServiceCenterBoardLike scb) {
		return sqlSession.selectOne("NoticeboardMapper.RecipecheckLike", scb);
	}

	// 레시피 제안 좋아요 클릭
	public int addUserlike(ServiceCenterBoardLike scb) {
		return sqlSession.update("NoticeboardMapper.RecipeCreateLike", scb);
	}

	// 레시피 제안 좋아요 취소
	public int deleteUserlike(ServiceCenterBoardLike scb) {
		return sqlSession.delete("NoticeboardMapper.RecipedeleteLike", scb);
	}
	

	
}
