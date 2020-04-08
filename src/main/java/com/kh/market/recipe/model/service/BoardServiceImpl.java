package com.kh.market.recipe.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.recipe.model.dao.BoardDao;
import com.kh.market.recipe.model.vo.Board;
import com.kh.market.recipe.model.vo.Menu_Category;

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
	public ArrayList<Board> TvBoardList(int mC_CATE_NUM) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Menu_Category> TvCateList() {
		
		return bDao.TvCateList();
	}

}
