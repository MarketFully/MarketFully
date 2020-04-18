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
	

}
