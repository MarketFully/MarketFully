package com.kh.market.mirotic.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.member.model.vo.MyBag;
import com.kh.market.mirotic.model.vo.Mirotic;
import com.kh.market.mirotic.model.vo.SHIPPING;

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

		//return sqlSession.insert("miroticMapper.insertMiroticList", mrtList);
		int result = 0;
		result = sqlSession.insert("miroticMapper.insertMiroticList", mrtList);
		
		//주문번호 리턴
		if (result>0) {
			result = sqlSession.selectOne("miroticMapper.returnOrNum");
		}else {
			return -1;
		}
		
		return result;
	}

	public int insertShipping(SHIPPING shipping) {
		
		System.out.println("shipping : "+ shipping);
		return sqlSession.insert("miroticMapper.insertShipping",shipping);
	}

	public void updateListProduct(ArrayList<MyBag> cartList) {
		
		
	}

}
