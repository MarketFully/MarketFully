package com.kh.market.recipe.model.Service;

import java.util.ArrayList;

import com.kh.market.recipe.model.vo.Board;
import com.kh.market.recipe.model.vo.Menu_Category;
import com.kh.market.recipe.model.vo.PageInfo;

public interface BoardService {
	
	// TvTop10 레시피 조회
	ArrayList<Board> TvTop10selectList();
	
	// UserTop10 레시피 조회
	ArrayList<Board> UserTop10selectList();

	// 페이징을 위한 전체 게시물 수
	int getListCount();
	
	// 유저 레시피 조회 
	ArrayList<Board> UserselectList(PageInfo pi);


	/**
	 * 게시판 리스트
	 * @param mC_CATE_NUM
	 * @return
	 */
	ArrayList<Board> TvBoardList(int mC_CATE_NUM);

	/**
	 * 카테고리 리스트
	 * @param mC_CATE_NUM
	 * @return
	 */
	ArrayList<Menu_Category> TvCateList();
	
	Board selectBoard(int bId);
	
}
