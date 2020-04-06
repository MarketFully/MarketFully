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
}
