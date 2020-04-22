package com.kh.market.common;

import com.kh.market.servicecenter.model.vo.ServiceCenterRecipeSuggestPageInfo;

public class Pagination_RecipeSuggest {
	
	public static ServiceCenterRecipeSuggestPageInfo getRecipeSuggestPageInfo(int currentPage, int listCount) {
		
		ServiceCenterRecipeSuggestPageInfo rpi = null;
		
		int pageLimit = 10;
		int maxPage;
		int startPage;
		int endPage;
		
		int boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		if(maxPage < 1) maxPage=1;
		
		startPage = (currentPage - 1) / pageLimit * pageLimit +1;
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		rpi = new ServiceCenterRecipeSuggestPageInfo(currentPage,listCount,pageLimit,maxPage,startPage,endPage,boardLimit);
		
		return rpi;
	}
}
