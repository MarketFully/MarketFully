package com.kh.market.recipe.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.recipe.model.vo.Board;
import com.kh.market.recipe.model.vo.Menu_Category;
import com.kh.market.recipe.model.vo.PageInfo;

@Repository("bDao")
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Board> TvTop10selectList() {
		
		return (ArrayList)sqlSession.selectList("TVboardMapper.TvTop10selectList");
	}

	public ArrayList<Board> UserTop10selectList() {
		
		return (ArrayList)sqlSession.selectList("USERboardMapper.UserTop10selectList");
	}

	public ArrayList<Menu_Category> TvCateList() {
		
		return (ArrayList)sqlSession.selectList("TVboardMapper.TvCateList");
	}
	
	public int getListCount() {
		
		return sqlSession.selectOne("USERboardMapper.getListCount");
	}
	
	public ArrayList<Board> UserselectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("USERboardMapper.UserselectList",null,rowBounds);
		
	}
	
	public Board selectBoard(int bId) {
		
		return sqlSession.selectOne("USERboardMapper.selectBoard",bId);
	}

	public int updateCount(int bId) {
		
		return sqlSession.update("USERboardMapper.updateCount",bId);
	}

}
