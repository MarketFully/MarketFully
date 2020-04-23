package com.kh.market.mirotic.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.member.model.vo.MyBag;
import com.kh.market.mirotic.model.vo.Mirotic;

@Repository("mrtDao")
public class MiroticDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int updateCartList(MyBag mybag) {

		return sqlSession.update("miroticMapper.updateCartList", mybag);
	}

	public int insertMirotic(Mirotic mrt) {
		return sqlSession.insert("miroticMapper.insertMirotic", mrt);
	}

	public int selectOneMirotic(Mirotic mirotic) {
		System.out.println("selectOneMirotic value : "+ mirotic);
		return sqlSession.selectOne("miroticMapper.selectOneMirotic", mirotic);
	}

	public int updateMiroticSuccess(Mirotic mrt) {
		// TODO Auto-generated method stub
		return sqlSession.update("miroticMapper.updateMiroticSuccess", mrt);
	}

	public int insertMiroticList(ArrayList<Mirotic> mrtList) {
		// TODO Auto-generated method stub
		return sqlSession.insert("miroticMapper.insertMiroticList", mrtList);
	}

}
