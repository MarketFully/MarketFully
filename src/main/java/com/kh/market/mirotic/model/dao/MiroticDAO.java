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
		return sqlSession.selectOne("miroticMapper.selectOneMirotic", mirotic);
	}

	public int updateMiroticSuccess(Mirotic mrt) {
		// TODO Auto-generated method stub
		int result=0;
		
		
		result=sqlSession.update("miroticMapper.updateMiroticSuccess", mrt);
		
		
		result=sqlSession.update("miroticMapper.updateProductEntity", mrt);
		
		
		return result;
	}

	public int insertMiroticList(ArrayList<Mirotic> mrtList) {

		//return sqlSession.insert("miroticMapper.insertMiroticList", mrtList);
		int result = 0;
		result = sqlSession.insert("miroticMapper.insertMiroticList", mrtList);
		
		//�ֹ���ȣ ����
		if (result>0) {
			result = sqlSession.selectOne("miroticMapper.returnOrNum");
		}else {
			return -1;
		}
		
		return result;
	}

	public int insertShipping(SHIPPING shipping) {
		
		return sqlSession.insert("miroticMapper.insertShipping",shipping);
	}

	public void updateListProduct(ArrayList<MyBag> cartList) {
		
		
	}

	public ArrayList<Mirotic> selectListMirotic(SHIPPING shipping) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("miroticMapper.selectListMirotic", shipping);
	}

	public int updateShipping(SHIPPING shipping) {
		
		return sqlSession.update("miroticMapper.updateShipping", shipping);
	}
	
	public int updateShipping_Mirotic(SHIPPING sh) {
		
		return sqlSession.update("miroticMapper.updateShipping_Mirotic", sh);
	}

}
