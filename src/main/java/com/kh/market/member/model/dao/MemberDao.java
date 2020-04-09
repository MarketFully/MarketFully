package com.kh.market.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 로그인
	public Member loginMember(Member m) {
		return (Member)sqlSession.selectOne("memberMapper.loginMember",m);
	}

	//아이디 중복 체크
	public int idCheck(String MEM_ID) {
		return sqlSession.selectOne("memberMapper.idCheck",MEM_ID);
	}

	// 회원가입
	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	// 회원 탈퇴 
	public int deleteMember(String id) {
		System.out.println(id);
		return sqlSession.delete("memberMapper.deleteMember",id);
	}
	// 회원 정보 수정
	public int updateMember(Member m) {
		System.out.println(m);
		return sqlSession.update("memberMapper.updateMember",m);
	}

}
