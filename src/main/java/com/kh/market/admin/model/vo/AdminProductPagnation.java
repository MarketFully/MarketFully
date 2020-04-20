package com.kh.market.admin.model.vo;

import com.kh.market.admin.model.vo.AdminProductPageInfo;

public class AdminProductPagnation {
	
	public static AdminProductPageInfo getPageInfo(int currentPage, int listCount) {
		
		AdminProductPageInfo pi = null;
		
		int pageLimit = 5; 
		int maxPage; 		
		int startPage;		
		int endPage;		
		
		int boardLimit = 8; 
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit + 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new AdminProductPageInfo(currentPage,listCount,pageLimit,maxPage,startPage,endPage,boardLimit);
		
		return pi;
	}
}













