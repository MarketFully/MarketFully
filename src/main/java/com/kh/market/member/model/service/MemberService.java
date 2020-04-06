package com.kh.market.member.model.service;

import com.kh.market.member.model.vo.Member;

public interface MemberService {

	/**
	 * 1. 회원 로그인 
	 * @param m
	 * @return
	 */
	Member loginMember(Member m);
	
	

}
