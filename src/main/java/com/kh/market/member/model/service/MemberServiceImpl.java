package com.kh.market.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.member.model.dao.MemberDao;
import com.kh.market.member.model.vo.Member;


@Service("mService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	// 회원 로그인
	@Override
	public Member loginMember(Member m) {
		Member loginUser = mDao.loginMember(m);
		
		return loginUser;
	}

	// 아이디 중복 체크
	@Override
	public int idCheck(String MEM_ID) {
		System.out.println(MEM_ID);
		return mDao.idCheck(MEM_ID);

	}

	// 회원 가입
	@Override
	public int insertMember(Member m) {
		int result = mDao.insertMember(m);
		
		return result;
	}
	
	// 회원 탈퇴
	@Override
	public int deleteMember(String id) {
		return mDao.deleteMember(id);
	}

	// 회원 정보 수정
	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(m);
	}
}
