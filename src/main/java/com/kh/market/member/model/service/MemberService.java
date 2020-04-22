package com.kh.market.member.model.service;

import java.util.ArrayList;

import com.kh.market.member.model.vo.Favorite;
import com.kh.market.member.model.vo.Member;
import com.kh.market.member.model.vo.MyBag;
import com.kh.market.member.model.vo.MypageOrderPageInfo;
import com.kh.market.member.model.vo.MypageloverecipePageInfo;
import com.kh.market.mirotic.model.vo.Mirotic;
import com.kh.market.product.model.vo.Product;

public interface MemberService {

	/**
	 * 1. 회원 로그인 
	 * @param m
	 * @return
	 */
	Member loginMember(Member m);

	/**
	 * 2. id 중복체크 
	 * @param mem_id
	 * @return
	 */
	int idCheck(String mem_id);

	/**
	 * 3. 회원 가입
	 * @param m
	 * @return
	 */
	int insertMember(Member m);
	
	/**
	 * 4.이메일 인증 후 DB 값 변경
	 * @param mem_id
	 * @return
	 */
	Member changeMemcert(String mem_id);
	

	/**
	 * 회원 탈퇴를 위한 메소드
	 * @param id
	 * @return
	 */
	int deleteMember(String id);

	/**
	 * 회원 정보 수정 서비스를 위한 메소드
	 * @param m
	 * @return
	 */
	int updateMember(Member m);
	
	
	/**
	 * 5. 아이디 찾기 
	 * @param m
	 * @return
	 */
	Member idfind(Member m);


	/**
	 * 6. 비밀번호 찾기
	 * @param m
	 * @return
	 */
	Member pwdfind(Member m);

	
	/**
	 * 7. 임시 비밀번호 (비밀번호 값 변경)
	 * @param mem_name
	 * @param mem_id
	 * @param mem_email
	 * @return
	 */
	int changePwd(Member m);
	
	/**
	 * 마이페이지 주문 내역 리스트 갯수 조회
	 * @param mem_num 
	 * @return
	 */
	int getOrderListCount(int mem_num);

	/**
	 * 마이페이지 주문 내역 리스트 조회
	 * @param pi
	 * @return
	 */
	ArrayList<Mirotic> selectOrderList(MypageOrderPageInfo pi);

	/**
	 * 마이페이지 찜한 레시피 리스트 갯수 조회
	 * @return
	 */
	int getRecipeListCount(int mem_num);

	/**
	 * 마이페이지 찜한 레시피 리스트 조회
	 * @param pi 
	 * @param string
	 * @return
	 */
	ArrayList<Favorite> selectRecipeList(Member m, MypageloverecipePageInfo pi);

	/**
	 * 마이페이지 헤더 찜한레시피 수 증가
	 * @param m
	 * @return
	 */
	ArrayList<Favorite> selectRecipeList(Member m);
	
	/**
	 * 마이페이지 찜한 레시피 전체 삭제
	 * @param mem_num
	 * @return
	 */
	int deleteRecipeList(int mem_num);
	

	/**
	 * 마이페이지 찜한 레시피 선택 삭제
	 * @param f
	 * @return
	 */
	int oneDeleteRecipeList(Favorite f);

	/**
	 * 장바구니 insert메소드
	 * @param cartList
	 * @return
	 */
	int setMyBagList(ArrayList<MyBag> cartList);

	/**
	 * 상품코드(pcode)에 맞는 상품(Product)을 불러오는 메소드
	 * @param parseInt
	 * @return
	 */
	Product selectOneProduct(int pcode);

	/**
	 * mybag을 비우는 메소드
	 * @param mybag
	 * @return
	 */
	int deleteMybag(MyBag mybag);

	/**
	 * cartList를 불러옴
	 * @param loginUser
	 * @return
	 */
	ArrayList<MyBag> selectListProduct(Member loginUser);

	/**
	 * 장바구니 부분 삭제
	 * @param mybag
	 * @return
	 */
	int selectDeleteMybag(MyBag mybag);
}
