package com.kh.market.mirotic.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.member.model.vo.MyBag;
import com.kh.market.mirotic.model.dao.MiroticDAO;

@Service("mrtService")
public class MiroticServiceImpl implements MiroticService{

	@Autowired
	private MiroticDAO mrtDao;
	
	@Override
	public int updateCartlist(ArrayList<MyBag> cartList) {
		// TODO Auto-generated method stub
		return mrtDao.updateCartList(cartList);
	}



}
