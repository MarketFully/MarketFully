package com.kh.market.recipe.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.recipe.model.vo.Board;

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

}
