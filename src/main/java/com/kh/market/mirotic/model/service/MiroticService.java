package com.kh.market.mirotic.model.service;

import java.util.ArrayList;

import com.kh.market.member.model.vo.Member;
import com.kh.market.member.model.vo.MyBag;
import com.kh.market.mirotic.model.vo.Mirotic;
import com.kh.market.mirotic.model.vo.SHIPPING;

public interface MiroticService {

	/**
	 * 장바구니에서 받아온 값을 주문전에 db에 담는 메소드
	 * @param mybag
	 * @return
	 */
	int updateCartlist(MyBag mybag);

	/**
	 * 주문 정보 입력
	 * @param mrt
	 * @return
	 */
	int insertMirotic(Mirotic mrt);

	/**
	 * 주문조회
	 * @param mirotic
	 * @return
	 */
	int selectOneMirotic(Mirotic mirotic);

	/**
	 * 성공 업데이트
	 * @param mrt
	 * @return
	 */
	int updateMiroticSuccess(Mirotic mrt);

	/**
	 * 주문 리스트 입력
	 * @param mrtList
	 * @return
	 */
	int insertMiroticList(ArrayList<Mirotic> mrtList);

	/**
	 * 결제완료 제품 -> 배송 테이블 추가
	 * @param shipping
	 * @return
	 */
	int insertShipping(SHIPPING shipping);

	/**
	 * 유저의 결제 목록 가져오기
	 * @param loginUser
	 * @return
	 */
	ArrayList<Mirotic> selectListMirotic(SHIPPING shipping);

}
