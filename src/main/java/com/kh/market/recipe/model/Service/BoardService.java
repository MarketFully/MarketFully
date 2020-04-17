package com.kh.market.recipe.model.Service;

import java.util.ArrayList;

import com.kh.market.recipe.model.vo.Board;
import com.kh.market.recipe.model.vo.Menu_Category;
import com.kh.market.recipe.model.vo.PageInfo;
import com.kh.market.recipe.model.vo.SearchInfo;

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
	ArrayList<Board> TvBoardList(PageInfo pi, int mc_cate_num);
	int getTvListCount(int mc_cate_num);

	/**
	 * 카테고리 리스트
	 * @param mC_CATE_NUM
	 * @return
	 */
	ArrayList<Menu_Category> TvCateList();
	
	Board USERselectBoard(int bId);

	Board TVselectBoard(int bId);

	/**tv서치 리스트 카운트
	 * @param si
	 * @return
	 */
	int getTvSearchListCount(SearchInfo si);

	/**tv서치 리스트
	 * @param pi
	 * @param si
	 * @return
	 */
	ArrayList<Board> TvSearchList(PageInfo pi, SearchInfo si);
	
}
