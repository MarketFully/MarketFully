package com.kh.market.member.model.service;

import com.kh.market.member.model.vo.Member;

public interface MemberService {

	/**
	 * 1. 회원 로그인 
	 * @param m
	 * @return
	 */
	Member loginMember(Member m);

	/**
	 * 2. id 중복체크 
	 * @param MEM_ID
	 * @return
	 */
	int idCheck(String MEM_ID);

	/**
	 * 3. 회원 가입
	 * @param m
	 * @return
	 */
	int insertMember(Member m);
	
	

}
