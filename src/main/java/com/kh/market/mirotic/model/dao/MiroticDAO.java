package com.kh.market.mirotic.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.member.model.vo.MyBag;

@Repository("mrtDao")
public class MiroticDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int updateCartList(ArrayList<MyBag> cartList) {

		return sqlSession.update("miroticMapper.updateCartList");
	}

}
