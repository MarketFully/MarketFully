package com.kh.market.recipe.model.service;

import java.util.ArrayList;

import com.kh.market.recipe.model.vo.Board;

public interface BoardService {
	
	// TvTop10 레시피 조회
	ArrayList<Board> TvTop10selectList();
	
	// UserTop10 레시피 조회
	ArrayList<Board> UserTop10selectList();
	
}
