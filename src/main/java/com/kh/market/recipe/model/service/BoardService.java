package com.kh.market.recipe.model.service;

import java.util.ArrayList;

import com.kh.market.recipe.model.vo.Board;
import com.kh.market.recipe.model.vo.Menu_Category;

public interface BoardService {
	
	// TvTop10 레시피 조회
	ArrayList<Board> TvTop10selectList();
	
	// UserTop10 레시피 조회
	ArrayList<Board> UserTop10selectList();



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
	
}
