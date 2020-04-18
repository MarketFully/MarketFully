package com.kh.market.recipe.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.recipe.model.vo.Board;
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


	public ArrayList<Board> MainRandomselectList() {
		
		return (ArrayList)sqlSession.selectList("TVboardMapper.MainRandomselectList");
	}




	
	
}
