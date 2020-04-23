package com.kh.market.mirotic.model.service;

import java.util.ArrayList;

import com.kh.market.member.model.vo.MyBag;

public interface MiroticService {

	/**
	 * 장바구니에서 받아온 값을 주문전에 db에 담는 메소드
	 * @param cartList
	 * @return
	 */
	int updateCartlist(ArrayList<MyBag> cartList);

}
