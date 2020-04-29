package com.kh.market.recipe.model.Service;

import java.util.ArrayList;

import com.kh.market.member.model.vo.Favorite;
import com.kh.market.recipe.model.vo.Board;
import com.kh.market.recipe.model.vo.BoardExp;
import com.kh.market.recipe.model.vo.BoardProduct;
import com.kh.market.recipe.model.vo.BoardReply;
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
	ArrayList<Board> MainRandomselectList2();
	
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
	int USERheartPlus(Favorite f);
	//TV 좋아요 더하기
	int TVheartPlus(Favorite f);

	int USERheartMinus(Favorite f);

	int TVheartMinus(Favorite f);

	// user레시피 댓글 등록
	int userInsertReply(BoardReply r);

	// tv레시피 댓글 등록
	int tvInsertReply(BoardReply r);
	
	// user레시피 댓글 삭제
	int userDeleteReply(int rId);

	// tv레시피 댓글 삭제
	int tvDeleteReply(int rId);
	//*********************************
	//레시피 작성
	int insertRecipe(Board b);
	
	int insertExpRecipe(BoardExp be);

	int insertProductRecipe(BoardProduct bplist);
	
	int USERheartChek(Favorite f);

	int TVheartCheck(Favorite f);
	
	int insertTVRecipe(Board b);

	int insertExpTVRecipe(BoardExp be);

	int insertProductTVRecipe(BoardProduct boardProduct);

	
}
