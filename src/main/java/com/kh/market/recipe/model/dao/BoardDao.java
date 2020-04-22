package com.kh.market.recipe.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.member.model.vo.Favorite;
import com.kh.market.product.model.vo.Product;
import com.kh.market.recipe.model.vo.Board;
import com.kh.market.recipe.model.vo.BoardProduct;
import com.kh.market.recipe.model.vo.BoardReply;
import com.kh.market.recipe.model.vo.Menu_Category;
import com.kh.market.recipe.model.vo.PageInfo;
import com.kh.market.recipe.model.vo.SearchInfo;

@Repository("bDao")
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	//----------------TVboardMapper---------------------------------
	
	
	public ArrayList<Board> TvTop10selectList() {
		
		return (ArrayList)sqlSession.selectList("TVboardMapper.TvTop10selectList");
	}


	public ArrayList<Menu_Category> TvCateList() {
		
		return (ArrayList)sqlSession.selectList("TVboardMapper.TvCateList");
	}
	
	public ArrayList<Board> TvBoardList(int cNum) {
		return (ArrayList)sqlSession.selectList("TVboardMapper.tvBoardList", cNum);
	}
	
	public int getTvListCount(int mc_cate_num) {
		
		return sqlSession.selectOne("TVboardMapper.tvListCount", mc_cate_num);
	}
	
	public ArrayList<Board> TvBoardList(PageInfo pi, int mc_cate_num) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("TVboardMapper.tvBoardList",mc_cate_num, rowBounds);
	}
	
	
	public int getTvSearchListCount(SearchInfo si) {
		return sqlSession.selectOne("TVboardMapper.tvSearchListCount", si);
	}
	
	
	public ArrayList<Board> tvSearchList(PageInfo pi, SearchInfo si) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("TVboardMapper.tvSearchList",si,rowBounds);
	}
	
	
	
	
	
	
	//----------------USERboardMapper---------------------------------
	
	public ArrayList<Board> UserTop10selectList() {
		
		return (ArrayList)sqlSession.selectList("USERboardMapper.UserTop10selectList");
	}
	
	public int getListCount() {
		
		return sqlSession.selectOne("USERboardMapper.getListCount");
	}
	
	public ArrayList<Board> UserselectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("USERboardMapper.UserselectList",null,rowBounds);
		
	}
	
	public Board USERselectBoard(int bId) {
		
		return sqlSession.selectOne("USERboardMapper.selectBoard",bId);
	}
	
	public Board TVselectBoard(int bId) {
		
		return sqlSession.selectOne("TVboardMapper.selectBoard",bId);
	}

	public int USERupdateCount(int bId) {
		
		return sqlSession.update("USERboardMapper.updateCount",bId);
	}


	public int TVupdateCount(int bId) {
		
		return sqlSession.update("TVboardMapper.updateCount",bId);
	}
	
	public int getUserSearchListCount(SearchInfo si) {
		
		return sqlSession.selectOne("USERboardMapper.userSearchListCount", si);
	}


	public ArrayList<Board> userSearchList(PageInfo pi, SearchInfo si) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("USERboardMapper.userSearchList",si,rowBounds);
	}

	public ArrayList<Board> MainRandomselectList() {
		
		return (ArrayList)sqlSession.selectList("TVboardMapper.MainRandomselectList");
	}
	
	public ArrayList<Board> MainRandomselectList2() {
		
		return (ArrayList)sqlSession.selectList("USERboardMapper.MainRandomselectList2");
	}

	//유저 레시피 한식 4개 불러오기
	public ArrayList<Board> UserselectList_ko() {
		return (ArrayList)sqlSession.selectList("USERboardMapper.UserselectList_ko");
	}
	//유저 레시피 양식 4개 불러오기
	public ArrayList<Board> UserselectList_en() {
		return (ArrayList)sqlSession.selectList("USERboardMapper.UserselectList_en");
	}
	//유저 레시피 일식 4개 불러오기
	public ArrayList<Board> UserselectList_jp() {
		return (ArrayList)sqlSession.selectList("USERboardMapper.UserselectList_jp");
	}
	//유저 레시피 중식 4개 불러오기
	public ArrayList<Board> UserselectList_ch() {
		
		return (ArrayList)sqlSession.selectList("USERboardMapper.UserselectList_ch");
	}
	//유저 레시피 기타 4개 불러오기
	public ArrayList<Board> UserselectList_etc() {
		
		return (ArrayList)sqlSession.selectList("USERboardMapper.UserselectList_etc");
	}
	
	//좋아요 더하기
	public int USERheartPlus(Favorite f) {
		return sqlSession.insert("USERboardMapper.USERheartPlus",f);
	}

	public int TVheartPlus(Favorite f) {
		return sqlSession.insert("TVboardMapper.TVheartPlus",f);
	}

	public int USERheartMinus(Favorite f) {
		return sqlSession.insert("USERboardMapper.USERheartMinus",f);
	}


	public int TVheartMinus(Favorite f) {
		return sqlSession.insert("TVboardMapper.TVheartMinus",f);
	}


	// user 댓글 등록
	public int userInsertReply(BoardReply r) {
		return sqlSession.insert("USERboardMapper.userInsertReply", r);
	}

	// tv 댓글 등록
	public int tvInsertReply(BoardReply r) {
		return sqlSession.insert("TVboardMapper.tvInsertReply", r);

	}






	
	
}
