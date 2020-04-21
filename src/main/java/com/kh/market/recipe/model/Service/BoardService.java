package com.kh.market.recipe.model.Service;

import java.util.ArrayList;

import com.kh.market.product.model.vo.Product;
import com.kh.market.recipe.model.vo.Board;
import com.kh.market.recipe.model.vo.BoardProduct;
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
	
	int getUserSearchListCount(SearchInfo si);

	ArrayList<Board> UserSearchList(PageInfo pi, SearchInfo si);

	ArrayList<Board> MainRandomselectList();
	
	//유저 레시피 한식 4개 불러오기
	ArrayList<Board> UserselectList_ko();
	//유저 레시피 양식 4개 불러오기
	ArrayList<Board> UserselectList_en();
	//유저 레시피 일식 4개 불러오기
	ArrayList<Board> UserselectList_jp();
	//유저 레시피 중식 4개 불러오기
	ArrayList<Board> UserselectList_ch();
	//유저 레시피 기타 4개 불러오기
	ArrayList<Board> UserselectList_etc();
	//유저 좋아요 더하기
	int USERheartPlus(int bId);
	//TV 좋아요 더하기
	int TVheartPlus(int bId);

	int USERheartMinus(int bId);

	int TVheartMinus(int bId);
	
}
