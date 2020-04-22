package com.kh.market.recipe.model.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.member.model.vo.Favorite;
import com.kh.market.product.model.vo.Product;
import com.kh.market.recipe.model.dao.BoardDao;
import com.kh.market.recipe.model.vo.Board;
import com.kh.market.recipe.model.vo.BoardProduct;
import com.kh.market.recipe.model.vo.BoardReply;
import com.kh.market.recipe.model.vo.Menu_Category;
import com.kh.market.recipe.model.vo.PageInfo;
import com.kh.market.recipe.model.vo.SearchInfo;

@Service("bService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao bDao;

	@Override
	public ArrayList<Board> TvTop10selectList() {
		
		return bDao.TvTop10selectList();
	}

	@Override
	public ArrayList<Board> UserTop10selectList() {
		
		return bDao.UserTop10selectList();
	}

	@Override
	public ArrayList<Board> TvBoardList(PageInfo pi, int mc_cate_num) {
		
		return bDao.TvBoardList(pi, mc_cate_num);
	}


	@Override
	public ArrayList<Menu_Category> TvCateList() {
		
		return bDao.TvCateList();
	}
	
	@Override
	public int getListCount() {
		
		return bDao.getListCount();
	}

	@Override
	public ArrayList<Board> UserselectList(PageInfo pi) {
		
		return bDao.UserselectList(pi);
	}
	
	@Override
	public Board USERselectBoard(int bId) {
		int result = bDao.USERupdateCount(bId);
		
		if(result > 0) {
			return bDao.USERselectBoard(bId);
		}else {
			return null;
		}
	}

	@Override
	public Board TVselectBoard(int bId) {
		int result = bDao.TVupdateCount(bId);
		
		if(result > 0) {
			return bDao.TVselectBoard(bId);
		}else {
			return null;
		}
	}


	public int getTvListCount(int mc_cate_num) {
		
		return bDao.getTvListCount(mc_cate_num);
	}

	@Override
	public int getTvSearchListCount(SearchInfo si) {
		
		return bDao.getTvSearchListCount(si);
	}

	@Override
	public ArrayList<Board> TvSearchList(PageInfo pi, SearchInfo si) {
		
		return bDao.tvSearchList(pi, si);
	}
	
	@Override
	public int getUserSearchListCount(SearchInfo si) {
		
		return bDao.getUserSearchListCount(si);
	}

	@Override
	public ArrayList<Board> UserSearchList(PageInfo pi, SearchInfo si) {
		
		return bDao.userSearchList(pi, si);
	}

	@Override
	public ArrayList<Board> MainRandomselectList() {
		
		return bDao.MainRandomselectList();
	}
	
	//유저 레시피 한식 4개 불러오기
	@Override
	public ArrayList<Board> UserselectList_ko() {
		return bDao.UserselectList_ko();
	}
	//유저 레시피 양식 4개 불러오기
	@Override
	public ArrayList<Board> UserselectList_en() {
		return bDao.UserselectList_en();
	}
	//유저 레시피 일식 4개 불러오기
	@Override
	public ArrayList<Board> UserselectList_jp() {
		return bDao.UserselectList_jp();
	}
	//유저 레시피 중식 4개 불러오기
	@Override
	public ArrayList<Board> UserselectList_ch() {
		// TODO Auto-generated method stub
		return bDao.UserselectList_ch();
	}
	//유저 레시피 가터 4개 불러오기
	@Override
	public ArrayList<Board> UserselectList_etc() {
		// TODO Auto-generated method stub
		return bDao.UserselectList_etc();
	}
	//유저 좋아요 더하기 
	@Override
	public int USERheartPlus(Favorite f) {
		return bDao.USERheartPlus(f);
	}
	//TV 좋아요 더하기
	@Override
	public int TVheartPlus(Favorite f) {
		return bDao.TVheartPlus(f);
	}

	@Override
	public int USERheartMinus(Favorite f) {
		return bDao.USERheartMinus(f);
	}

	@Override
	public int TVheartMinus(Favorite f) {
		return bDao.TVheartMinus(f);
	}
	
	// user 게시판 댓글 추가
	@Override
	public int userInsertReply(BoardReply r) {
		return bDao.userInsertReply(r);
	}


	// tv 게시판 댓글 추가
	@Override
	public int tvInsertReply(BoardReply r) {
		return bDao.tvInsertReply(r);
		
	}


}
