package com.kh.market.mirotic.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.member.model.vo.MyBag;
import com.kh.market.mirotic.model.dao.MiroticDAO;
import com.kh.market.mirotic.model.vo.Mirotic;

@Service("mrtService")
public class MiroticServiceImpl implements MiroticService{

	@Autowired
	private MiroticDAO mrtDao;
	
	@Override
	public int updateCartlist(MyBag mybag) {
		// TODO Auto-generated method stub
		return mrtDao.updateCartList(mybag);
	}

	@Override
	public int insertMirotic(Mirotic mrt) {
		
		return mrtDao.insertMirotic(mrt);
	}

	@Override
	public int selectOneMirotic(Mirotic mirotic) {
		return mrtDao.selectOneMirotic(mirotic);
	}

	@Override
	public int updateMiroticSuccess(Mirotic mrt) {
		
		return mrtDao.updateMiroticSuccess(mrt);
	}

	@Override
	public int insertMiroticList(ArrayList<Mirotic> mrtList) {
		// TODO Auto-generated method stub
		return mrtDao.insertMiroticList(mrtList);
	}



}
